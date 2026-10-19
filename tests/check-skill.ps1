# Skill 结构与关键规则检查（文档 lint）
# 检查：frontmatter 格式、引用文件是否存在、关键规则原文是否仍在。
# 它不能证明 Agent 的实际行为；行为测试见 tests/scenarios.md 与 tests/acceptance.md。
# 有意改写某条规则的措辞时，请同步更新下面对应的 Pattern。
# 用法（在仓库根目录）：powershell -ExecutionPolicy Bypass -File tests/check-skill.ps1

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$skillDir = Join-Path $root 'skills/operating-jlceda-pro'
$refDir = Join-Path $skillDir 'references'
$failed = @()

function Read-Text($path) { Get-Content -Raw -Encoding UTF8 $path }
function Check($name, $ok) {
    if ($ok) { Write-Host "PASS: $name" } else { Write-Host "FAIL: $name"; $script:failed += $name }
}

# 1. frontmatter
$skill = Read-Text (Join-Path $skillDir 'SKILL.md')
$fm = [regex]::Match($skill, '(?s)^---\r?\n(.*?)\r?\n---')
Check 'SKILL.md 有 frontmatter' $fm.Success
if ($fm.Success) {
    Check 'name 为 operating-jlceda-pro' ($fm.Groups[1].Value -match '(?m)^name:\s*operating-jlceda-pro\s*$')
    $desc = [regex]::Match($fm.Groups[1].Value, '(?m)^description:\s*"?(.*?)"?\s*$').Groups[1].Value
    Check 'description 非空且不超过 1024 字符' (($desc.Length -gt 0) -and ($desc.Length -le 1024))
}

# 2. 引用的 references 文件都存在
$all = @($skill) + (Get-ChildItem $refDir -Filter *.md | ForEach-Object { Read-Text $_.FullName })
$names = ($all -join "`n" | Select-String -Pattern '([a-z\-]+\.md)' -AllMatches).Matches | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
foreach ($n in $names) {
    if ($n -eq 'SKILL.md') { continue }
    Check "引用文件存在：$n" (Test-Path (Join-Path $refDir $n))
}

# 3. 关键规则
$r = @{}
Get-ChildItem $refDir -Filter *.md | ForEach-Object { $r[$_.Name] = Read-Text $_.FullName }
$checks = @(
    @{ Name = '教程是操作方法的第一依据'; Text = $skill; Pattern = '画图逻辑与教程一致' },
    @{ Name = '教程拿不到时请用户提供'; Text = $r['tutorials.md']; Pattern = '停下来请用户提供该教程' },
    @{ Name = '十字交叉默认不连接'; Text = $r['tutorials.md']; Pattern = '导线十字交叉默认**不连接**' },
    @{ Name = '图片默认按图复刻'; Text = $r['layout-fidelity.md']; Pattern = '器件摆放和接线方式上与原图一致' },
    @{ Name = '版面表先确认再开画'; Text = $r['layout-fidelity.md']; Pattern = '给用户确认后再开画' },
    @{ Name = '不擅自新建符号'; Text = $r['layout-fidelity.md']; Pattern = '不自己新建或修改符号' },
    @{ Name = '模糊交叉必须提问'; Text = $r['intake.md']; Pattern = '不按任一默认处理' },
    @{ Name = '关键属性读两次'; Text = $skill; Pattern = '读两次' },
    @{ Name = '同步后非预期变化要停'; Text = $r['pcb.md']; Pattern = '未经用户明确授权，不得重新布线' },
    @{ Name = '自动布线保留已有走线'; Text = $r['pcb.md']; Pattern = '保持“保留”' },
    @{ Name = '教程数值不作默认'; Text = $r['pcb.md']; Pattern = '不能作为本项目的默认值' },
    @{ Name = '区分编辑验收与生产就绪'; Text = $r['report.md']; Pattern = '生产就绪未验证' },
    @{ Name = '无桌面能力时不操作界面'; Text = $skill; Pattern = '没有时不要尝试操作界面' },
    @{ Name = 'DeepSeek 截图隐私提醒'; Text = $r['platforms.md']; Pattern = '截图会发到第三方服务' }
)
foreach ($c in $checks) {
    Check $c.Name (($null -ne $c.Text) -and $c.Text.Contains($c.Pattern))
}

if ($failed.Count -gt 0) { throw "检查失败：$($failed -join '；')" }
Write-Host '全部检查通过。'

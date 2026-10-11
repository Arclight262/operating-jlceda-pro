$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$skill = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'skills/operating-jlceda-pro/SKILL.md')
$workflows = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'skills/operating-jlceda-pro/references/workflows.md')
$schematic = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'skills/operating-jlceda-pro/references/schematic.md')
$pcb = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'skills/operating-jlceda-pro/references/pcb.md')

$checks = @(
    @{ Name = '关键属性连续两次稳定读取'; Text = $workflows; Pattern = '连续两次观察一致' },
    @{ Name = '工程路径以重开后的最终状态为准'; Text = $workflows; Pattern = '重新打开后的最终路径' },
    @{ Name = '原理图保留客户端实际检查名称'; Text = $schematic; Pattern = '检查DRC' },
    @{ Name = '库冲突拆分核验'; Text = $pcb; Pattern = '供应商属性和 3D 模型' },
    @{ Name = 'PCB 同步前后比较'; Text = $pcb; Pattern = '同步前后差异' },
    @{ Name = '非预期清线必须停止'; Text = $pcb; Pattern = '未经用户明确授权不得重新布线' },
    @{ Name = '区分编辑验收与生产就绪'; Text = $skill; Pattern = '编辑验收通过' },
    @{ Name = '生产结论不得仅依赖 DRC'; Text = $pcb; Pattern = '生产就绪未验证' },
    @{ Name = '规则必须记录适用性'; Text = $workflows; Pattern = '适用、待确认或不适用' },
    @{ Name = '固定数值必须记录来源'; Text = $workflows; Pattern = '约束来源' },
    @{ Name = '先建立功能块风险画像'; Text = $pcb; Pattern = '功能块风险画像' },
    @{ Name = '不创建不存在的专用约束'; Text = $pcb; Pattern = '不得为不存在的接口或功能块添加约束' },
    @{ Name = '自动布线只处理获准普通网络'; Text = $pcb; Pattern = '自动布线只能用于用户明确允许的普通网络' },
    @{ Name = '选型核对工作包线'; Text = $schematic; Pattern = '工作电压、电流、功耗、容差、耐压' }
)

$failed = @()
foreach ($check in $checks) {
    if ($check.Text -notmatch [regex]::Escape($check.Pattern)) {
        $failed += $check.Name
        Write-Host "FAIL: $($check.Name)"
    } else {
        Write-Host "PASS: $($check.Name)"
    }
}

if ($failed.Count -gt 0) {
    throw "契约检查失败：$($failed -join '；')"
}

Write-Host '全部契约检查通过。'

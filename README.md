# 嘉立创EDA 绘图 Skill（operating-jlceda-pro）

让 AI Agent 操作 Windows 版嘉立创EDA专业版：你给一张原理图图片或一段文字描述，它在客户端里帮你画出原理图，需要时继续做 PCB。

适用于 **Claude Code**、**Codex** 和 **DeepSeek Harness**，前提是当前环境能操作桌面。

## 特点

- **按图复刻**：器件位置、朝向、走线和连接点都与原图一致，不只是电气连接对得上。
- **跟着官方教程操作**：入口、快捷键和步骤以[嘉立创EDA学习中心](https://prodocs.lceda.cn/cn/)为准。
- **看不清就问**：模糊的型号、数值、极性和交叉点，会标出位置后一次性问你，不会猜着画。

## 快速开始

**1. 安装**：把 `skills/operating-jlceda-pro` 文件夹放到对应位置。

| 平台 | 放在哪里 | 需要的桌面操作能力 |
|---|---|---|
| Claude | `%USERPROFILE%\.claude\skills\`，或压缩成 zip 在桌面应用里上传 | 桌面应用开启电脑操作 |
| Codex | `%USERPROFILE%\.codex\skills\` | `computer-use` |
| DeepSeek Harness | 按 Harness 的 Skill 文档 | 社区插件 `dsh-computer-use` |

**2. 打开嘉立创EDA专业版**，然后直接说：

```text
按这张图在嘉立创EDA里画原理图，摆放和接线和图一致，看不清的先问我。
```

**3. 确认三张表**：Agent 动手前会先列出器件表、网络表和版面表（图片输入时）让你确认。确认后开始画，每完成一部分会汇报一次，最后给出检查结果和需要你处理的事项。

> 提前说明这些信息可以少来回确认：工程名、只画原理图还是也做 PCB、贴片还是通孔、是否打算在嘉立创下单。

## 验证情况

| 平台 | 状态 |
|---|---|
| Claude | 已在 V4.1.60 上按图复刻一张 AMS1117 电源原理图，DRC 0 错误 0 警告；PCB 未测 |
| Codex | v1 已在 V4.1.60 上完成原理图和 PCB 验收；v2 未测 |
| DeepSeek Harness | 未测 |

## 限制

- 只做原理图和 PCB，不导出生产文件，也不下单。
- DRC 通过不代表可以直接生产，电源、EMC、热设计和工艺仍需人工复核。
- 库里的符号引脚排布可能和图片不同，个别版面差异需要你决定怎么处理。

<details>
<summary>文件结构</summary>

```text
skills/operating-jlceda-pro/
  SKILL.md               入口
  references/
    tutorials.md         学习中心教程索引（操作方法的第一依据）
    platforms.md         各平台的安装与适配
    intake.md            需求整理、读图、提问方式
    layout-fidelity.md   按图复刻的方法
    schematic.md         原理图流程
    pcb.md               PCB 流程
    ui-reference.md      客户端实测记录
    report.md            完成报告模板
tests/                   行为场景、验收方案、检查脚本
archive/v1/              v1 归档
```

</details>

## 许可证

[MIT](LICENSE)

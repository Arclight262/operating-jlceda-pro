---
name: operating-jlceda-pro
description: "Use when Codex must operate the Windows JLCEDA Professional desktop client to create or edit schematics and PCBs from natural-language requirements, reference images, or an existing project."
---

# 操作嘉立创 EDA 专业版

执行任何界面操作前，必须先加载并遵守 `computer-use:computer-use`。本 Skill 只覆盖 Windows 客户端中的原理图和 PCB；不导出 BOM、Gerber 或坐标文件，也不直接改写工程内部文件。

## 入口

先读 [workflows.md](references/workflows.md)，按输入类型选择路线。原理图阶段读 [schematic.md](references/schematic.md)，PCB 阶段读 [pcb.md](references/pcb.md)。遇到版本或界面差异时读 [ui-baseline.md](references/ui-baseline.md)。执行验收工程时读 [acceptance.md](references/acceptance.md)。

| 当前任务 | 先决条件 | 必须停止的情况 |
|---|---|---|
| 自然语言新建 | 电气参数和连接已确认 | 缺失信息会影响电气正确性 |
| 图片复刻 | 所有相关项为“已确认” | 型号、数值、极性、引脚或连接模糊 |
| 修改已有工程 | 唯一窗口、工程和目标文件已确认 | 多个候选窗口；原有未保存改动来源未知 |
| 原理图转 PCB | 原理图和封装已核对 | 阻塞问题、封装不明或检查结果未处理 |

## 操作循环

1. 观察当前窗口，确认标题、工程、编辑器和阻挡对话框。
2. 只执行一个可验证的点击、按键、输入或拖拽。
3. 立即重新观察，确认可见结果后再决定下一步。
4. 若动作超时或结果未知，先重新观察；不要盲目重复。
5. 每次界面变化后废弃旧元素索引、截图标识和坐标。

优先使用当前可访问性文本和可见标签；只有在最新截图上才可使用窗口内相对位置。禁止复用历史坐标。找不到可确认的控件或命令时，报告观察事实并停止该操作。

## 歧义门槛

图片中任何影响电气含义的模糊项都必须先询问用户。问题应说明位置、能看清的事实、候选解释、需要补充的内容及影响。确认前不得选择“最可能”或“通用”器件，不得按拓扑猜型号，也不得把“不连接”当作导线交叉的安全默认值。用户仍无法确认时，保留未解决状态；只有用户明确授权才放占位器，并在最终报告列出。

多个相近窗口时列出候选并询问。修改已有工程前若发现来源未知的未保存改动，首次保存前询问处理方式。

## 完成条件

按功能块保存并复查可见状态。原理图需核对器件、参数、极性、引脚、网络与 ERC；PCB 需核对封装、板框、布局、布线、未布网络与 DRC。不得通过删除网络或忽略规则制造零错误。最终报告工程名、已完成内容、保存状态、ERC/DRC 结果、未解决项和可见证据，并区分“已验证版本”与“设计上兼容版本”。

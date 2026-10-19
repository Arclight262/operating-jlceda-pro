---
name: operating-jlceda-pro
description: "Operate the Windows 嘉立创EDA专业版 (JLCEDA Pro / 立创EDA) desktop client through desktop control to draw or edit schematics (原理图) and PCBs from a reference image (图片复刻, keeping component placement and wiring the same as the image) or from a text description. Works in Claude Code, Codex and DeepSeek Harness when a computer-use / desktop-control tool is available. Use when the user asks to draw, replicate or modify a circuit in 嘉立创EDA."
---

# 操作嘉立创 EDA 专业版

根据用户上传的图片或文字描述，在 Windows 版嘉立创EDA专业版客户端里画出原理图，需要时继续完成 PCB。图片输入默认按图复刻：器件摆放和接线走向与图一致，而不只是电气等价。

不做的事：导出 BOM、Gerber、坐标文件；下单；直接改写工程文件（格式未公开，改坏了也无法用客户端检查发现）。

## 来源优先级

1. **当前窗口实际所见**：唯一能证明“现在是什么状态”的证据。
2. **嘉立创EDA学习中心官方教程**（[tutorials.md](references/tutorials.md)）：决定用什么入口、按什么顺序操作。画图逻辑与教程一致，用教程描述的方法，不自创流程。
3. **本 Skill 的实测记录**（[ui-reference.md](references/ui-reference.md)）。
4. 其他文章、视频和模型自己的记忆：不作为操作入口或设计数值的依据。

教程与窗口不一致（版本或快捷键主题不同，菜单名、快捷键对不上）时，按窗口执行并在报告中记录差异。需要的教程不在索引里或读不到、而操作方法又不确定时，请用户提供该教程，不要凭记忆补步骤。

## 开工

1. **平台**：读 [platforms.md](references/platforms.md)，确认当前环境有桌面操作能力（截图、点击、键入）。没有时不要尝试操作界面；按 [intake.md](references/intake.md) 完成需求整理和版面表交给用户，并说明需要启用什么。
2. **环境**：确认是 Windows、客户端已打开、目标窗口唯一。记录客户端版本，以及快捷键主题（专业版主题导线是 `Alt+W`，标准版主题是 `W`）。
3. **需求**：按 `intake.md` 把缺的信息一次问齐，整理出器件表、网络表；图片输入再加版面表。三张表是绘制的唯一依据，开始画之前给用户确认一次。

## 路线

| 输入 | 依次阅读 |
|---|---|
| 图片 | `intake.md` → [layout-fidelity.md](references/layout-fidelity.md) → [schematic.md](references/schematic.md) → 需要时 [pcb.md](references/pcb.md) |
| 文字描述 | `intake.md` → `schematic.md` → 需要时 `pcb.md` |
| 修改已有工程 | `intake.md` 的“修改已有工程” → `schematic.md` 或 `pcb.md` 的相关部分 |

完成后按 [report.md](references/report.md) 汇报。

## 操作循环

按动作风险分两档：

- **高风险**（放置、删除、连线、改属性、转换或更新 PCB、应用修改、保存、自动布线）：一次只做一个，做完立即重新观察，确认结果后再继续。
- **低风险**（缩放、平移视图、展开面板、只选中查看）：可以连续做，最后统一观察一次。

通用规则：

- 动作前先观察：窗口标题、当前编辑器（原理图还是 PCB）、有没有对话框挡着。
- 优先用可访问性文本和可见标签定位；只在最新截图上使用位置坐标，界面一变就作废。不复用历史坐标：窗口尺寸、面板展开都会让控件移位。
- 要写进报告或影响电气判断的属性（位号、值、封装、引脚、网络、检查计数），连同选中对象身份读两次，一致才采用。实测中属性面板偶尔会返回上一个器件的数据。
- 动作超时或结果不明时，先重新观察，不要盲目重复。窗口或会话丢失时重新查找窗口，不能唯一确定就问用户。
- 每次对话框关闭后、每次放置或连线前，先移动一下鼠标，确认画布上的十字光标跟着动，再点击。十字光标不动，说明窗口没有焦点，此时点击会落在旧位置；先点标题栏恢复焦点。
- 连线时把视图放大到能看清引脚端点（引脚间距至少约 20 像素）。部分器件的引脚端点不在网格上，缩放不够时终点会吸附到相邻网格，造成看似连上、实际悬空。

## 必须停下问用户

- 图片中影响电气含义的内容看不清：型号、数值、极性、引脚、连接点。
- 器件或封装有多个候选，选择会影响成品或下单。
- 有多个相似的工程窗口；或已有工程里有来源不明的未保存改动。
- 转换或更新 PCB 后出现非预期的删线、网络变化或器件移动。
- 库符号的引脚排布与图片差别太大，无法按图保持接线走向。
- 需要的教程拿不到，而操作方法不确定。

停下时把当前所有问题按 `intake.md` 的提问格式一次列出，并说明确认后接着做什么。用户确认前，不要用“最可能”的器件、默认连接或占位器顶替。

## 进度与完成

每完成并保存一个功能块，用一到三句话汇报进展。

结论分两级：输入要求、连接、封装和当前规则检查都满足时，报告“编辑验收通过”；只有制造约束、设计规则和关键电气、机械检查都有明确依据并完成后，才可以报告“生产就绪已验证”。DRC 为零或自动布线 100% 不等于可以生产。图片输入还必须通过 `layout-fidelity.md` 的版面核对，电气正确但摆放不一致不算复刻完成。

# operating-jlceda-pro

让 AI Agent 通过桌面操作使用 Windows 版**嘉立创EDA专业版**：根据你上传的原理图图片或文字描述，在客户端里画出原理图，需要时继续完成 PCB。

- **图片输入默认按图复刻**：器件摆放、朝向和接线走向都与图一致，而不只是电气等价。
- **操作方法跟随嘉立创EDA学习中心官方教程**：入口、快捷键和步骤顺序以教程为依据，窗口与教程不符时按窗口执行并记录差异。
- **看不清就问，不猜**：模糊的型号、数值、极性和交叉点会按位置一次性列出来问你。
- **同时适用于 Claude Code、Codex 和 DeepSeek Harness**，只要当前环境有桌面操作能力。

## 安装

同一个 `skills/operating-jlceda-pro` 文件夹三个平台通用。

| 平台 | 安装位置 | 桌面操作 |
|---|---|---|
| Claude Code / Claude 桌面应用 | `%USERPROFILE%\.claude\skills\`；或压缩成 zip 在桌面应用设置中上传 | 桌面应用中开启电脑操作（设置 > 通用 > Enable computer use） |
| Codex | `%USERPROFILE%\.codex\skills\` | `computer-use:computer-use` |
| DeepSeek Harness | 按 Harness 的 Skill 文档放置 | 社区插件 `dsh-computer-use`（非官方）；截图可能发往第三方视觉模型 |

详细说明见 [`platforms.md`](skills/operating-jlceda-pro/references/platforms.md)。只分发 Skill 时打包这个文件夹即可，不要带 `.git`。

## 用法

直接提出请求，例如：

```text
请在嘉立创 EDA 专业版中按这张图画原理图，器件摆放和接线尽量与图一致。看不清的地方先问我。
```

为了少来回确认，最好一次说明：新建还是修改已有工程、工程名、只画原理图还是也做 PCB、贴片还是通孔、是否用嘉立创下单或贴片，以及板框尺寸和线宽要求的依据。

Agent 开画前会先给你确认三张表：器件表、网络表，以及图片输入时的版面表。每完成一个功能块会简短汇报，最后按固定格式报告结论、检查结果和需要你处理的事项。

## 文件结构

```text
skills/operating-jlceda-pro/
  SKILL.md                 入口：来源优先级、开工、操作循环、停止条件
  agents/openai.yaml       Codex 界面信息（其他平台忽略）
  references/
    platforms.md           三个平台的安装与桌面操作映射
    tutorials.md           学习中心教程索引与要点（操作方法第一依据）
    intake.md              需求清单、读图、提问格式、修改已有工程
    layout-fidelity.md     按图复刻：版面表、画布映射、连线、核对
    schematic.md           原理图流程（按教程顺序）
    pcb.md                 PCB 流程、同步安全、约束台账
    ui-reference.md        真实客户端实测记录
    report.md              完成报告模板
tests/
  scenarios.md             16 个行为场景
  acceptance.md            NE555 验收方案（每个平台各跑一遍）
  check-skill.ps1          结构与关键规则检查（文档 lint）
  fixtures/                测试图片
archive/v1/                v1 完整归档，作为参考
```

## 补充教程

`tutorials.md` 收录了编写时读取的学习中心页面要点。Agent 需要的教程不在索引里或读不到时，会请你提供。你提供的教程可以记到 `tutorials.md` 末尾的“用户补充的教程”表中，优先级与官方页面相同。

## 验证状态

| 项目 | 状态 |
|---|---|
| 客户端 | v1 在 `V4.1.60` 上完成真实验收（Codex） |
| v2 | 尚未在任何平台上完成真实验收；按 [`tests/acceptance.md`](tests/acceptance.md) 进行 |
| 行为场景 | v2 的 16 个场景尚未系统运行 |
| Claude 试跑 | 2026-10-19 图片复刻 AMS1117-ADJ 双色指示电源原理图，DRC 0 错误 0 警告；PCB 未测 |
| 文档检查 | `tests/check-skill.ps1` |

在某个平台上跑通验收之前，该平台只能称为“设计上兼容”。

## v2 相对 v1 的变化

- 从头重写，结构按“需求整理 → 版面 → 原理图 → PCB → 报告”组织，篇幅更短。
- 新增学习中心教程索引，操作步骤按官方教程顺序；教程缺失时向用户索取。
- 新增 `layout-fidelity.md`，把“按图摆放与接线一致”做成可执行、可核对的流程。
- 平台无关：用能力映射代替某个平台的工具名，支持 Claude Code、Codex、DeepSeek Harness。
- 保留 v1 实测得到的规则：读两次、不复用坐标、同步前后对比、不擅自重布线、编辑验收与生产就绪分级。

## 已知限制

- 只覆盖原理图和 PCB；不导出生产文件，不下单。
- 图片识别不能保证一次正确，不确定的地方会交给你确认。
- 库符号的引脚排布可能与图片不同，部分版面差异需要你决定如何处理。
- 自动布线通过 DRC 不代表满足电气、EMC、热设计、可制造性或安规要求。

## 许可证

[MIT License](LICENSE)

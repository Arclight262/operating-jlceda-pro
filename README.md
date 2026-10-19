# operating-jlceda-pro

用于操作 Windows 版嘉立创 EDA 专业版的 AI Agent Skill。它可以根据文字要求或参考图片绘制、修改原理图，并在需要时继续处理 PCB。

图片任务默认**按图复刻**：保留元器件的相对位置、朝向、接线走向和连接点，而不只追求电气等价。型号、数值、极性或交叉点看不清时，先向用户确认，不猜测。

> **v2.0.0 状态：**Skill 和文档已重写；跨平台的完整客户端验收尚未完成。请把运行结果视为需要人工复核的设计稿，而非可直接生产的文件。详见[验收方案](tests/acceptance.md)和[平台状态](skills/operating-jlceda-pro/references/platforms.md)。

## 安装

从 [Releases](https://github.com/Arclight262/operating-jlceda-pro/releases) 下载 v2，解压后将 `skills/operating-jlceda-pro` 文件夹放到对应的 Skill 目录：

| 环境 | 目录 |
|---|---|
| Codex | `%USERPROFILE%\.codex\skills\operating-jlceda-pro` |
| Claude Code | `%USERPROFILE%\.claude\skills\operating-jlceda-pro` |
| DeepSeek Harness | 按 Harness 的 Skill 加载说明放置；v2 尚未实测 |

还需要可用的桌面操作能力，能够观察并控制嘉立创 EDA 客户端。各环境的工具映射和已知限制见[平台适配](skills/operating-jlceda-pro/references/platforms.md)。

## 使用

在支持 Skill 的会话中直接提出任务，例如：

```text
请用 operating-jlceda-pro 在嘉立创EDA专业版中按附件图片复刻原理图。
元器件位置、朝向和接线方式与原图一致；看不清的地方先问我。
```

最好同时说明工程名称、是新建还是修改、是否需要 PCB，以及已有的封装、板框和电气约束。Skill 会先整理器件、网络及图片版面要求，再通过桌面界面操作；保存后核对连接、版面和实际运行的检查结果。它不会直接改写嘉立创工程文件。

## 仓库内容

- [`skills/operating-jlceda-pro/`](skills/operating-jlceda-pro/)：v2 Skill 入口及按任务读取的参考资料。
- [`tests/`](tests/)：行为场景、结构检查脚本和客户端验收方案；结构检查不等于客户端验收。
- [`archive/v1/`](archive/v1/)：v1 内容与当时的验收记录，不作为当前版本安装目录。

v2 的主要变化是把需求整理、按图复刻、原理图、PCB 和结果报告分开，并加入[版面一致性核对](skills/operating-jlceda-pro/references/layout-fidelity.md)。完整变更与验证边界见 [v2.0.0 Release](https://github.com/Arclight262/operating-jlceda-pro/releases/tag/v2.0.0)。

## 边界

本 Skill 不负责生产文件导出或下单。原理图或 PCB 的 DRC 通过，也不能单独证明电气、EMC、热设计、可制造性和安规符合要求。器件、符号、封装及实际连接仍需按具体工程复核。

[MIT License](LICENSE)

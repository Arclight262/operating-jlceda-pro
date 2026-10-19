# 平台适配

本 Skill 的流程不绑定某个平台的工具名，只要求下面五种能力。开工前把它们映射到当前环境的实际工具。

| 能力 | 用途 | 缺失时 |
|---|---|---|
| 观察 | 截图；能读可访问性文本更好 | 停止界面操作 |
| 操作 | 点击、键入、组合键、拖拽 | 停止界面操作 |
| 读图 | 读取用户上传的原理图图片 | 只能处理文字描述 |
| 网页读取 | 打开学习中心教程 | 只用 `tutorials.md` 的摘录；不够时请用户提供教程 |
| 文件复制 | 修改前备份工程文件 | 请用户手动复制 |

能按元素操作（可访问性节点、控件名）时优先于按坐标点击。

## Claude Code / Claude 桌面应用

- **安装**：把 `operating-jlceda-pro` 文件夹复制到 `%USERPROFILE%\.claude\skills\`；在桌面应用对话中使用时，也可以把文件夹压缩成 zip，在设置里作为自定义 Skill 上传。
- **Windows 焦点**：实测中嘉立创窗口有时没有真正拿到焦点，电脑操作工具会判定前台是桌面外壳而拒绝点击。处理方式：申请“文件资源管理器”的点击权限，然后点一下嘉立创标题栏把它切到前台。
- **桌面操作**：使用 Claude 桌面应用的电脑操作功能（设置 > 通用 > Enable computer use；编写时为 Pro、Max 套餐的测试功能，以当前官方说明为准）。环境中列有电脑操作相关的 Skill 时，先读它再操作。Claude 第一次操作某个应用前会请用户授权，授权嘉立创EDA客户端即可。
- **网页读取**：使用环境自带的网页读取工具打开教程。

## Codex

- **安装**：复制到 `%USERPROFILE%\.codex\skills\`，重启或开新会话；可用 `$operating-jlceda-pro` 显式调用。`agents/openai.yaml` 只有 Codex 读取。
- **桌面操作**：加载并遵守 `computer-use:computer-use`。

## DeepSeek Harness

- **安装**：DeepSeek Harness 支持 `SKILL.md` 形式的 Skill，放置位置和加载方式以 Harness 的文档为准。
- **桌面操作**：编写时官方页面没有说明内置的桌面控制。可用社区插件 `dsh-computer-use`（非官方），它的 Windows 原生 provider 提供 `computer_observe`（截图和可访问性树）、`computer_act`（`click-element`、`click-coordinate` 等动作）和 `computer_perceive`（只读文本）等工具。映射：观察用 `computer_observe`，操作用 `computer_act` 并优先 `click-element`。安装和授权按插件文档进行。
- **隐私提醒**：该插件的视觉感知层可能调用第三方视觉模型，截图会发到第三方服务。开工前告诉用户，由用户决定是否继续。

## 其他环境

只要具备上面的“观察”和“操作”能力即可使用；遵守该环境桌面工具自带的使用说明和授权规则。

## 验证状态

| 平台 | 状态 |
|---|---|
| Codex | v1 在客户端 V4.1.60 上完成真实验收（见仓库 `archive/v1`）；v2 尚未重新验收 |
| Claude Code / Claude 桌面应用 | 2026-10-19 用 Claude（云端会话连接 Windows 电脑的电脑操作）在 V4.1.60 上完成一次图片复刻原理图：AMS1117-ADJ 双色指示电源，原理图 DRC 0 错误 0 警告。PCB 未测，完整验收未跑完 |
| DeepSeek Harness | 设计上兼容，未实测 |

只有在该平台上完整跑通一次验收后，才能把状态改为“已验证”。报告中写明本次使用的平台。

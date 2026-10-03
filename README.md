# operating-jlceda-pro

一个面向 Codex 的 Windows 嘉立创 EDA 专业版操作 Skill。它支持三种输入方式：

1. 根据自然语言需求新建原理图和 PCB。
2. 根据原理图截图或扫描图复刻。
3. 直接修改已有嘉立创 EDA 工程。

这个项目的重点不是“自动点击得很快”，而是在桌面 UI 不稳定、图片信息可能模糊、器件库元数据可能冲突的情况下，仍然保持可核对、可停止、不过度猜测。

## 已验证范围

- 客户端：嘉立创 EDA 专业版 `V4.1.60`
- 系统：Windows
- 工作流：原理图、PCB、保存、原理图 DRC、PCB DRC
- 输入模式：自然语言、低清晰度图片、已有工程修改
- 实际验收电路：5 V NE555 无稳态 LED 闪烁器
- PCB：`50 mm x 30 mm`，自动布线完成度 `100%`，PCB DRC `0` 问题、`141` 项检查

其他客户端版本目前只能称为“按语义定位设计上兼容”，不能称为已验证兼容。

## 核心行为

- 每次界面变化后重新观察，不保存历史屏幕坐标。
- 一次观察、一次操作、立即验证。
- 多个相似工程窗口并存时停止选择，让用户指定目标。
- 已有工程存在来源未知的未保存改动时，保存前询问用户。
- 图片中的型号、参数、极性、引脚或连接点不清楚时，指出具体位置并提问；确认前不绘制相关器件或网络。
- 同一轮图片检查发现的歧义集中提问，减少逐项打断。
- 关键属性必须连同选中对象身份连续两次读取一致，避免记录陈旧面板数据。
- 原理图同步到 PCB 前后比较器件、网络、飞线和走线；出现非预期清线时停止，未经授权不重布线。
- 不通过删除网络、忽略规则或猜测封装来制造“零错误”。
- 只把客户端实际显示的版本、入口、器件和封装写成事实。
- 把“编辑验收通过”和“生产就绪已验证”分开；DRC 为零不能单独证明可生产。

## 安装

把 [`skills/operating-jlceda-pro`](skills/operating-jlceda-pro) 复制到：

```text
%USERPROFILE%\.codex\skills\operating-jlceda-pro
```

重新启动 Codex 或打开新会话后，可显式使用：

```text
$operating-jlceda-pro
```

也可以直接提出类似请求：

```text
请在嘉立创 EDA 专业版中，根据这张原理图图片新建工程。看不清的器件和连接先问我，不要猜。
```

## 怎样提供需求

为了减少来回确认，建议一次给出：

- 新建、图片复刻或已有工程修改中的一种任务类型。
- 工程名称或需要打开的工程路径。
- 电源、接口、主要器件和关键参数。
- 指定封装、安装方式、板框尺寸和线宽要求。
- 图片中你已经确认的模糊位置或权威答案。
- 是否允许保存、删除错误连线、重新布线或覆盖当前未保存改动。

## 已知限制

- 只有 `V4.1.60` 完成真实客户端验收。
- 图片识别不能保证一次正确；本 Skill 的策略是把不确定项显式交还用户确认。
- 嘉立创库条目的器件名、PCB 封装、供应商封装和 3D 模型可能不一致，必须以当前任务实际核对结果为准。
- 自动布线通过 DRC 不等于满足电气、EMC、热设计、可制造性或安规要求。
- 当前验收未验证独立的电源/地线加宽规则，也没有导出 Gerber、BOM 或坐标文件。
- 第一版只适配 Codex；DeepSeek Harness 客户端适配留给后续版本。

## 测试证据

- [`tests/scenarios.md`](tests/scenarios.md)：十二类高风险行为场景。
- [`tests/baseline.md`](tests/baseline.md)：无 Skill 的 RED 基线。
- [`tests/results.md`](tests/results.md)：加入 Skill 后的 GREEN 结果，`10/10` 通过。
- [`tests/contract-tests.ps1`](tests/contract-tests.ps1)：关键安全规则的可重复契约检查。
- [`tests/hardening-results.md`](tests/hardening-results.md)：本轮问题修复的 RED/GREEN 记录。
- [`tests/ui-acceptance.md`](tests/ui-acceptance.md)：真实客户端原理图与 PCB 验收。
- [`tests/final-acceptance.md`](tests/final-acceptance.md)：图片、已有工程修改和安装验收。
- [`tests/fixtures/ambiguous-ne555.png`](tests/fixtures/ambiguous-ne555.png)：真实低清晰度测试图。

完整过程、问题和使用者视角建议见 [`docs/RETROSPECTIVE.zh-CN.md`](docs/RETROSPECTIVE.zh-CN.md)。

## 安全与隐私

- 发布仓库不包含嘉立创工程文件、生产文件、账号凭据或本机用户名路径。
- 需要外部器件事实时，应优先使用器件原厂资料等第一方来源。
- 执行保存、删除、覆盖或其他高影响操作时，仍应遵守当前工具和用户授权边界。

## 许可证

[MIT License](LICENSE)

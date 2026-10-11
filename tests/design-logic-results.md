# 适用性驱动作图逻辑测试记录

测试日期：2026-10-11。

## 问题

外部文章以智能小灯、电源、MCU、I2C、USB、模拟和射频等案例介绍布局布线技巧。文章可以提示可能的检查方向，但案例中的功能块和固定数值不适用于所有项目。若直接变成统一模板，会给普通低速电路添加不存在的接口约束，也可能使用没有电流、铜厚、层叠或制造依据的线宽和过孔数。

## RED

先新增四个行为场景：

- `JL-SCOPE-01`：不把 USB、I2C、射频和固定电源规则套到 NE555 闪烁板；
- `JL-SOURCE-01`：没有工作条件和制造依据时不采用文章固定数值；
- `JL-PROFILE-01`：混合项目按各功能块风险选择流程；
- `JL-AUTOROUTE-01`：自动布线不处理未获授权的关键网络。

随后增加六项契约检查。修改 Skill 前运行时，这六项全部失败，原因分别是缺少规则适用性、数值来源、功能块风险画像、无关约束排除、自动布线边界和按器件用途检查工作包线。

## GREEN

修改 `SKILL.md`、`workflows.md`、`schematic.md` 和 `pcb.md` 后，同一契约脚本全部 `14/14` 通过。当前逻辑是：

1. 每条约束记录对象、数值、单位、边界、来源、适用范围和状态。
2. 通用检查只覆盖连接、身份、极性、封装映射、机械边界和证据完整性。
3. 电源、大电流、开关电源、高速、差分、时钟、模拟、射频、热、安全和制造专用规则，仅在工程存在对应对象时启用。
4. 布局与布线顺序由项目依赖、机械限制和风险画像产生，不使用固定模板。
5. 自动布线只能用于用户明确允许的普通网络。

本轮测试证明文档契约已覆盖这些规则，不声称新增四个行为场景已经由独立 Agent 完成复测。

## 资料使用原则

第三方文章只作为发现检查项的线索。通用原则使用器件原厂或标准组织资料交叉核对；具体数值仍必须匹配当前器件后缀、封装、工作条件、板层叠和制造能力。

- [Texas Instruments High-Speed Layout Guidelines](https://www.ti.com/lit/an/scaa082a/scaa082a.pdf)
- [Analog Devices Mixed-Signal PCB Layout Guidelines](https://www.analog.com/en/resources/analog-dialogue/articles/2022/09/02/02/40/what-are-the-basic-guidelines-for-layout-design-of-mixed-signal-pcbs.html)
- [USB-IF USB 2.0 Specification](https://www.usb.org/document-library/usb-20-specification)

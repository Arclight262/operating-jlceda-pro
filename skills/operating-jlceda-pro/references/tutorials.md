# 嘉立创EDA学习中心教程索引

本文件是操作方法的第一依据。画图的步骤、顺序和入口跟随这里的官方教程；当前窗口与教程不一致时按窗口执行，并把差异写进报告。

- 官方教程根地址：`https://prodocs.lceda.cn/cn/`
- 同内容镜像（主站读取失败时用）：`https://prodocs.easyeda.com/cn/`
- 页面地址规则：`<根地址><章节>/<页面>/`，例如 `schematic/place-wire/`

## 怎样使用

1. 准备执行某项操作时，先在下表找对应页面。“要点”列已有摘录的，按摘录执行。
2. 摘录不够、或该操作只有链接没有要点时，用当前环境的网页读取工具打开该页面再执行。
3. 读不到页面（网络受限、页面报错、表中没有对应条目）而操作方法又不确定时，停下来请用户提供该教程：链接、截图或文字都可以。说明需要哪一项操作的教程、为什么需要。不要凭记忆或其他 EDA 软件的经验补步骤。
4. 教程里的设计数值（线宽、间距、过孔尺寸等）是示例，不作为本项目的默认值；见 `pcb.md` 的约束台账。

下文“要点”摘自编写时（2026-10）读取的官方页面。教程会随版本更新，以窗口实际为准。

## 快速入门（总流程）

[嘉立创EDA专业版快速入门](https://prodocs.lceda.cn/cn/quick-start.html)：新建工程 → 新建原理图 → 放置器件 → 布局 → 连线 → 改属性 → 原理图 DRC → 转换到 PCB → 板框 → 布局 → 布线 → 铺铜 → PCB DRC → 导出。本 Skill 的原理图与 PCB 流程按这个顺序组织。

## 工程与原理图

| 操作 | 教程 | 要点 |
|---|---|---|
| 新建工程 | [创建工程](https://prodocs.lceda.cn/cn/project/file-new-project/) | `文件 - 新建 - 工程`，或开始页“快速开始 - 新建工程”；填名称后保存 |
| 新建原理图 | [创建原理图/图页](https://prodocs.lceda.cn/cn/schematic/file-new-schematic-page/) | `文件 - 新建 - 原理图`，或在工程设计的图页上右键 |
| 原理图设置（网格、主题） | [原理图设置](https://prodocs.lceda.cn/cn/schematic/settings-schematic/) | 需要时读取；快捷键主题影响导线等快捷键 |
| 放置器件 | [放置 - 器件](https://prodocs.lceda.cn/cn/schematic/place-device/) | `放置 - 器件`、工具栏放置器件、`Shift+F`，或底部面板（`\`）选中后点放置/双击；搜索引擎可在“立创商城”和“嘉立创EDA”间切换；表格列表可预览实物图、符号、封装、3D；放置时按 `TAB` 先设符号、封装和属性；`ESC` 退出；放置过的器件进入工程库 |
| 放置前设置器件 | [TAB 键设置器件](https://prodocs.lceda.cn/cn/schematic/place-tab-settings/) | 编写时未能读取，需要时读取 |
| 常用库 | [左侧面板 - 常用库](https://prodocs.lceda.cn/cn/schematic/side-panel-left-commonly-library/) | 左侧面板提供常用元件，下拉切换类型 |
| 修改属性 | [右侧面板 - 属性](https://prodocs.lceda.cn/cn/schematic/side-panel-right-property/) | 左键选中后在右侧面板改；也可右键 |
| 旋转 | [布局 - 旋转](https://prodocs.lceda.cn/cn/schematic/layout-rotate/) | 选中器件后 `布局 - 旋转`，或按空格 |
| 翻转 | [布局 - 翻转](https://prodocs.lceda.cn/cn/schematic/layout-flip/) | `布局 - 翻转`，快捷键 `X` / `Y`；哪个对应水平、哪个对应垂直，教程未说明，执行后观察确认 |
| 对齐、分布、组合 | [布局 - 对齐](https://prodocs.lceda.cn/cn/schematic/layout-align/)、[布局 - 分布](https://prodocs.lceda.cn/cn/schematic/layout-distribute/) | 框选后用 `布局` 菜单；组合后可整体移动旋转 |
| 导线 | [放置 - 导线](https://prodocs.lceda.cn/cn/schematic/place-wire/) | `放置 - 导线`，`Alt+W`（专业版主题）或 `W`（标准版主题）；左键确定线段，右键取消；光标在符号范围内会就近吸附引脚，按住 `Alt` 不吸附；绘制中 `TAB` 设导线名称 |
| 连接点 | [放置 - 连接点标识](https://prodocs.lceda.cn/cn/schematic/place-junction-flag/) | 导线十字交叉默认**不连接**；在交叉处放连接点才连通；`放置 - 连接点标识` 或 `Alt+J`，也可在交叉点附近双击；只能放在“交叉且不连接”处 |
| 网络标签 | [放置 - 网络标签](https://prodocs.lceda.cn/cn/schematic/place-net-label/) | `放置 - 网络标签`，放置时 `TAB` 设名称和增序；标签即导线的名称属性；可直接放在引脚上，会自动引出一段导线 |
| 网络标识（VCC、GND 等） | [放置 - 网络标识](https://prodocs.lceda.cn/cn/schematic/place-net-flag/) | 内置 VCC、GND、保护地、模拟地等；入口需要时读取或从窗口确认 |
| 网络端口 | [放置 - 网络端口](https://prodocs.lceda.cn/cn/schematic/place-net-port/) | `放置 - 网络端口`，`TAB` 设名称；主要用于层次图，图页内连接优先用网络标签 |
| 非连接标识 | [放置 - 非连接标识](https://prodocs.lceda.cn/cn/schematic/place-no-connect/) | `放置 - 非连接`；只能放在引脚端点；会把该引脚“非连接”属性设为“是” |
| 跨页连接 | [放置 - 跨页连接标识](https://prodocs.lceda.cn/cn/schematic/place-off-page-connector/) | 多页图纸时读取 |
| 分配位号 | [设计 - 分配位号](https://prodocs.lceda.cn/cn/schematic/design-annotate-designator/) | 图片已有位号时不重新分配 |
| 原理图 DRC | [设计 - 检查 DRC](https://prodocs.lceda.cn/cn/schematic/design-check-drc/) | `设计 - 检查DRC`，结果在底部面板 DRC 栏；提示“建议使用器件标准化”时用左侧面板“器件标准化” |
| 器件标准化 | [左侧面板 - 器件标准化](https://prodocs.lceda.cn/cn/schematic/side-panel-left-device-standardization/) | 需要时读取 |
| 封装管理器 | [工具 - 封装管理器](https://prodocs.lceda.cn/cn/schematic/tools-footprint-manager/) | 转 PCB 前核对、修正封装 |
| 器件管理器 | [工具 - 器件管理器](https://prodocs.lceda.cn/cn/schematic/tools-device-manager/) | 替换器件时读取 |
| 交叉选择 | [设计 - 交叉选择](https://prodocs.lceda.cn/cn/schematic/design-cross-probe/) | 原理图与 PCB 互相定位 |
| 复用模块/层次图 | [放置 - 复用模块/层次图](https://prodocs.lceda.cn/cn/schematic/place-reuse-block/) | 多层次图纸时读取 |

## 原理图转 PCB

| 操作 | 教程 | 要点 |
|---|---|---|
| 首次转换 / 更新 | [更新/转换原理图到 PCB](https://prodocs.lceda.cn/cn/schematic/design-update-convert-schematic-to-pcb/) | 首次：`设计 - 原理图转PCB`（快速入门写作 `设计 - 更新/转换原理图到PCB`）；更新：原理图点“更新PCB”，或 PCB 中 `设计 - 导入修改信息`；转换前先按原理图规则检测，封装对应异常（未指定封装、引脚号与焊盘号不一致、引脚多于焊盘、封装为空）会中止，需在封装管理器修正；“确认导入信息”弹窗默认全选，可取消不需要的项，点“应用修改”；首次转换会参考原理图元件位置大致摆放 |
| 从原理图导入变更 | [设计 - 从原理图导入变更](https://prodocs.lceda.cn/cn/pcb/design-import-changes-from-schematic/) | 更新时读取 |
| 更新后的网络 | 同上页注意事项 | 网络名由原理图计算，改原理图后部分网络名可能变化；原理图增删器件后，PCB 导线所属网络通常要手动改 |

## PCB

| 操作 | 教程 | 要点 |
|---|---|---|
| 新建 PCB | [创建 PCB](https://prodocs.lceda.cn/cn/pcb/file-new-pcb/) | `文件 - 新建 - PCB`，或在图页上右键 |
| 板框 | [放置 - 边框/板框](https://prodocs.lceda.cn/cn/pcb/place-board-outline/) | `放置 - 板框`，可选矩形、圆形、多边形；选中后在右侧面板调整；多边形可用 `x 空格 X 空格 Y` 等坐标命令定位顶点 |
| 布局 | [布局 - 对齐](https://prodocs.lceda.cn/cn/pcb/layout-align/)、[布局 - 旋转](https://prodocs.lceda.cn/cn/pcb/layout-rotate/)、[布局 - 组合](https://prodocs.lceda.cn/cn/pcb/layout-group/)、[布局 - 翻面](https://prodocs.lceda.cn/cn/pcb/layout-flip-to-opposite-side/) | 框选后用 `布局` 菜单 |
| 单路布线 | [布线 - 单路布线](https://prodocs.lceda.cn/cn/pcb/route-single-routing/) | `布线 - 单路布线`、工具栏或 `W`（快速入门写作专业版主题 `Alt+W`），也可双击焊盘/过孔开始；左键加拐点；`L` 切换拐点；`T` `B` `1` `2` `3` `4` 切层并自动加过孔；`V` 放过孔；`Backspace` 回退一个拐点 |
| 布线宽度 | [布线 - 布线宽度](https://prodocs.lceda.cn/cn/pcb/route-routing-width/) | 需要时读取；数值来自约束台账 |
| 布线模式 | [布线 - 布线模式](https://prodocs.lceda.cn/cn/pcb/route-routing-mode/) | 阻挡、环绕、推挤；需要时读取 |
| 自动布线 | [布线 - 自动布线](https://prodocs.lceda.cn/cn/pcb/route-auto-routing/) | `布线 - 自动布线`；“已有导线/过孔”默认保留，选“移除”会先清除全部导线和过孔；可设“忽略网络”（如 GND 留给铺铜）；结果一般需要手动调整 |
| 锁定 | [编辑 - 锁定/解锁](https://prodocs.lceda.cn/cn/pcb/edit-lock-unlock/) | 自动布线前锁定已完成的关键走线时读取 |
| 铺铜 | [放置 - 铺铜区域](https://prodocs.lceda.cn/cn/pcb/place-copper-region/) | `放置 - 铺铜区域` 或工具栏；左键开始和确认，右键取消；弹窗设层、网络；改后在右侧面板点“重建铺铜区” |
| 设计规则 | [设计 - 设计规则](https://prodocs.lceda.cn/cn/pcb/design-design-rule/) | 规则值来自约束台账 |
| PCB DRC | [设计 - 检查 DRC](https://prodocs.lceda.cn/cn/pcb/design-check-drc/) | `设计 - 检查DRC`，结果在底部 DRC 窗口 |
| 网络类、差分对、等长、xSignals | [网络类管理器](https://prodocs.lceda.cn/cn/pcb/design-net-class-manager/)、[差分对管理器](https://prodocs.lceda.cn/cn/pcb/design-differential-pair-manager/)、[等长网络组管理器](https://prodocs.lceda.cn/cn/pcb/design-equal-length-group-manager/)、[xSignals](https://prodocs.lceda.cn/cn/pcb/design-xsignals/) | 只在工程确有对应对象和约束来源时读取并使用 |
| 泪滴、缝合孔、铺铜管理 | [工具 - 泪滴](https://prodocs.lceda.cn/cn/pcb/tools-teardrop/)、[放置 - 缝合孔](https://prodocs.lceda.cn/cn/pcb/place-suture-vias/)、[工具 - 铺铜管理器](https://prodocs.lceda.cn/cn/pcb/tools-copper-manager/) | 同上 |
| SMT 选型 | [工具 - 嘉立创 SMT 选型工具](https://prodocs.lceda.cn/cn/pcb/tools-jlcpcb-smt-part-selection-tool/) | 用户要嘉立创贴片时读取 |

## 其他章节入口

需要时从这些章节首页进入：[器件库](https://prodocs.lceda.cn/cn/device/file-new-device/)、[符号库](https://prodocs.lceda.cn/cn/symbol/settings-symbol/)、[封装库](https://prodocs.lceda.cn/cn/footprint/settings-footprint/)、[复用模块](https://prodocs.lceda.cn/cn/reuse-block/file-new-reuse-block/)、[导入导出](https://prodocs.lceda.cn/cn/import-export/easyeda-pro-format-converter/)、[常见问题](https://prodocs.lceda.cn/cn/faq/schematic/)。

## 用户补充的教程

用户另外提供的学习中心教程（链接或文件）记录在这里，优先级与上表相同：

| 操作 | 来源 | 要点 | 提供日期 |
|---|---|---|---|
| （暂无） | | | |

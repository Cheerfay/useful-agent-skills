# useful-agent-skills

[English](README.md)

面向 Codex、Claude Code、Cursor 和其他 Agent 工具的实用 Skills 仓库。这里既维护经过来源、用途、兼容性和许可证检查的第三方 Skill 目录，也发布本仓库原创、可直接安装的 Skills。

第三方条目只收录索引和评估信息，不复制源码，也不代表对第三方脚本的安全背书。原创 Skill 源码发布在独立仓库，或在尚未拆分时保存在 `skills/`。

## 仓库内容

- `skills/`：尚未拆分为独立仓库的原创 Skills；成熟项目优先链接到其独立源码仓库。
- `catalog/`：按用途整理的原创与第三方 Skill 目录。
- `registry.json`：机器可读的来源、许可证、兼容性和验证状态。

## 为什么不复制第三方源码

- 第三方 Skill 的许可证和更新节奏不同。
- 复制源码容易与上游脱节，也不利于追踪安全和行为变化。
- 本仓库记录准确的仓库、目录、用途、兼容性和安装状态。
- 需要自定义时，再把经过许可的派生版本放进 `skills/` 并记录来源与修改。

## 分类

| 分类 | 内容 |
| --- | --- |
| [前端设计](catalog/frontend-design.md) | 视觉方向、现有项目重设计、设计系统与 UI 审查 |
| [视觉测试](catalog/visual-testing.md) | 浏览器回归、截图和交互验证 |
| [设计工具](catalog/design-tools.md) | Figma 生成、设计稿实现和设计系统衔接 |

机器可读的完整条目位于 [`registry.json`](registry.json)。

## 当前推荐组合

### 改造已有小型网页或浏览器扩展

1. `redesign-existing-projects`：先扫描、诊断，再做小范围修改。
2. `frontend-design`：确定配色、字体、布局和唯一的视觉记忆点。
3. 浏览器控制或 Playwright：检查真实页面、响应式和交互状态。

### 改版完成后的收尾巡检

1. [`ui-consistency-audit`](https://github.com/Cheerfay/ui-consistency-audit)：扫描旧配色、重复方向提示、低对比文字和组件风格漂移。
2. 浏览器控制或 Playwright：覆盖桌面、移动端、多语言和交互状态。
3. 项目构建与测试：确认视觉修改没有破坏功能。

### 从零设计新页面

1. `frontend-design`：形成明确视觉方向。
2. `ui-ux-pro-max`：补充配色、字体、无障碍和技术栈建议。
3. Figma Skills：需要设计稿协作时使用。

## 收录规则

新增 Skill 前至少检查：

- 存在有效的 `SKILL.md` 和清晰的触发描述。
- 来源仓库与具体目录可追踪。
- 不要求执行来源不明的安装脚本。
- 能说明它解决的问题，以及与已有 Skill 的区别。
- 记录许可证、外部依赖和已知兼容性问题。
- 实际检查后更新 `status`：`candidate`、`verified` 或 `retired`。

## 状态说明

- `candidate`：已发现，尚未完成兼容性和实际任务验证。
- `verified`：已检查来源和许可证，并至少在一个真实任务中使用。
- `retired`：不再推荐，保留记录用于解释替代关系或历史决策。

## 安全与许可证

- 收录不等于安全认证。安装前检查 Skill 中的脚本、网络请求、文件写入和外部依赖。
- 本仓库的 MIT License 覆盖本仓库原创的 Skill 源码、脚本、目录文字和结构化数据。
- 第三方 Skills 继续适用各自的上游许可证；标记为 `not-detected` 的项目必须在复制或修改源码前自行确认条款。
- 优先引用固定提交或发布版本，避免上游更新后行为静默变化。

## 贡献

新增第三方条目时同步更新对应分类文件和 `registry.json`，并提供来源 URL、具体路径、许可证、兼容性、检查日期和简短风险说明。

发布原创 Skill 时同步检查：

- 独立仓库根目录或 `skills/<name>/` 中的 `SKILL.md`，以及所需的 `agents/`、`scripts/`、`references/` 或 `assets/`。
- README 的推荐组合或更新记录。
- 对应的 `catalog/*.md` 分类页。
- `registry.json` 的来源、许可证、兼容性、状态和检查日期。
- 源码所在仓库的顶层 `LICENSE` 是否覆盖原创内容；Skill 文件夹内无需重复放置 LICENSE 或 README。

## 更新记录

- 2026-08-14：将 `ui-consistency-audit` 拆分为独立仓库，合集保留分类与推荐入口。
- 2026-08-14：开源原创 `ui-consistency-audit` Skill，用于改版后的视觉与交互一致性巡检。
- 2026-08-12：补充许可证、公开状态字段、安全说明和上游许可证信息。
- 2026-07-28：建立目录；收录前端设计、视觉测试和 Figma 工作流候选项。

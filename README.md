# Codex Useful Skills

个人使用的 Agent Skills 分类目录，记录经过实际检查、值得在后续项目复用的 Skills。

## 为什么先做目录，不直接复制源码

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
- 实际使用后更新 `status`：`candidate`、`installed`、`tested` 或 `retired`。

## 更新记录

- 2026-07-28：建立目录；收录前端设计、视觉测试和 Figma 工作流候选项。


# 视觉测试 Skills

## Browser control

- 来源：OpenAI bundled Browser plugin
- 状态：已验证
- 适合：本地页面检查、交互验证、响应式布局和控制台错误检查
- 备注：对 Chrome 扩展后台 API 的系统行为仍需 Chrome API mock 或真实扩展回归。

## playwright

- 来源：`openai/skills`
- 路径：`skills/.curated/playwright`
- 状态：候选
- 适合：可重复的端到端网页测试
- 注意：与已有浏览器控制能力可能重叠，安装前先确认项目是否需要独立测试脚本。

## screenshot

- 来源：`openai/skills`
- 路径：`skills/.curated/screenshot`
- 状态：候选
- 适合：桌面截图、视觉差异记录和设计审查资料

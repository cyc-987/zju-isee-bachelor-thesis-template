# 浙江大学信电学院本科毕业论文（含三合一）LaTeX 模板-2026版

本仓库基于 [cyc-987/zju-isee3in1-bachelor-thesis-template](https://github.com/cyc-987/zju-isee3in1-bachelor-thesis-template) 进一步开发，当前已支持浙江大学信电学院本科阶段完整文档链路（毕业论文 + 文献综述 + 开题报告 + 外文翻译），使用自定义文档类 `iseebachelor.cls`。

## 前排提示

- 本模板仅对Overleaf做了可编译保证，未在任何本地环境进行测试，如在本地环境编译此文件有任何问题，恕不提供解决方案。
- 尽管我尽力的模仿了学院提供的Word文件，但是由于Latex与前者本质上不采用一套渲染体系，无法保证完全一致。由使用本模板导致无法通过格式检查的情况本人恕不承担。

## 当前状态

- 当前已完成：**完整版（三合一 + 毕业论文）**。
- `final` 模式：编译完整文档（毕业论文 + 三合一部分）。
- `thesisonly` 模式：仅编译毕业论文部分。
- 支持 `blind` / `noblind` 控制盲审信息显示。

## 仓库结构

- `main.tex`：入口文件，填写学生/导师信息并组织文档内容。
- `iseebachelor.cls`：版式、页眉页脚、标题层级、字体等核心定义。
- `doc_thesis/`：毕业论文相关内容。
  - `contents/`：声明、致谢、摘要、正文、任务书、评审页等。
  - `refs/`：BibTeX 参考文献。
  - `figs/`：正文插图。
- `doc_3in1/`：三合一部分内容（开题信息页、文献综述、开题报告、外文翻译、评定页）。
  - `contents/`：三合一正文内容拆分文件。
  - `refs/`：三合一参考文献 BibTeX 文件。
  - `figs/`：三合一插图资源。
- `assets/`：模板依赖的字体与图片资源。

## 快速开始

1. 下载本仓库并导入 Overleaf（推荐）或本地 LaTeX 环境。
1. 在 `main.tex` 顶部填写个人信息宏（姓名、学号、导师、年级、专业、学院、课题名）。
1. 按需修改 `doc_thesis/contents/` 与 `doc_3in1/contents/` 下各章节内容。
1. 根据需要选择模式：
   - 完整版：`\documentclass[..., final, ...]{iseebachelor}`
   - 仅论文：`\documentclass[..., thesisonly, ...]{iseebachelor}`
1. 使用 XeLaTeX 编译生成 PDF。

## 编译选项说明

- `final`：编译完整版本（毕业论文 + 三合一）。
- `thesisonly`：仅编译毕业论文内容。
- `blind` / `noblind`：控制盲审信息显示。

## 注意事项

- 模板内已包含中文字体资源（位于 `assets/fonts/`），如需替换字体，请同步调整 `iseebachelor.cls` 中字体配置。
- 由于 LaTeX 与学院 Word 模板渲染机制不同，无法保证与 Word 逐像素一致，请以学院最终格式要求为准。
- 如果你是从原三合一仓库复制章节内容，请重点检查并修改路径：
  - 参考文献路径示例：`\bibliography{refs/01_Review}` 需改为 `\bibliography{doc_3in1/refs/01_Review}`。
  - 图片路径示例：`\includegraphics{figs/01/xxx.png}` 需改为 `\includegraphics{doc_3in1/figs/01/xxx.png}`。
- 如果你在使用中发现问题，欢迎提交 issue 或 PR。

## 许可证

本项目基于 GPL-3.0 许可，详见 `LICENSE`。

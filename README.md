# git-commitx

<p align="center">
  <img src="https://raw.githubusercontent.com/chenkai2/git-commitx/main/assets/logo.svg" alt="git-commitx Logo" width="128" height="128">
</p>

<h3 align="center">AI驱动的Git提交信息生成器</h3>

<p align="center">
  <a href="https://github.com/chenkai2/homebrew-git-commitx/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
  </a>
</p>

## 简介

git-commitx 是一个基于AI的命令行工具，它能够自动分析Git暂存区的代码变更，并生成规范、准确的提交信息。通过集成先进的AI模型，git-commitx 帮助开发者节省编写提交信息的时间，同时确保提交信息的质量和一致性。

## 特性

- 🤖 基于AI模型自动分析代码变更
- 📝 生成规范、准确的提交信息
- 🚀 快速且易于使用的命令行界面
- 🌍 支持多语言提交信息
- ⚙️ 可自定义提示词模板和参数配置

## 安装

1. 使用 Homebrew 安装 git-commitx：

```bash
brew install chenkai2/homebrew-git-commitx/git-commitx
```

2. 非 Homebrew 用户:

可以从[发布页面]( Homebrew 用户可以从[发布页面](https://github.com/chenkai2/homebrew-git-commitx/releases)下载对应系统的zip压缩包，解压后移动到 PATH 内的任意目录(比如：`/usr/local/bin`，windows下为`C:\Windows\System32`)。

3. 手动编译：

```bash
go get github.com/chenkai2/homebrew-git-commitx
go mod vendor
go build -o git-commitx main.go
```bash

## 使用方法

1. 在设置中配置AI服务的API相关信息，开通模型后记下该模型的 apiKey
   - 默认使用阿里云百炼的AI接口，模型为`deepseek-v3`
     - 获取API密钥：[阿里云百炼](https://bailian.console.aliyun.com/?apiKey=1#/api-key)
     - 生成密钥后，可以直接使用各种模型，新用户半年内每种模型免费 100w tokens，可以用的模型有：
       - `deepseek-v3`
       - `deepseek-r1`
       - `qwen2.5-32b-instruct`
       - `deepseek-r1-distill-qwen-32b`
       - `qwen-plus`
       - `deepseek-r1-distill-llama-70b` 这个模型 free，只是用的人太多有点慢
       - `qwen2-7b-instruct`
   - 其次推荐[火山引擎](https://console.volcengine.com/ark/region:ark+cn-beijing/apiKey?apikey=%7B%7D)，截止2025年5月31日，每天每个模型免费 50w tokens
     - 生成api后需要手动开通需要开通的模型
     - 支持的模型较少，只有deepseek系的和doubao系的，比如：
     - `deepseek-r1-250120` 每天50w tokens
     - `deepseek-r1-distill-qwen-32b-250120` 每天50w tokens
     - `deepseek-v3-241226` 一共100w tokens
     - `doubao-1-5-pro-256k-250115` 每天50w tokens
   - 支持其他兼容openai接口的大模型服务，比如腾讯元宝、Anthropic、硅基流动、DeepSeek等
   - 本扩展支持本地部署的Ollama，只需要把 protocol 改为 ollama，url 改为`http://localhost:11434/api/generate`即可

2. 在Git仓库中暂存你要提交的更改：

```bash
git add .
```

3. 运行 git-commitx 生成提交信息：

```bash
git commitx
```

4. 如果是第一次运行，会提示你输入第 1 步中生成的 apiKey ，输入后会自动保存到git的全局配置中。

5. git-commitx 将分析暂存的更改并生成合适的提交信息。

## 配置

你可以通过命令行参数自定义 git-commitx 的行为：

```bash
git commitx --help  # 查看所有可用选项
```

## 贡献

欢迎提交问题和功能请求！如果您想贡献代码，请随时提交PR。

## 许可证

[MIT License](LICENSE) © 2024 Kai Chen
<div align="center">

# ⚡ Flutter Fast Build Action

**The smartest way to build, test, and analyze Flutter apps in GitHub Actions.**

[![Marketplace](https://img.shields.io/badge/Marketplace-Available-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/marketplace/actions/flutter-fast-build)
[![Flutter](https://img.shields.io/badge/Flutter-Stable-02569B?style=for-the-badge&logo=flutter&logoColor=white)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)

</div>

`flutter-fast-build-action` is a composite action that drastically reduces the boilerplate required to set up a CI/CD pipeline for Flutter projects. It handles dependency resolution, `build_runner` code generation (with caching!), static analysis, testing, and building the final artifact.

## ✨ Features
- **🔥 Zero-config Caching:** Automatically caches Flutter SDK and `.dart_tool` to make `build_runner` lightning fast.
- **🛠 Code Generation:** Native support for running `build_runner` before analysis and tests.
- **📊 Quality Gates:** Built-in static analysis (`flutter analyze`) and testing (`flutter test --coverage`).
- **📦 Multi-target:** Build APK, AAB, iOS, Web, Windows, macOS, or Linux easily.

## 🚀 Usage

Create a workflow file in your repository (e.g., `.github/workflows/ci.yml`):

```yaml
name: CI
on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Fast Build
        uses: verf1CT/flutter-fast-build-action@main
        with:
          target: 'apk'
          run-build-runner: 'true' # Enables code generation caching
          build-args: '--release --flavor prod'
```

## ⚙️ Inputs

| Input | Required | Default | Description |
|-------|----------|---------|-------------|
| `target` | Yes | `apk` | What to build (`apk`, `appbundle`, `ios`, `web`, `windows`, etc.) |
| `flutter-version` | No | `stable` | Flutter version to use |
| `run-build-runner` | No | `false` | Set to `true` to run `dart run build_runner build` |
| `build-args` | No | `''` | Extra arguments for `flutter build` |

## 🤝 Contributing
Issues and Pull Requests are welcome!

## 📄 License
MIT License

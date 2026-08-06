<div align="center">

# 📱 Flutter Fast Build Action

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/verf1CT/flutter-fast-build-action?style=for-the-badge&color=02569B)](https://github.com/verf1CT/flutter-fast-build-action/releases)
[![Marketplace](https://img.shields.io/badge/Marketplace-Flutter%20Fast%20Build-blue?style=for-the-badge&logo=github)](https://github.com/marketplace/actions/flutter-fast-build)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

**The ultimate, zero-configuration composite GitHub Action to test, analyze, and build your Flutter apps blazing fast.**

</div>

---

## ⚡️ Why this Action?

Writing CI/CD pipelines for Flutter can be tedious. You have to manually set up caching, run the analyzer, output test coverage, and finally trigger the build. 

**Flutter Fast Build** combines all these best practices into a single, highly optimized step. It is built for solo developers and teams who want to focus on shipping code, not writing YAML.

### ✨ Features
- **🚀 One-Step Setup**: Replaces 5+ standard workflow steps with just one.
- **💾 Intelligent Caching**: Automatically caches `.pub-cache` to speed up future runs.
- **🛡️ Strict Analysis**: Runs `flutter analyze` to catch issues before they hit production.
- **📊 Auto Coverage**: Executes `flutter test --coverage` automatically, ready for Codecov or SonarCloud.
- **🎯 Multi-Target Builds**: Supports building `apk`, `ios`, `web`, `appbundle`, etc., out of the box.

---

## 🚀 Usage

Create a workflow file in your repository (e.g., `.github/workflows/ci.yml`) and use the action.

### 📱 Basic Android Build (APK)
The default target is `apk` and it uses the `stable` Flutter channel.

```yaml
name: Flutter CI

on:
  push:
    branches: [ "main" ]
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: 🚀 Run Fast Build
        uses: verf1CT/flutter-fast-build-action@v1.0.1
```

### 🍎 iOS Build (Requires macOS runner)
To build for iOS, you must use a `macos-latest` runner and pass `ios` as the target.

```yaml
jobs:
  build-ios:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: 🚀 Run Fast Build (iOS)
        uses: verf1CT/flutter-fast-build-action@v1.0.1
        with:
          target: 'ios --no-codesign'
```

### 🌐 Web Build with Specific Flutter Version
Need to pin a specific Flutter version? No problem.

```yaml
jobs:
  build-web:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: 🚀 Run Fast Build (Web)
        uses: verf1CT/flutter-fast-build-action@v1.0.1
        with:
          target: 'web'
          flutter-version: '3.19.0'
```

---

## ⚙️ Inputs

| Input | Description | Default | Required |
| :--- | :--- | :---: | :---: |
| `target` | The target platform to build (`apk`, `appbundle`, `ios`, `web`, `windows`, `macos`, `linux`). You can also pass extra flags here (e.g., `apk --release`). | `apk` | **Yes** |
| `flutter-version` | The exact version of Flutter to install (e.g., `3.19.0`). If set to `stable`, the latest stable version will be used. | `stable` | No |

---

## 🛠️ What happens under the hood?

When you run this action, it executes the following sequence:

1. **Setup**: Uses the official `subosito/flutter-action` to download and install your requested Flutter version.
2. **Cache**: Enables caching for `pubspec` dependencies to drastically reduce CI time on subsequent runs.
3. **Fetch**: Runs `flutter pub get`.
4. **Analyze**: Runs `flutter analyze` to ensure strict type safety and code quality.
5. **Test**: Runs `flutter test --coverage` to generate `coverage/lcov.info`.
6. **Build**: Executes `flutter build <target>` to generate your final artifact.

---

<div align="center">
  <b>Made with ☕️ by <a href="https://github.com/verf1CT">verf1CT</a> — Ship it! 🚀</b>
</div>

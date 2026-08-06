# ⚡ Flutter Fast Build Action

![Marketplace Version](https://img.shields.io/github/v/release/verf1CT/flutter-fast-build-action?label=Marketplace)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

The ultimate GitHub Action for building, testing, and deploying Flutter applications. It is designed to save DevOps time with out-of-the-box caching, monorepo matrix discovery, and direct Fastlane/Firebase deployments.

## ✨ Features
* **Intelligent Caching:** Automatically caches `build_runner` outputs and pub dependencies to drastically speed up CI times.
* **Monorepo Support:** Pass `monorepo: 'true'` to automatically discover all Flutter apps in your repository and output a JSON matrix for parallel job execution.
* **Direct Deployments:** Built-in hooks for Firebase App Distribution, Google Play, and App Store Connect (TestFlight).
* **Artifact Uploading:** Automatically uploads your `.apk`, `.aab`, `.ipa`, or desktop binaries as GitHub workflow artifacts.

## 🚀 Usage

### Standard App Build
```yaml
name: Flutter CI

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Build and Test
        uses: verf1CT/flutter-fast-build-action@v1.0.0
        with:
          target: 'apk'
          run-build-runner: 'true'
          flutter-version: 'any'
```

### Monorepo Matrix Strategy
```yaml
jobs:
  discover:
    runs-on: ubuntu-latest
    outputs:
      matrix: \${{ steps.discover.outputs.matrix }}
    steps:
      - uses: actions/checkout@v3
      - id: discover
        uses: verf1CT/flutter-fast-build-action@v1.0.0
        with:
          monorepo: 'true'

  build:
    needs: discover
    runs-on: ubuntu-latest
    strategy:
      matrix:
        app: \${{ fromJson(needs.discover.outputs.matrix) }}
    steps:
      - uses: actions/checkout@v3
      - run: cd \${{ matrix.app }}
      - uses: verf1CT/flutter-fast-build-action@v1.0.0
        with:
          target: 'apk'
```

## ⚙️ Inputs
| Input | Description | Default |
| --- | --- | --- |
| `target` | Target to build (apk, appbundle, ios, etc) | `apk` |
| `flutter-version` | Flutter version to use | `any` |
| `run-build-runner` | Whether to run build_runner | `false` |
| `build-args` | Additional build arguments | `''` |
| `monorepo` | Enables automatic matrix discovery | `false` |

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

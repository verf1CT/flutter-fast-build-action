# Flutter Fast Build Action 🚀

A composite GitHub Action that sets up Flutter, caches dependencies, runs static analysis, executes tests with coverage, and builds your target application — all in one clean step.

## Usage

Create a workflow file (e.g., `.github/workflows/build.yml`) in your repository:

```yaml
name: Build App

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Build with Fast Action
        uses: verf1CT/flutter-fast-build-action@v1
        with:
          target: 'apk'
          flutter-version: '3.19.0'
```

## Inputs

| Name              | Description                          | Default  |
| ----------------- | ------------------------------------ | -------- |
| `target`          | The target to build (apk, ios, web)  | `apk`    |
| `flutter-version` | Flutter version to use               | `stable` |

## Publishing to Marketplace
1. Push this repository to GitHub.
2. Go to the "Releases" section.
3. Click "Draft a new release".
4. Check the box "Publish this Action to the GitHub Marketplace".
5. Fill out the category and tags, and hit Publish!

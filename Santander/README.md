# Setup Guide

## Requirements

- iOS 9.0+
- Xcode 10.0+
- Swift 5.0

## Development Dependencies

In order to work in this project, some dependencies are needed and are also described below.

- [bundler](https://bundler.io) - Bundler encapsulates the project environment by locking our ruby dependencies versions.
- [xcodegen](https://github.com/yonaskolb/XcodeGen) - Generates the xcodeproj you'll be working on with the proper folder structure and specs.

## Building Santander

1. Install [Xcode developer tools](https://developer.apple.com/xcode/downloads/) from Apple.
1. Clone the repository:
    ```shell
    git clone git@github.com:orlandoamorim/TesteiOS.git
    ```
1. Pull in the project dependencies:
    ### If you're running the project for the first time run this
    ```shell
    sh ./bootstrap.sh --install-bundler
    ```

    ### else run this
    ```shell
    sh ./bootstrap.sh
    ```
1. Open `Santander.xcworkspace` in Xcode.

# Info

 - Company: [Zup](https://www.zup.com.br/)
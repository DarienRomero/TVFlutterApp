# Flutter Movies App for Android TV

This repository contains a Flutter-based movie application designed specifically for Android TV and other Android-based systems. The app provides a smooth experience for browsing and navigating movie content with remote control support, optimized for large-screen displays.

## Features

- **Cross-Platform Compatibility**: Works seamlessly on Android TV and other Android-based operating systems.
- **Remote Control Navigation**: Optimized to work with the TV remote, enabling easy browsing and interaction.
- **State Management with Provider**: Uses the `Provider` package for efficient state management and navigation between screens.

## Requirements

- **Flutter Version**: This project is built using **Flutter 3.22.2**. If using a different Flutter version, you may need to update certain codes to ensure compatibility, particularly with remote control button handling.
  
### Important: Remote Control Compatibility

If you are using a Flutter version other than 3.22.2, you must update the button codes in the `button_detector_wrapper.dart` file to ensure correct functionality with remote control buttons.

## Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/DarienRomero/TVFlutterApp.git
    ```
  
2. **Navigate to the project directory**:
    ```bash
    cd flutter-movies-app-android-tv
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Run the app**:
    ```bash
    flutter run
    ```

## Dependencies

- [Flutter](https://flutter.dev/docs/get-started/install) (version 3.22.2)
- [Provider](https://pub.dev/packages/provider) - for state management

## License

This project is licensed under the MIT License.

## Acknowledgments

Special thanks to the Flutter and Android TV communities for their resources and support.

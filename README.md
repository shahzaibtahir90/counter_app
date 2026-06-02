# Counter App

A simple yet functional Flutter application that demonstrates state management and persistent data storage. This app allows users to increment and decrement a counter while automatically saving the value across app sessions.

## Overview

The Counter App is an excellent learning project for Flutter developers. It showcases essential Flutter concepts including:
- State management with `StatefulWidget`
- Local data persistence using `SharedPreferences`
- Material 3 design principles
- User interaction handling

## Features

✨ **Core Features:**
- **Increment Counter**: Tap the + button to increase the counter value
- **Decrement Counter**: Tap the - button to decrease the counter value
- **Persistent Storage**: Counter value is automatically saved locally and restored when the app restarts
- **Clean UI**: Modern Material 3 design with responsive layout
- **Cross-Platform**: Works on Android, iOS, web, Linux, macOS, and Windows

## Project Structure

```
lib/
├── main.dart          # Main application entry point and all UI logic
```

## Getting Started

### Prerequisites
- Flutter SDK (latest version recommended)
- Dart SDK (comes with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. **Clone or navigate to the project directory:**
   ```bash
   cd counter_app
   ```

2. **Get dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

### Running on Specific Platforms

- **Android**: `flutter run -d android`
- **iOS**: `flutter run -d ios`
- **Web**: `flutter run -d web`
- **Windows**: `flutter run -d windows`
- **macOS**: `flutter run -d macos`
- **Linux**: `flutter run -d linux`

## Dependencies

- `flutter/material.dart` - Flutter Material Design widgets
- `shared_preferences` - Local data persistence plugin

## Code Highlights

### Persistent Storage Implementation
The app uses `SharedPreferences` to store the counter value:
```dart
// Save counter
await _prefs.setInt(_counterKey, _counter);

// Load counter
final savedCounter = _prefs.getInt(_counterKey) ?? 0;
```

### State Management
Uses `StatefulWidget` with `setState()` for reactive UI updates:
```dart
setState(() {
  _counter++;
});
```

## Key Learning Points

This project demonstrates:
1. **Widget Lifecycle**: `initState()`, `build()`, and proper initialization
2. **Async Programming**: Using `Future` for async operations
3. **State Updates**: Proper use of `setState()` for UI reactivity
4. **Data Persistence**: Local storage with SharedPreferences
5. **Error Handling**: Try-catch blocks for robust code
6. **UI Design**: Material Design principles with AppBar, Scaffold, and Column

## Future Enhancements

- Add a reset button to reset counter to 0
- Add animations for increment/decrement actions
- Implement multiple counters with different names
- Add counter history/statistics
- Implement theme switching (light/dark mode)
- Add sound effects and haptic feedback

## Testing

Run the test suite:
```bash
flutter test
```

## Build Release

Build for production:
```bash
# Android APK
flutter build apk

# iOS
flutter build ios

# Web
flutter build web

# Windows
flutter build windows

# macOS
flutter build macos

# Linux
flutter build linux
```

## Troubleshooting

### Build Issues
1. Ensure Flutter is up to date: `flutter upgrade`
2. Clean build: `flutter clean`
3. Rebuild: `flutter pub get && flutter run`

### Dependencies Issues
- Run `flutter pub upgrade` to update dependencies
- Check `pubspec.yaml` for version conflicts

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design](https://material.io/design)
- [SharedPreferences Package](https://pub.dev/packages/shared_preferences)

## Author

Created as part of Flutter Internship Projects

## License

This project is open source and available under the MIT License.

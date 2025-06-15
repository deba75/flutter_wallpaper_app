# Flutter Wallpaper App

A beautiful wallpaper application built with Flutter that allows users to browse, search, and set stunning wallpapers on their devices. This app uses the Pexels API to fetch high-quality wallpapers.

## Screenshots

<p align="center">
  <img src="screenshots/Screenshot 2025-06-15 162800.png" width="250" alt="Home Screen"/>
  <img src="screenshots/Screenshot 2025-06-15 162834.png" width="250" alt="Category Screen"/>
  <img src="screenshots/Screenshot 2025-06-15 162854.png" width="250" alt="Full Screen Wallpaper"/>
</p>

## Features

- Browse trending wallpapers
- Browse by categories
- Search functionality for finding specific wallpapers
- View wallpapers in full screen
- Set wallpapers as home screen or lock screen
- Save wallpapers to device

## Technology Stack

- Flutter
- Dart
- HTTP package for API requests
- Pexels API for wallpaper images

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine
- Android Studio or VS Code with Flutter extensions
- A Pexels API key (get it from [Pexels Developer](https://www.pexels.com/api/))

### Installation

1. Clone the repository
   ```
   git clone https://github.com/deba75/flutter_wallpaper_app.git
   ```

2. Navigate to the project directory
   ```
   cd flutter_wallpaper_app
   ```

3. Install dependencies
   ```
   flutter pub get
   ```

4. Add your Pexels API key
   - Open `lib/controller/apiOperation.dart`
   - Replace `YOUR_API_KEY` with your actual Pexels API key

5. Run the app
   ```
   flutter run
   ```

## Project Structure

```
lib/
  ├── controller/
  │   └── apiOperation.dart      # API handling logic
  ├── model/
  │   ├── categoryModel.dart     # Data model for categories
  │   └── photosModel.dart       # Data model for wallpapers
  ├── views/
  │   ├── screens/               # Main screens
  │   │   ├── category.dart      # Category screen
  │   │   ├── fullScreen.dart    # Full screen wallpaper view
  │   │   ├── home.dart          # Home screen
  │   │   └── search.dart        # Search results screen
  │   └── widgets/               # Reusable widgets
  │       ├── catBlock.dart      # Category block widget
  │       ├── customAppBar.dart  # Custom app bar
  │       └── searchBar.dart     # Search bar widget
  └── main.dart                  # Entry point of the application
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Pexels](https://www.pexels.com/) for providing the amazing wallpaper API
- Flutter and Dart team for the awesome framework

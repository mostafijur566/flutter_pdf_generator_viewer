# Flutter PDF Generator and Viewer

This Flutter desktop application demonstrates how to generate, view, and print PDF files using Dart and various Flutter packages. The project showcases the integration of the `pdf` package to create PDF documents dynamically, and platform-specific commands to open the generated PDF files with the default viewer for a seamless user experience. This project serves as a foundation for developers looking to incorporate PDF generation and management functionalities in their own applications.

## Key Features

- PDF generation with custom content
- Opening generated PDF files in the default viewer
- Platform-specific implementation for Linux, macOS, and Windows

## Getting Started

To run this project, follow these steps:

1. Clone the repository.
2. Navigate to the project folder and run `flutter pub get` to install dependencies.
3. Run `flutter run` to launch the application.

## Dependencies

This project uses the following Flutter packages:

- [pdf](https://pub.dev/packages/pdf) for PDF generation
- [path_provider](https://pub.dev/packages/path_provider) for accessing system paths
- [file_selector](https://pub.dev/packages/file_selector) for opening files (optional)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

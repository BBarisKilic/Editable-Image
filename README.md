# EditableImage Flutter Package

[Flutter](https://flutter.dev/) package for creating a fully customizable and editable image widget. The package has been written solely in [Dart Language](https://dart.dev/).

&nbsp;

| ![1](https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_6.gif?raw=true)    | ![2](https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_7.gif?raw=true)    
| -------------------------------------------------------- | -------------------------------------------------------- |

&nbsp;

## Features

A powerful and fully customizable widget. It provides a custom widget to save time.

For example, almost in every `profile settings` interface, etc., there is a profile image. Instead of writing from scratch, this widget can be used and can save a lot of time.

&nbsp;

| ![1](https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_1.png?raw=true)    | ![2](https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_2.png?raw=true)    
| -------------------------------------------------------- | -------------------------------------------------------- |
| ![3](https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_3.png?raw=true)    | ![4](https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_4.png?raw=true) 
| ![5](https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_5.png?raw=true)    | 

&nbsp;

## Getting started

Let's take a look at how to implement `EditableImage` to fastly create user interfaces for profile picture edit, etc.

Firstly, add following line to `pubspec.yaml`:
```yaml
editable_image: ^0.1.0
```

Second, import `EditableImage`:
```dart
import 'package:editable_image/editable_image.dart';
```

Lastly, make platform-specific setups by applying the following instructions.

### iOS Setup

- Platform version must be at least 9.0. Please modify `ios/Podfile` and update accordingly:
```ruby
platform :ios, '9.0'
```

- Add the following lines to `ios/Runner/Info.plist`:
```plist
<key>NSPhotoLibraryUsageDescription</key>
<string>Put here your permission description.</string>
```

### Android Setup

Required permissions: `INTERNET`, `READ_EXTERNAL_STORAGE`.

If you found some warning logs with Glide appearing, then the main project needs an implementation of `AppGlideModule`. See [Generated API](https://sjudd.github.io/glide/doc/generatedapi.html).

### macOS Setup

- Platform version must be at least 10.15. Please modify `macos/Podfile` and update accordingly:
```ruby
platform :osx, '10.15'
```

- Please set the minimum deployment target to 10.15. Use XCode to open `macos/Runner.xcworkspace`:

- Follow the iOS instructions and modify `ios/Runner/Info.plist` accordingly.

&nbsp;

## Usage

Basic usage example: 

`main.dart`
```dart
// A simple usage of EditableImage.
// This method gets called when trying to change an image.
void _directUpdateImage(File? file) async {
    if (file == null) return;

    _profilePicFile = file;
    setState(() {});
}

EditableImage(
// Define the method that will run on the change process of the image.
onChange: (file) => _directUpdateImage(file),

// Define the source of the image.
image: _profilePicFile.existsSync()
    ? Image.file(_profilePicFile, fit: BoxFit.cover)
    : null,

// Define the size of EditableImage.
size: 150.0,

// Define the Theme of image picker.
imagePickerTheme: ThemeData(
    // Define the default brightness and colors.
    primaryColor: Colors.white,
    shadowColor: Colors.transparent,
    backgroundColor: Colors.white70,
    iconTheme: const IconThemeData(color: Colors.black87),

    // Define the default font family.
    fontFamily: 'Georgia',
),

// Define the border of the image if needed.
imageBorder: Border.all(color: Colors.black87, width: 2.0),

// Define the border of the icon if needed.
editIconBorder: Border.all(color: Colors.black87, width: 2.0),
),
```

&nbsp;

## Example

More examples can be found in `/example` folder on [GitHub](https://github.com/BBarisKilic/Editable-Image). 

[User Profile 1]() - an example of basic implementation of `EditableImage`. Simple project that simulates user profile edit screen.

[User Profile 2]() - an example of implementation of `EditableImage`. Simple project that simulates user profile edit screen.

&nbsp;

## Additional information

This package has been written solely in Dart Language yet it has the [wechat_assets_picker](https://github.com/fluttercandies/flutter_wechat_assets_picker) as a dependency. Therefore, `EditableImage` currently supports only `Android`, `iOS`, and `macOS` platforms. In the future, other platform supports may be added.

For more information please visit [GitHub](https://github.com/BBarisKilic/Editable-Image).

&nbsp;

## Feature requests and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/BBarisKilic/Editable-Image/issues).

&nbsp;

## Maintainers

- [Bulent Baris Kilic](https://github.com/BBarisKilic)
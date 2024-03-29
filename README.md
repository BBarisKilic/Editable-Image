# Editable Image | Flutter Package

[Flutter](https://flutter.dev/) package for creating a fully customizable and editable image widget. The package has been written solely in [Dart Language](https://dart.dev/).

&nbsp;

| ![editable_image_gif_1](https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_gif_1.gif?raw=true) | ![editable_image_gif_2](https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_gif_2.gif?raw=true)    
| -------------------------------------------------------- | -------------------------------------------------------- |

&nbsp;

## Features

A powerful and fully customizable widget. It provides a custom widget to save time.

For example, almost in every `profile settings` interface, etc., there is a profile image. Instead of writing from scratch, this widget can be used and can save a lot of time.

&nbsp;

<table>
<tr>
<td valign="center"><img src="https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_1.png?raw=true"> 
</td>
<td valign="center"><img src="https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_2.png?raw=true"> 
</td>
<td valign="center"><img src="https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_3.png?raw=true"> 
</td>
</tr>
<tr>
<td valign="center"><img src="https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_4.png?raw=true"> 
</td>
<td valign="center"><img src="https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_5.png?raw=true"> 
</td>
<td valign="center"><img src="https://github.com/BBarisKilic/Editable-Image/blob/master/screenshot/editable_image_6.png?raw=true"> 
</td>
</tr>
</table>

&nbsp;

## Getting started

Let's take a look at how to implement `EditableImage` to fastly create user interfaces for profile picture edit, etc.

First, add following line to `pubspec.yaml`:
```yaml
editable_image: ^2.0.0
```

Second, import `EditableImage`:
```dart
import 'package:editable_image/editable_image.dart';
```

Lastly, make platform-specific setups by applying the following instructions.

### Android Setup

- The minimum required SDK version is `21`. Therefore, please find the following line inside `android/app/build.gradle` and modify it:
```gradle
compileSdkVersion 33
..
..
..
minSdkVersion 21
targetSdkVersion 33
```

- Please upgrade the Kotlin version (ext.kotlin_version) to `1.7.0` or the latest version. To  do that, find the following line inside `android/build.gradle` and modify it:
```gradle
ext.kotlin_version = '1.7.0'
```

- Please upgrade the Gradle version (ext.kotlin_version) to `6.8.3` or the latest version but lower than `7.0.0`. To  do that, find the following line inside `android/gradle/wrapper/gradle-wrapper.properties` and modify it:
```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-6.8.3-all.zip
```

- Please go to your project folder and add `android:exported="true"` to AndroidManifest.xml file
```
<activity
     android:name=".MainActivity"
     android:exported="true"
     android:launchMode="singleTop"
     android:theme="@style/LaunchTheme"
 </activity>
 ```

- Required permissions: `READ_EXTERNAL_STORAGE`. Please modify `android/app/src/main/AndroidManifest.xml` and update accordingly:
```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

- I recommand you add `android:requestLegacyExternalStorage="true"` to AndroidManifest.xml. Therefore, please modify `android/app/src/main/AndroidManifest.xml` and add the following line inside `application`:
```xml
<application android:requestLegacyExternalStorage="true"</application>
```

If you found some warning logs with Glide appearing, then the main project needs an implementation of `AppGlideModule`. See [Generated API](https://sjudd.github.io/glide/doc/generatedapi.html).

### iOS Setup

- Platform version must be at least 9.0. Please modify `ios/Podfile` and update accordingly:
```ruby
platform :ios, '11.0'
```

- Add the following lines to `ios/Runner/Info.plist`:
```plist
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSAllowsArbitraryLoads</key>
	<true/>
</dict>
<key>NSPhotoLibraryUsageDescription</key>
<string>Put here your permission description.</string>
```

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

    setState(() {
      _profilePicFile = file;
    });
}

EditableImage(
// Define the method that will run on the change process of the image.
onChange: (file) => _directUpdateImage(file),

// Define the source of the image.
image: _profilePicFile != null
    ? Image.file(_profilePicFile!, fit: BoxFit.cover)
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

[User Profile 1](https://github.com/BBarisKilic/Editable-Image/tree/master/example/user_profile_1) - an example of basic implementation of `EditableImage`. Simple project that simulates user profile edit screen.

[User Profile 2](https://github.com/BBarisKilic/Editable-Image/tree/master/example/user_profile_2) - an example of implementation of `EditableImage`. Simple project that simulates user profile edit screen.

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
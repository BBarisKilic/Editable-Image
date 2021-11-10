# Example
 
[User Profile 1](https://github.com/BBarisKilic/Editable-Image/tree/master/example/user_profile_1) - an example of basic implementation of `EditableImage`. Simple project that simulates user profile edit screen.

[User Profile 2](https://github.com/BBarisKilic/Editable-Image/tree/master/example/user_profile_2) - an example of implementation of `EditableImage`. Simple project that simulates user profile edit screen.

---

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

---
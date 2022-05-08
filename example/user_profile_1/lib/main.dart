// Copyright 2021 The EditableImage Author. All rights reserved.
// Use of this source code is governed by a Apache 2.0-style license
// that can be found in the LICENSE file.

import 'dart:io';

import 'package:editable_image/editable_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const UserProfile());
}

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  File? _profilePicFile;

  @override
  void initState() {
    super.initState();
  }

  // A simple usage of EditableImage.
  // This method gets called when trying to change an image.
  void _directUpdateImage(File? file) async {
    if (file == null) return;

    _profilePicFile = file;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Profile Settings',
                style: TextStyle(
                  fontSize: 28.0,
                ),
              ),
              const Spacer(flex: 2),
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
              const Spacer(flex: 2),
              _buildTextField(labelText: 'Username'),
              const Spacer(),
              _buildTextField(labelText: 'Full Name'),
              const Spacer(),
              _buildTextField(labelText: 'Email'),
              const Spacer(),
              _buildTextField(labelText: 'Password', obscureText: true),
              const Spacer(flex: 2),
              _buildTextButton(),
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildTextField({String labelText = '', bool obscureText = false}) {
    return TextField(
      cursorColor: Colors.black54,
      cursorWidth: 1.0,
      obscureText: obscureText,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 18.0,
        ),
        fillColor: Colors.red,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
      ),
    );
  }

  TextButton _buildTextButton() {
    return TextButton(
      onPressed: () => {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 20.0),
        ),
        side:
            MaterialStateProperty.all(const BorderSide(color: Colors.black54)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: const Text(
        'Save',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
    );
  }
}

// Copyright 2021 The EditableImage Author. All rights reserved.
// Use of this source code is governed by a Apache 2.0-style license
// that can be found in the LICENSE file.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// Enum for helping to set edit icon's [Position].
enum Position {
  /// Set the edit icon's position to the top left corner.
  topLeft,

  /// Set the edit icon's position to the top right corner.
  topRight,

  /// Set the edit icon's position to the bottom left corner.
  bottomLeft,

  /// Set the edit icon's position to the bottom right corner.
  bottomRight,
}

/// {@template editable_image}
/// [EditableImage] is a powerful and fully customizable widget.
/// It provides a custom widget to save time.
///
/// For example, almost in every "profile settings" interface,
/// there is a profile image. Instead of writing from scratch,
/// this widget can be used  and can save a lot of time.
/// {@endtemplate}
class EditableImage extends StatelessWidget {
  /// {@macro editable_image}
  const EditableImage({
    required this.onChange,
    super.key,
    this.image,
    this.size,
    this.imageBorder,
    this.imageDefault,
    this.imageDefaultColor,
    this.imageDefaultBackgroundColor,
    this.imagePickerTheme,
    this.imagePickerTextDelegate = const EnglishAssetPickerTextDelegate(),
    this.editIcon,
    this.editIconColor,
    this.editIconBackgroundColor,
    this.editIconBorder,
    this.editIconPosition,
  });

  /// [onChange] Function to access and override the process on
  /// change of image.
  final void Function(File? file) onChange;

  /// An [Image] widget that shows the main profile picture, etc.
  final Image? image;

  /// A variable to determine the [size] of the EditableImage.
  final double? size;

  /// A [Border] to add a border to the main image.
  final Border? imageBorder;

  /// An [IconData] to set a default icon to be shown when there
  /// is no image.
  final IconData? imageDefault;

  /// A [Color] to set a default color of the icon to be shown
  /// when there is no image.
  final Color? imageDefaultColor;

  /// A [Color] to set a default background color of the icon to
  /// be shown when there is no image.
  final Color? imageDefaultBackgroundColor;

  /// A [ThemeData] to set the theme of the image picker.
  final ThemeData? imagePickerTheme;

  /// A [AssetPickerTextDelegate] to set the language of the image picker.
  final AssetPickerTextDelegate imagePickerTextDelegate;

  /// An [IconData] that will be shown at the bottom as a small
  /// edit icon.
  final IconData? editIcon;

  /// A [Color] to set the default color of the edit icon.
  final Color? editIconColor;

  /// A [Color] to set default background color of the edit
  /// icon.
  final Color? editIconBackgroundColor;

  /// A [Border] to add a border to the edit icon.
  final Border? editIconBorder;

  /// A [Position] to set edit icon's position.
  final Position? editIconPosition;

  // A method that calls image picker package.
  // It also calls [onChange] function.
  Future<void> _getImage(BuildContext context) async {
    final assets = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        maxAssets: 1,
        requestType: RequestType.image,
        pickerTheme: imagePickerTheme,
        textDelegate: imagePickerTextDelegate,
      ),
    );

    if (assets == null) return;

    onChange(await assets[0].file);
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            // Default size of the EditableImage is 140.0
            height: size ?? 140.0,
            width: size ?? 140.0,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Builds main image.
                // For example, profile picture.
                _buildImage(),
                Align(
                  alignment: _getPosition(),
                  child: InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    highlightColor: Colors.transparent,

                    // When edit icon tapped, calls _getImage() method.
                    onTap: () => _getImage(context),

                    // Builds edit icon.
                    child: _buildIcon(),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  // Builds main image.
  // For example, profile picture.
  Widget _buildImage() => DecoratedBox(
        decoration: BoxDecoration(
          color: imageDefaultBackgroundColor ?? Colors.white,
          border: imageBorder ?? const Border(),
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: image ??
              Icon(
                imageDefault ?? Icons.person,
                size: size != null ? (size ?? 140.0) * 0.75 : 105.0,
                color: imageDefaultColor ?? Colors.black87,
              ),
        ),
      );

  // Returns the edit icon's position based on editIconPosition variable.
  AlignmentGeometry _getPosition() {
    switch (editIconPosition) {
      case Position.topLeft:
        return Alignment.topLeft;
      case Position.topRight:
        return Alignment.topRight;
      case Position.bottomLeft:
        return Alignment.bottomLeft;
      case Position.bottomRight:
        return Alignment.bottomRight;
      case null:
        return Alignment.bottomRight;
    }
  }

  // Builds edit icon.
  Widget _buildIcon() => Container(
        height: size != null ? (size ?? 140.0) * 0.25 : 35.0,
        width: size != null ? (size ?? 140.0) * 0.25 : 35.0,
        decoration: BoxDecoration(
          color: editIconBackgroundColor ?? Colors.white,
          border: editIconBorder ?? const Border(),
          shape: BoxShape.circle,
        ),
        child: Icon(
          editIcon ?? Icons.edit,
          size: size != null ? (size ?? 140.0) * 0.15 : 21.0,
          color: editIconColor ?? Colors.black87,
        ),
      );
}

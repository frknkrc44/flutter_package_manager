import 'dart:convert';

import 'package:flutter/material.dart';

/// The class for package information.
/// Contains package name (e.g., com.facebook.katana), app name (e.g., Facebook), and app icon
class PackageInfo {
  PackageInfo({
    this.packageName,
    this.appName,
    this.appIconByteArray,
    this.versionCode,
    this.versionName,
  });

  /// Construct class from the json map
  factory PackageInfo.fromMap(Map map) => map == null
      ? null
      : PackageInfo(
          packageName: map['packageName'],
          appIconByteArray: _eliminateNewLine(map['appIcon']),
          appName: map['appName'],
          versionCode: map['versionCode'],
          versionName: map['versionName'],
        );

  final String packageName;
  final String appName;
  final String appIconByteArray;
  final String versionCode;
  final String versionName;

  /// Get flutter's `Image` widget from the byte array of app icon
  Image getAppIcon({
    BoxFit fit = BoxFit.fill,
    double height = 32.0,
    double width = 32.0,
  }) =>
      appIconByteArray != null
          ? Image.memory(
              base64Decode(appIconByteArray),
              fit: fit,
              height: height,
              width: width,
            )
          : null;

  @override
  String toString() =>
      'Package: $packageName, AppName: $appName, IconByteArray size: ${appIconByteArray?.length}, VersionCode: $versionCode, VersionName: $versionName';
}

String _eliminateNewLine(String s) => s?.replaceAll('\n', '');

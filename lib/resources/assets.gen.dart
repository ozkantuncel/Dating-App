/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/Hide.svg
  String get hide => 'assets/icon/Hide.svg';

  /// File path: assets/icon/add_user.svg
  String get addUser => 'assets/icon/add_user.svg';

  /// File path: assets/icon/apple.svg
  String get apple => 'assets/icon/apple.svg';

  /// File path: assets/icon/back.svg
  String get back => 'assets/icon/back.svg';

  /// File path: assets/icon/diamond.png
  AssetGenImage get diamond => const AssetGenImage('assets/icon/diamond.png');

  /// File path: assets/icon/fav.png
  AssetGenImage get fav => const AssetGenImage('assets/icon/fav.png');

  /// File path: assets/icon/favs.png
  AssetGenImage get favs => const AssetGenImage('assets/icon/favs.png');

  /// File path: assets/icon/gem.svg
  String get gem => 'assets/icon/gem.svg';

  /// File path: assets/icon/google.svg
  String get google => 'assets/icon/google.svg';

  /// File path: assets/icon/hide_password.svg
  String get hidePassword => 'assets/icon/hide_password.svg';

  /// File path: assets/icon/home.svg
  String get home => 'assets/icon/home.svg';

  /// File path: assets/icon/message.svg
  String get message => 'assets/icon/message.svg';

  /// File path: assets/icon/meta.svg
  String get meta => 'assets/icon/meta.svg';

  /// File path: assets/icon/plus.svg
  String get plus => 'assets/icon/plus.svg';

  /// File path: assets/icon/profile.svg
  String get profile => 'assets/icon/profile.svg';

  /// File path: assets/icon/show_password.svg
  String get showPassword => 'assets/icon/show_password.svg';

  /// File path: assets/icon/unlock.svg
  String get unlock => 'assets/icon/unlock.svg';

  /// File path: assets/icon/upalt.png
  AssetGenImage get upalt => const AssetGenImage('assets/icon/upalt.png');

  /// List of all assets
  List<dynamic> get values => [
        hide,
        addUser,
        apple,
        back,
        diamond,
        fav,
        favs,
        gem,
        google,
        hidePassword,
        home,
        message,
        meta,
        plus,
        profile,
        showPassword,
        unlock,
        upalt
      ];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/sinflixlogo.png
  AssetGenImage get sinflixlogo =>
      const AssetGenImage('assets/image/sinflixlogo.png');

  /// File path: assets/image/sinflixsplash.png
  AssetGenImage get sinflixsplash =>
      const AssetGenImage('assets/image/sinflixsplash.png');

  /// List of all assets
  List<AssetGenImage> get values => [sinflixlogo, sinflixsplash];
}

class Assets {
  const Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

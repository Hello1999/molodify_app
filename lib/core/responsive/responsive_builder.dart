import 'package:flutter/material.dart';
import 'package:melodify_app/core/responsive/breakpoint.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ScreenSize screenSize) builder;


  const ResponsiveBuilder({
    super.key,
    required this.builder
  });

  static ScreenSize of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return _getScreenSize(size);
    
  }

  static ScreenSize _getScreenSize(Size size) {
    final width = size.width;
    final height = size.height;
    final isPortrait = height > width;

    DeviceType deviceType;
    if (width < Breakpoint.mobile) {
      deviceType = DeviceType.mobile;
    } else if (width < Breakpoint.tablet) {
      deviceType = DeviceType.tablet;
    } else {
      deviceType = DeviceType.desktop;
    }

    return ScreenSize(width: width, height: height, deviceType: deviceType, isPortrait: isPortrait);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ResponsiveValue<T> {
  final T mobile;
  final T? tablet;
  final T? desktop;

  const ResponsiveValue({
     required this.mobile,
     this.tablet,
     this.desktop
  });

  T getValue(ScreenSize screenSize) {
    switch (screenSize.deviceType) {
      case DeviceType.mobile:
      return mobile;
      case DeviceType.tablet:
      return tablet ?? mobile;
      case DeviceType.desktop:
      return desktop ?? tablet ?? mobile;
    }
  }
}

extension ResponsiveExtension on BuildContext {
  ScreenSize get screenSize => ResponsiveBuilder.of(this);

  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop
  }) {
    return ResponsiveValue<T>(mobile: mobile, tablet: tablet, desktop: desktop).getValue(screenSize);
  }
}
class Breakpoint {
  Breakpoint._();

  // 断点值
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  static const double largeDesktop = 1800;

  // 内容最大宽度
  static const double maxContentWidth = 1400;

  // 边距
  static const double mobilePadding = 16;
  static const double tabletPadding = 24;
  static const double desktopPadding = 32;
}

enum DeviceType { mobile, tablet, desktop }

class ScreenSize {
  final double width;
  final double height;
  final DeviceType deviceType;
  final bool isPortrait;

  const ScreenSize({
    required this.width,
    required this.height,
    required this.deviceType,
    required this.isPortrait,
  });

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;
  bool get isLandscape => !isPortrait;

  int get gridColumns {
    switch (deviceType) {
      case DeviceType.mobile:
        return isPortrait ? 2 : 3;
      case DeviceType.tablet:
        return isPortrait ? 3 : 4;
      case DeviceType.desktop:
        return width > Breakpoint.largeDesktop ? 6 : 5;
    }
  }

  // 获取合适的边距
  double get horizontalPadding {
    switch (deviceType) {
      case DeviceType.mobile:
        return Breakpoint.mobilePadding;
      case DeviceType.tablet:
        return Breakpoint.mobilePadding;
      case DeviceType.desktop:
        return Breakpoint.tabletPadding;
    }
  }
}

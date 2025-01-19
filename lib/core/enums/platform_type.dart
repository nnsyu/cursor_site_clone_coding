enum PlatformType {
  web,
  tablet,
  mobile;

  static PlatformType fromWidth(double width) {
    if (width > 1024) {
      return PlatformType.web;
    } else if (width > 768) {
      return PlatformType.tablet;
    } else {
      return PlatformType.mobile;
    }
  }
}

part of settings;

Widget AppLogo({AppLogoSize size = AppLogoSize.small}) {
  double? width, height;
  switch (size) {
    case AppLogoSize.small:
      width = 50;
      height = 80;
      break;
    case AppLogoSize.medium:
      width = 100;
      height = 160;
      break;
    case AppLogoSize.big:
      width = 520;
      height = 520;
      break;
    default:
      break;
  }
  return Image.asset(
    '../../assets/images/logo.png',
    width: width,
    height: height,
  );
}

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';

class SvgPaths {
  static const logo = 'assets/svg/logo.svg';
  static const boy = 'assets/svg/boy.svg';
  static const logoLarge = 'assets/svg/logo_large.svg';
  static const email = 'assets/svg/mail.svg';
}

class ImagePaths {
  static const iconSneaker = 'assets/images/icon_sneaker.jpg';
}

class SNOIcon {
  static SvgPicture logo = SvgPicture.asset(SvgPaths.logo);
  static SvgPicture logoLarge = SvgPicture.asset(SvgPaths.logoLarge);
  static SvgPicture boy = SvgPicture.asset(SvgPaths.boy);
  static SvgPicture email = SvgPicture.asset(SvgPaths.email);
  static Image iconSneaker = Image.asset(ImagePaths.iconSneaker);
}

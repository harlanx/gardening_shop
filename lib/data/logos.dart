import 'dart:math';
import 'dart:ui';

class Logo {
  const Logo({
    required this.label,
    required this.point,
    required this.size,
    this.url,
  });

  final String label;
  final Point point;
  final Size size;
  final String? url;
}

enum SocialLogo {
  facebook(
    Logo(
      label: 'Facebook',
      point: Point(0, 0),
      size: Size(25, 25),
      url: '',
    ),
  ),
  x(
    Logo(
      label: 'X',
      point: Point(25, 0),
      size: Size(25, 25),
      url: '',
    ),
  ),
  googlePlus(
    Logo(
      label: 'Google Plus',
      point: Point(50, 0),
      size: Size(25, 25),
      url: '',
    ),
  ),
  youtube(
    Logo(
      label: 'Youtube',
      point: Point(75, 0),
      size: Size(25, 25),
      url: '',
    ),
  ),
  instagram(
    Logo(
      label: 'Instagram',
      point: Point(150, 0),
      size: Size(25, 25),
      url: '',
    ),
  ),
  pinterest(
    Logo(
      label: 'Pinterest',
      point: Point(175, 0),
      size: Size(25, 25),
      url: '',
    ),
  ),
  linkedin(
    Logo(
      label: 'Linked In',
      point: Point(200, 0),
      size: Size(25, 25),
      url: '',
    ),
  ),
  snapchat(
    Logo(
      label: 'Snapchat',
      point: Point(225, 0),
      size: Size(25, 25),
      url: '',
    ),
  ),
  whatsapp(
    Logo(
      label: 'WhatsApp',
      point: Point(214, 25),
      size: Size(25, 25),
      url: '',
    ),
  ),
  tiktok(
    Logo(
      label: 'Tiktok',
      point: Point(239, 25),
      size: Size(25, 25),
      url: '',
    ),
  );

  const SocialLogo(this.value);
  final Logo value;
  static const source = 'assets/icons/png/social_logos.png';
}

enum PaymentLogo {
  earthlyPay(
    Logo(
      label: 'Earthly Pay',
      point: Point(0, 0),
      size: Size(50, 25),
      url: '',
    ),
  ),
  earthlyPayLater(
    Logo(
      label: 'Earthly Pay Later',
      point: Point(50, 0),
      size: Size(50, 25),
      url: '',
    ),
  ),
  dragonPay(
    Logo(
      label: 'DragonPay',
      point: Point(100, 0),
      size: Size(50, 25),
      url: '',
    ),
  ),
  mastercard(
    Logo(
      label: 'MasterCard',
      point: Point(150, 0),
      size: Size(50, 25),
      url: '',
    ),
  ),
  visa(
    Logo(
      label: '',
      point: Point(200, 0),
      size: Size(50, 25),
      url: '',
    ),
  ),
  jcb(
    Logo(
      label: '',
      point: Point(250, 0),
      size: Size(50, 25),
      url: '',
    ),
  ),
  bpi(
    Logo(
      label: '',
      point: Point(0, 25),
      size: Size(50, 25),
      url: '',
    ),
  ),
  maya(
    Logo(
      label: '',
      point: Point(50, 25),
      size: Size(50, 25),
      url: '',
    ),
  ),
  gCash(
    Logo(
      label: '',
      point: Point(100, 25),
      size: Size(50, 25),
      url: '',
    ),
  ),
  paypal(
    Logo(
      label: '',
      point: Point(150, 25),
      size: Size(50, 25),
      url: '',
    ),
  ),
  americanExpress(
    Logo(
      label: '',
      point: Point(200, 25),
      size: Size(50, 25),
      url: '',
    ),
  ),
  applePay(
    Logo(
      label: '',
      point: Point(250, 25),
      size: Size(50, 25),
      url: '',
    ),
  ),
  ;

  const PaymentLogo(this.value);
  final Logo value;
  static const source = 'assets/icons/png/payment_logos.png';
}

part of '../../screens/home.dart';

final Map<String, List<String>> _basicColumns = {
  'Customer Service': [
    'Help Centre',
    'Earthly Cares PH',
    'Payment Methods',
    'Earthly Coins',
    'Order Tracking',
    'Free Shipping',
    'Return & Refund',
    'Earthly Guarantee',
    'Overseas Product',
    'Contact Us',
  ],
  'About Earthly': [
    'About Us',
    'Earthly Blog',
    'Earhly Careers',
    'Earhly Policies',
    'Privacy Policy',
    'Earthly Mall',
    'Seller Centre',
    'Flash Deals',
    'Media Contact',
  ],
};

final paymentLogos = [
  PaymentLogo.earthlyPay,
  PaymentLogo.earthlyPayLater,
  PaymentLogo.dragonPay,
  PaymentLogo.mastercard,
  PaymentLogo.paypal,
  PaymentLogo.bpi,
  PaymentLogo.applePay,
];

final socialLogos = [
  SocialLogo.facebook,
  SocialLogo.x,
  SocialLogo.instagram,
  SocialLogo.youtube,
];

class BottomDetails extends StatelessWidget {
  const BottomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MoreDetail(
            title: 'Buy and Sell Online on Shopee PH',
            detail:
                '''Welcome to Earthly, your one-stop online shop for all things gardening. At Earthly, we are passionate about bringing the beauty of nature into your home and garden. Our carefully curated selection of plants and seedlings includes everything from lush indoor greens to vibrant outdoor blooms, ensuring that you find the perfect addition to your space. Whether you're a seasoned gardener or just starting out, we have the plants to suit your needs.
                
                In addition to our diverse plant offerings, Earthly provides a range of essential gardening supplies to help your garden thrive. From high-quality fertilizers to eco-friendly gardening tools, we ensure that your plants receive the best care possible. Our commitment to sustainability and the environment is reflected in every product we offer. At Earthly, we believe in growing not just plants, but a greener future for everyone.''',
          ),
          const SizedBox(height: 20),
          const MoreDetail(
            title: 'Get Vouchers and Free Shipping',
            detail:
                '''At Earthly, we believe in making gardening accessible and enjoyable for everyone, which is why we offer special vouchers and free shipping options to enhance your shopping experience. Whether you're purchasing your first plant or stocking up on gardening essentials, you can take advantage of our exclusive vouchers to save on your favorite items. Plus, enjoy the convenience of free shipping on orders over a certain amount, ensuring that your gardening goodies arrive right at your doorstep without any extra cost. Shop at Earthly today and grow your garden with ease and savings!''',
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 50,
            runSpacing: 10,
            children: [
              ...[
                for (var entry in _basicColumns.entries.toList())
                  BottomDetailsColumn(
                    label: entry.key,
                    items: [
                      for (var item in entry.value)
                        WebLink(
                          text: item,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          color: Colors.black,
                          hoverColor: AppData.color,
                        ),
                    ],
                  ),
              ],
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 170),
                child: BottomDetailsWrap(
                  label: 'Payment',
                  items: [
                    for (var item in paymentLogos)
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 5),
                        child: LogoPicker(
                          source: PaymentLogo.source,
                          point: item.value.point,
                          size: item.value.size,
                        ),
                      ),
                  ],
                ),
              ),
              BottomDetailsColumn(
                label: 'Follow Us',
                items: [
                  for (var item in socialLogos)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LogoPicker(
                          source: SocialLogo.source,
                          point: item.value.point,
                          size: item.value.size,
                          color: Colors.grey.shade800,
                        ),
                        WebLink(
                          text: item.value.label,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          color: Colors.black,
                          hoverColor: AppData.color,
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomDetailsColumn extends StatelessWidget {
  const BottomDetailsColumn({
    super.key,
    required this.label,
    required this.items,
  });

  final String label;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          label.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textScaler: const TextScaler.linear(1.2),
        ),
        const SizedBox(height: 10),
        ...items.insertBetween(const SizedBox(height: 5)),
      ],
    );
  }
}

class BottomDetailsWrap extends StatelessWidget {
  const BottomDetailsWrap({
    super.key,
    required this.label,
    required this.items,
  });

  final String label;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          label.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textScaler: const TextScaler.linear(1.2),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...items,
          ],
        ),
      ],
    );
  }
}

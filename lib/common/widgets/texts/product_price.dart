import 'package:flutter/material.dart';

class XProductPrice extends StatelessWidget {
  const XProductPrice({
    super.key,
    required this.price,
  });
  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$price',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

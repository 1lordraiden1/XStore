import 'package:flutter/material.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XGridLayout extends StatelessWidget {
  const XGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 310,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: XSizes.gridViewSpacing,
        crossAxisSpacing: XSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
        //childAspectRatio: 2,
      ),
      itemBuilder: itemBuilder,
    );
  }
}

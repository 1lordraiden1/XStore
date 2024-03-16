import 'package:flutter/widgets.dart';
import 'package:xstore/common/shimmer/shimmer_effect.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';

class XBrandsShimmer extends StatelessWidget {
  const XBrandsShimmer({super.key,  this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return  XGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_,__)=>const XShimmerEffect(width: 100, height: 80,),
    );
  }
}
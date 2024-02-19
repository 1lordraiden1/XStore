import 'package:flutter/material.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XFormDivider extends StatelessWidget {
  const XFormDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? XColors.darkGrey : XColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        )
      ],
    );
  }
}

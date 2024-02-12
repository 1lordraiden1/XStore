import 'package:flutter/material.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/device/device_utility.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XTabbar extends StatelessWidget implements PreferredSizeWidget {
  const XTabbar({super.key, this.tabs});

  final List<Widget>? tabs;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    // TODO: implement build
    return Material(
      color: dark ? XColors.black : XColors.white,
      child: TabBar(
        tabs: tabs!,
        indicatorColor: XColors.primary,
        isScrollable: true,
        labelColor: dark ? XColors.white : XColors.black,
        unselectedLabelColor: XColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(XDeviceUtils.getAppBarHeight());
}

import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/shapes/containers/circular_container.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XChoiceChip extends StatelessWidget {
  const XChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    bool isColor = XHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(
          color: selected ? XColors.white : null,
        ),
        avatar: isColor
            ? XCircularBackground(
                width: 50,
                height: 50,
                backgroundColor: XHelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding:
            isColor ? const EdgeInsets.all(0) : null, // Centering the Icon
        padding: isColor ? const EdgeInsets.all(0) : null,
        //selectedColor: Colors.green,
        backgroundColor: isColor ? XHelperFunctions.getColor(text) : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: XAppBar(
        showBackArrow: true,
        title: Text("Change Name", ),
      ),
    );
  }
}
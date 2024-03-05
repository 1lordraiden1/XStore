import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/blindings/general_bindings.dart';

import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/routers/app_routes.dart';
import 'package:xstore/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: XAppTheme.lightTheme,
      darkTheme: XAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: XColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

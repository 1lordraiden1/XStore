import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xstore/app.dart';
import 'package:xstore/data/repositories/auth_repo.dart';
import 'package:xstore/firebase_options.dart';

Future<void> main() async {
  // Widgets Binding

  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // GetX Local Storage
  await GetStorage.init();

  // Await Splash till loading
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Init FB

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const MyApp());
}

import 'package:app_de_estudio/controllers/auth_controller.dart';
import 'package:app_de_estudio/controllers/theme_controller.dart';
import 'package:app_de_estudio/services/firebase_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() async {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => FirebaseStorageService());
    await Firebase.initializeApp();
  }
}

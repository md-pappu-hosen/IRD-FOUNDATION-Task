import 'package:get/get.dart';
import 'package:real_estate_ui_pages/routes/app_routes.dart';
import '../modules/splash/splash_view.dart';
import '../home/home_view.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page: () => const SplashView()),
    GetPage(name: Routes.HOME, page: () => const HomeView()),
  ];
}

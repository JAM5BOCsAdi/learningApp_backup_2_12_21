import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:learning_app/screens/splash/splash_screen.dart';

/// Different routes for the app screens
class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
      ];
}

import 'package:get/get.dart';

import '../modules/auth/login/bindings/auth_login_binding.dart';
import '../modules/auth/login/views/auth_login_view.dart';
import '../modules/auth/register/bindings/auth_register_binding.dart';
import '../modules/auth/register/views/auth_register_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_LOGIN,
      page: () => AuthLoginView(),
      binding: AuthLoginBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_REGISTER,
      page: () => AuthRegisterView(),
      binding: AuthRegisterBinding(),
    ),
  ];
}

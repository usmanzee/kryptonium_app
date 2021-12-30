import 'package:get/get.dart';
import 'package:kryptonium/views/auth/auth_home.dart';
import 'package:kryptonium/views/auth/login.dart';
import 'package:kryptonium/views/auth/register.dart';
import 'package:kryptonium/views/bottom_navbar/bottom_navbar.dart';
import 'package:kryptonium/views/currency/currency_deposit.dart';
import 'package:kryptonium/views/currency/currency_detail.dart';
import 'package:kryptonium/views/currency/currency_withdraw.dart';
import 'package:kryptonium/views/intro/intro_wizard.dart';
import 'package:kryptonium/views/splash/splash.dart';

class Router {
  static final route = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/intro', page: () => IntroWizard()),
    GetPage(name: '/auth_home', page: () => const AuthHome()),
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/register', page: () => Register()),
    GetPage(name: '/home', page: () => BottomNavBar()),
    GetPage(name: '/currency_detail', page: () => CurrencyDetail()),
    GetPage(name: '/currency_deposit', page: () => CurrencyDeposit()),
    GetPage(name: '/currency_withdraw', page: () => CurrencyWithdraw()),
  ];
}

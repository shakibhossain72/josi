import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:josi/features/sender/loacation_set_up_profile/presentation/screen/set_up_profile_screen.dart';
import 'package:josi/features/sender/loacation_set_up_profile/presentation/screen/verification_system_screen.dart';
import 'package:josi/features/sender/send_package/send_pacjage.dart';
import 'package:josi/features/traveler/nav_bar/presentation/screen/traveler_nav_bar.dart';
import 'package:josi/features/traveler/traveler_set_up_profile/presentation/screen/traveler_set_up_profile_screen.dart';
import '../features/auth/Presentation/screen/new_password_screen.dart';
import '../features/auth/Presentation/screen/pass_change_success_screen.dart';
import '../features/auth/Presentation/screen/reset_password_screen.dart';
import '../features/auth/Presentation/screen/sign_in_screen.dart';
import '../features/auth/Presentation/screen/sign_up_screen.dart';
import '../features/auth/Presentation/screen/verify_code_screen.dart';
import '../features/auth/Presentation/screen/verify_code_screen_for_reset.dart';
import '../features/choose_role/presentation/screen/choose_role_screen.dart';
import '../features/onboarding/presentation/screen/onboarding_screen.dart';
import '../features/sender/loacation_set_up_profile/presentation/screen/allow_location_screen.dart';
import '../features/sender/nav_bar/presentation/screen/nav_bar.dart';
import '../features/splash/presentation/screen/splash_screen.dart';

class AppRoute {
  static String init = "/";

  // Added by Shahriar
  static String splashScreen = "/splashScreen";
  static String navBar = "/navBar";
  static String onboardingScreen = "/onboardingScreen";
  static String chooseRoleScreen = "/chooseRoleScreen";

  // Added by shahriar auth section
  static String signUpScreen = "/signUpScreen";
  static String signInScreen = "/signInScreen";
  static String verifyCodeScreen = "/verifyCodeScreen";
  static String resetPasswordScreen = "/resetPasswordScreen";
  static String verifyCodeScreenForReset = "/verifyCodeScreenForReset";
  static String newPasswordScreen = "/newPasswordScreen";
  static String passChangeSuccessScreen = "/passChangeSuccessScreen";

  static String allowLocationScreen = "/allowLocationScreen";
  static String setUpProfileScreen = "/setUpProfileScreen";
  static String verificationSystemScreen = "/verificationSystemScreen";

  // Traveler screen
  static String travelerNavBar = "/travelerNavBar";
  static String travelerSetUpProfileScreen = "/travelerSetUpProfileScreen";
  static String sentpackagescreen = "/sentpackagescreen";

  // static String notificationScreen = "/notificationScreen";

  static List<GetPage> routes = [
    GetPage(name: init, page: () => const SplashScreen()),

    // Added by Shahriar
    // Sender Routes
    //GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: navBar, page: () => NavBar()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: chooseRoleScreen, page: () => ChooseRoleScreen()),

    GetPage(name: signUpScreen, page: () => (SignUpScreen())),
    GetPage(name: signInScreen, page: () => (SignInScreen())),
    GetPage(name: resetPasswordScreen, page: () => (ResetPasswordScreen())),
    GetPage(name: verifyCodeScreen, page: () => (VerifyCodeScreen())),
    GetPage(
      name: verifyCodeScreenForReset,
      page: () => (VerifyCodeScreenForReset()),
    ),
    GetPage(name: newPasswordScreen, page: () => (NewPasswordScreen())),

    GetPage(
      name: passChangeSuccessScreen,
      page: () => (PassChangeSuccessScreen()),
    ),
    GetPage(name: allowLocationScreen, page: () => (AllowLocationScreen())),
    GetPage(name: setUpProfileScreen, page: () => (SetUpProfileScreen())),
    GetPage(
      name: verificationSystemScreen,
      page: () => (VerificationSystemScreen()),
    ),

    // Added by shahriar
    // Traveler Routes
    GetPage(name: travelerNavBar, page: () => (TravelerNavBar())),
    GetPage(
      name: travelerSetUpProfileScreen,
      page: () => (TravelerSetUpProfileScreen()),
    ),
    GetPage(name: sentpackagescreen, page: () => (Sentpackage())),
  ];
}

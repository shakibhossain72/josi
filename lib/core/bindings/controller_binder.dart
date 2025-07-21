import 'package:get/get.dart';
import 'package:josi/features/sender/home/send_package/controller/sent_package_controller.dart';
import '../../features/auth/controller/new_password_controller.dart';
import '../../features/auth/controller/reset_password_controller.dart';
import '../../features/auth/controller/sign_in_controller.dart';
import '../../features/auth/controller/sign_up_controller.dart';
import '../../features/auth/controller/verify_code_for_reset_controller.dart';
import '../../features/auth/controller/verify_controller.dart';
import '../../features/choose_role/controller/choose_role_controlller.dart';
import '../../features/sender/booking/controller/booking_controller.dart';
import '../../features/sender/booking/controller/cancel_controller.dart';
import '../../features/sender/loacation_set_up_profile/presentation/controller/set_up_profile_controller.dart';
import '../../features/sender/loacation_set_up_profile/presentation/controller/verification_system_controller.dart';
import '../../features/splash/controller/splash_controller.dart';
import '../../features/traveler/traveler_set_up_profile/presentation/controller/traveler_set_up_profile_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {


      Get.put<SplashController>(SplashController(), permanent: true);
      Get.put<ChooseRoleController>(ChooseRoleController(), permanent: true);
      Get.put<SignInController>(SignInController(), permanent: true);
      Get.put<SignUpController>(SignUpController(), permanent: true);
      Get.put<VerifyController>(VerifyController(), permanent: true);
      Get.put<ResetPasswordController>(ResetPasswordController(), permanent: true);
      Get.put<VerifyCodeForResetController>(VerifyCodeForResetController(), permanent: true);
      Get.put<NewPasswordController>(NewPasswordController(), permanent: true);
      Get.put<TravelerSetUpProfileController>(TravelerSetUpProfileController(), permanent: true);
      Get.put<SetUpProfileController>(SetUpProfileController(), permanent: true);
      Get.put<VerificationSystemController>(VerificationSystemController(), permanent: true);
      Get.put<BookingController>(BookingController(), permanent: true);
      Get.put<CancelController>(CancelController(), permanent: true);


    Get.put<SplashController>(SplashController(), permanent: true);
    Get.put<ChooseRoleController>(ChooseRoleController(), permanent: true);
    Get.put<SignInController>(SignInController(), permanent: true);
    Get.put<SignUpController>(SignUpController(), permanent: true);
    Get.put<VerifyController>(VerifyController(), permanent: true);
    Get.put<ResetPasswordController>(
      ResetPasswordController(),
      permanent: true,
    );
    Get.put<VerifyCodeForResetController>(
      VerifyCodeForResetController(),
      permanent: true,
    );
    Get.put<NewPasswordController>(NewPasswordController(), permanent: true);
    Get.put<TravelerSetUpProfileController>(
      TravelerSetUpProfileController(),
      permanent: true,
    );
    Get.put<SetUpProfileController>(SetUpProfileController(), permanent: true);
    Get.put<VerificationSystemController>(
      VerificationSystemController(),
      permanent: true,
    );
    Get.put<SentPackageController>(SentPackageController(), permanent: true);

  }
}

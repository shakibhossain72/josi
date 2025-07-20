import 'package:get/get.dart';
import 'package:josi/core/utils/constants/image_path.dart';

class VerificationSystemController extends GetxController{



  RxInt selectedIndex = (-1).obs;

  final items = [
    {
      'title': 'ID',
      'image': ImagePath.userProfile,
    },
    {
      'title': 'Passport',
      'image': ImagePath.userProfile,
    },
    {
      'title': 'Driving License',
      'image': ImagePath.userProfile,
    },
  ].obs;

  void selectItem(int index) {
    selectedIndex.value = index;
    selectedIndex.refresh();
    print('Selected $index');
  }
}
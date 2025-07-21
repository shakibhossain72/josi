import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WriteReviewController extends GetxController{

  final RxInt rating = 0.obs;
  final writeComment = TextEditingController();

  void setRating(int value) {
    rating.value = value;
  }

}
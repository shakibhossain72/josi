import 'package:get/get.dart';

class BookingController extends GetxController {

  var orderList = <OrderModel>[
    OrderModel(statusIndex: 0),
    OrderModel(statusIndex: 1),
    OrderModel(statusIndex: 2),
    OrderModel(statusIndex: 3),
  ].obs;



  final List<String> statuses = [
    "Picked",
    "Out For Delivery",
    "Transit",
    "Package Delivered"
  ];
}

class OrderModel {
  final int statusIndex; // 0 = Picked, 1 = Out for Delivery, etc.

  OrderModel({required this.statusIndex});
}

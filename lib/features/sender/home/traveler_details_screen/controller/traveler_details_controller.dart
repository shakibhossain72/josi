import 'package:get/get.dart';

class TravelerDetailsController extends GetxController {
  // Selected shipment type
  var selectedShipmentType = ''.obs;
  var selectedDeliveryType = ''.obs;

  // Selected package size
  var selectedPackageSize = ''.obs;

  // Shipment type options
  final List<String> shipmentTypes = [
    'Books',
    'Documents',
    'Electronics',
    'Clothes',
    'Food Items',
    'Medicine',
  ];

  final List<String> deliveryTypes = [
    'Door-to-Door',
    'Drop-off / Pick-up Point',
    'Airport to Airport',
    'Meet in Person',
  ];

  // Package size options
  final List<String> packageSizes = ['1kg', '2kg', '3kg', '4kg', '5kg', '10kg'];

  // Set selected shipment type
  void setShipmentType(String value) {
    selectedShipmentType.value = value;
  }

  void setDeliveryType(String value) {
    selectedDeliveryType.value = value;
  }

  // Set selected package size
  void setPackageSize(String value) {
    selectedPackageSize.value = value;
  }
}

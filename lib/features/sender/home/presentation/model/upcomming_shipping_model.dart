class UpcomingShippingModel {
  final String id;
  final String senderName;
  final String about;
  final String senderImage;
  final bool isVerified;
  final String fromLocation;
  final String toLocation;
  final String departureDate;
  final String arrivalDate;
  final String space;
  final String price;
  final double rating;
  final int reviewCount;

  UpcomingShippingModel({
    required this.id,
    required this.senderName,
    required this.about,
    required this.senderImage,
    required this.isVerified,
    required this.fromLocation,
    required this.toLocation,
    required this.departureDate,
    required this.arrivalDate,
    required this.space,
    required this.price,
    required this.rating,
    required this.reviewCount,
  });

  factory UpcomingShippingModel.fromJson(Map<String, dynamic> json) {
    return UpcomingShippingModel(
      id: json['id'] ?? '',
      senderName: json['senderName'] ?? '',
      about: json['about'] ?? '',
      senderImage: json['senderImage'] ?? '',
      isVerified: json['isVerified'] ?? false,
      fromLocation: json['fromLocation'] ?? '',
      toLocation: json['toLocation'] ?? '',
      departureDate: json['departureDate'] ?? '',
      arrivalDate: json['arrivalDate'] ?? '',
      space: json['space'] ?? '',
      price: json['price'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderName': senderName,
      'senderImage': senderImage,
      'isVerified': isVerified,
      'fromLocation': fromLocation,
      'toLocation': toLocation,
      'departureDate': departureDate,
      'arrivalDate': arrivalDate,
      'space': space,
      'price': price,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }
}

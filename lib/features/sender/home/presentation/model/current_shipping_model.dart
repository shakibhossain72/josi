class ShippingData {
  final String trackingNumber;
  final String customer;
  final String from;
  final String to;
  final String status;
  final String arrivalDate;

  ShippingData({
    required this.trackingNumber,
    required this.customer,
    required this.from,
    required this.to,
    required this.status,
    required this.arrivalDate,
  });

  // Static method to get sample data
  static List<ShippingData> getSampleData() {
    return [
      ShippingData(
        trackingNumber: '#123135461235',
        customer: 'Jhon Deo',
        from: 'Paris',
        to: 'New York',
        status: 'In Transit',
        arrivalDate: '08-07-2025',
      ),
      ShippingData(
        trackingNumber: '#987654321098',
        customer: 'Jane Smith',
        from: 'London',
        to: 'Tokyo',
        status: 'In Transit',
        arrivalDate: '10-07-2025',
      ),
      ShippingData(
        trackingNumber: '#456789123456',
        customer: 'Mike Johnson',
        from: 'Berlin',
        to: 'Sydney',
        status: 'In Transit',
        arrivalDate: '12-07-2025',
      ),
    ];
  }
}

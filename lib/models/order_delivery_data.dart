class OrderDeliveryData {
  String orderId;
  String name;
  String address;
  String mobileNumber;
  String fromName;
  String fromAddress;
  String status;
  double startLatitude;
  double endLatitude;
  double startLongitude;

  OrderDeliveryData({
    required this.orderId,
    required this.name,
    required this.address,
    required this.mobileNumber,
    required this.fromName,
    required this.fromAddress,
    required this.status,
    required this.startLatitude,
    required this.endLatitude,
    required this.startLongitude,
  });
}

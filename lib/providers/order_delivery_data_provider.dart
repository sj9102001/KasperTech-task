import 'package:flutter/material.dart';
import 'package:kaspertechtask/models/order_delivery_data.dart';
import 'package:provider/provider.dart';

class OrderDeliveryDataProvider extends ChangeNotifier {
  List<OrderDeliveryData> ordersList = [
    OrderDeliveryData(
      address: "Plot 381",
      endLatitude: 73.05645,
      fromAddress: "plot no. 456",
      fromName: "krishna",
      orderId: "001",
      mobileNumber: "9558",
      name: "Dhairya",
      startLatitude: 72.002323,
      startLongitude: 25.014540,
      status: "Picked",
    ),
    OrderDeliveryData(
      address: "Plot 356",
      endLatitude: 73.05645,
      fromAddress: "plot no. 456",
      fromName: "krishna",
      orderId: "002",
      mobileNumber: "9558",
      name: "Ekta",
      startLatitude: 72.002323,
      startLongitude: 25.014540,
      status: "Picked",
    ),
  ];

  OrderDeliveryData getCurrentDelivery() {
    return ordersList[0];
  }
}

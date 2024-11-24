import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';


class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final DateTime? deliveryDate;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.deliveryDate,
  });

  String get formattedOrderDate => THelperFunction.getFormatedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? THelperFunction.getFormatedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shiped
          ? 'Shipment on the way'
          : 'Processing';

  // Convert the object to a JSON representation
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'deliveryDate': deliveryDate,
    };
  }

  // Create an object from a database snapshot or JSON map
  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      id: data['id'] as String,
      userId: data['userId'] as String? ?? '',
      status:
          OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      totalAmount: data['totalAmount'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String? ?? 'Paypal',
      deliveryDate: data['deliveryDate'] != null
          ? (data['deliveryDate'] as Timestamp).toDate()
          : null,
    );
  }
}

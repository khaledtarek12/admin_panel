import 'dart:developer';

import 'package:get/get.dart';
import 'package:t_store_web_adimn/features/shop/models/order_model.module.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;

  // -- Order
  static final List<OrderModel> orders = [
    OrderModel(
        id: 'CWT0012',
        status: OrderStatus.processing,
        totalAmount: 265,
        orderDate: DateTime(2024, 11, 20),
        deliveryDate: DateTime(2024, 11, 20)),
    OrderModel(
        id: 'CWT0025',
        status: OrderStatus.shiped,
        totalAmount: 369,
        orderDate: DateTime(2024, 11, 21),
        deliveryDate: DateTime(2024, 11, 21)),
    OrderModel(
        id: 'CWT00152',
        status: OrderStatus.delivered,
        totalAmount: 254,
        orderDate: DateTime(2024, 11, 22),
        deliveryDate: DateTime(2024, 11, 22)),
    OrderModel(
        id: 'CWT00265',
        status: OrderStatus.delivered,
        totalAmount: 355,
        orderDate: DateTime(2024, 11, 23),
        deliveryDate: DateTime(2024, 11, 23)),
    OrderModel(
        id: 'CWT1536',
        status: OrderStatus.delivered,
        totalAmount: 115,
        orderDate: DateTime(2024, 11, 24),
        deliveryDate: DateTime(2024, 11, 24)),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    super.onInit();
  }

  // calculate weekly sales
  void _calculateWeeklySales() {
    weeklySales.value = List<double>.filled(7, 0.0);
    for (var order in orders) {
      final DateTime orderWeekStart = THelperFunction.getStartOfWeek(
          order.orderDate); // Adjust this method reference
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;
        index = index < 0 ? index + 7 : index;
        weeklySales[index] += order.totalAmount;
        log('Weekly Sales: $weeklySales');
      }
    }
  }
}

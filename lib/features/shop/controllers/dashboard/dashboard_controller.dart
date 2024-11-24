import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;

  // -- Order
  // static final List<OrderModel> orders = [];

  @override
  void onInit() {
    _calculateWeeklySales();
    super.onInit();
  }

  // calculate weekly sales
  void _calculateWeeklySales() {}
}

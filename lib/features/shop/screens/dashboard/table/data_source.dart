import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class OrderRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final order = DashboardController.orders[index];
    return DataRow2(specificRowHeight: 50, cells: [
      DataCell(
        Text(
          order.id,
          style: Theme.of(Get.context!)
              .textTheme
              .bodyLarge!
              .apply(color: TColors.primary),
        ),
      ),
      DataCell(Text(order.formattedOrderDate)),
      const DataCell(Text('5 Items')),
      DataCell(
        TRoundedContainer(
          radius: TSizes.cardRadiusSm,
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.xs, horizontal: TSizes.md),
          backgroundCoIor: THelperFunction.getOrderStatusColor(order.status)
              .withOpacity(0.1),
          child: Text(
            order.status.name.capitalize.toString(),
            style: TextStyle(
              color: THelperFunction.getOrderStatusColor(order.status),
            ),
          ),
        ),
      ),
      DataCell(Text('\$${order.totalAmount}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => DashboardController.orders.length;

  @override
  int get selectedRowCount => 0;
}

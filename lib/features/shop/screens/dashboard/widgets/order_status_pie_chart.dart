import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/texts/seaction_heading.dart';
import 'package:t_store_web_adimn/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class OrderStatusPieChart extends StatelessWidget {
  const OrderStatusPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TSectionHeading(title: 'Order Status'),
          const SizedBox(height: TSizes.spaceBtwScetions),
          // -- Graph
          SizedBox(
            height: 400,
            child: PieChart(
              PieChartData(
                sectionsSpace: 8,
                sections: controller.orderStatusData.entries.map(
                  (entry) {
                    final status = entry.key;
                    final count = entry.value;
                    return PieChartSectionData(
                      showTitle: true,
                      title: count.toString(),
                      value: count.toDouble(),
                      radius: 100,
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      color: THelperFunction.getOrderStatusColor(status),
                    );
                  },
                ).toList(),
                pieTouchData: PieTouchData(
                  touchCallback: (event, response) {},
                  enabled: true,
                ),
              ),
            ),
          ),

          // -- show Status and Color Meta
          SizedBox(
            width: double.infinity,
            child: DataTable(
              dividerThickness: 2,
              columnSpacing: 20, // Add spacing between columns
              horizontalMargin: 16, // Add margin horizontally
              columns: const [
                DataColumn(
                  label: Text(
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Order',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: controller.orderStatusData.entries.map(
                (entry) {
                  final OrderStatus status = entry.key;
                  final int count = entry.value;
                  final totalAmount = controller.totalAmounts[status] ?? 0;
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            TCircularContainer(
                              width: 20,
                              height: 20,
                              backgroundCoIor:
                                  THelperFunction.getOrderStatusColor(status),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(' ${status.name} '),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(count.toString()),
                      ),
                      DataCell(
                        Text('\$${totalAmount.toStringAsFixed(2)}'),
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}

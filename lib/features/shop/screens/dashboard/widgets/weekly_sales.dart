
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/texts/seaction_heading.dart';
import 'package:t_store_web_adimn/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/device/device_utility.dart';

class TWeeklySalesGraph extends StatelessWidget {
  const TWeeklySalesGraph({
    super.key
  });


  @override
  Widget build(BuildContext context) {
        final controller = Get.put(DashboardController());

    return TRoundedContainer(
      child: Column(
        children: [
          const TSectionHeading(title: 'Weekly Sales'),
          const SizedBox(height: TSizes.spaceBtwScetions),
    
          // Graph
          SizedBox(
            height: 400,
            child: BarChart(
              BarChartData(
                titlesData: buildFLTitlesData(),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                  ),
                ),
                gridData: const FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  horizontalInterval: 200,
                  drawVerticalLine: false,
                ),
                barGroups: controller.weeklySales
                    .asMap()
                    .entries
                    .map((entry) => BarChartGroupData(
                          x: entry.key,
                          barRods: [
                            BarChartRodData(
                              width: 30,
                              toY: entry.value,
                              color: TColors.primary,
                              borderRadius:
                                  BorderRadius.circular(
                                      TSizes.sm),
                            )
                          ],
                        ))
                    .toList(),
                groupsSpace: TSizes.spaceBtwScetions,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) =>
                        TColors.secondey,
                  ),
                  touchCallback:
                      TDeviceUtility.isDesktopScreen(
                              context)
                          ? (event, response) {}
                          : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  FlTitlesData buildFLTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            // Map index to the desired day of the week
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

            // Calculate the index and ensure it wraps around for the correct day
            final index = value.toInt() % days.length;

            // Get the day corresponding to the calculated index
            final day = days[index];
            return SideTitleWidget(
                axisSide: AxisSide.bottom, space: 0, child: Text(day));
          },
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles:
            SideTitles(showTitles: true, interval: 200, reservedSize: 50),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/widgets/order_status_pie_chart.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/widgets/weekly_sales.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Heading
              Text('Dashboard',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: TSizes.spaceBtwScetions),
              // -- Cards
              const Row(
                children: [
                  Expanded(
                    child: TDashboardCard(
                      title: 'Sales Total',
                      subTitle: '\$365.6',
                      stats: 25,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashboardCard(
                      title: 'Average Order Value',
                      subTitle: '\$25.6',
                      stats: 15,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashboardCard(
                      title: 'Sales Orders',
                      subTitle: '36',
                      stats: 44,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashboardCard(
                      title: 'Visitors',
                      subTitle: '20,035',
                      stats: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwScetions),
              // -- Graphs
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // -- Bar Chart
                        TWeeklySalesGraph(),
                        SizedBox(height: TSizes.spaceBtwScetions),
                        // -- Orders
                        TRoundedContainer()
                      ],
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwScetions),
                  // -- Pie Chart
                  Expanded(child: OrderStatusPieChart()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/widgets/order_status_pie_chart.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/widgets/weekly_sales.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defultSpace),
          child: Column(
            children: [
              // -- Heading
              Text('Dashboard',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: TSizes.spaceBtwScetions),
              const TDashboardCard(
                title: 'Sales Total',
                subTitle: '\$365.6',
                stats: 25,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TDashboardCard(
                title: 'Average Order Value',
                subTitle: '\$25.6',
                stats: 15,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TDashboardCard(
                title: 'Sales Orders',
                subTitle: '36',
                stats: 44,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TDashboardCard(
                title: 'Visitors',
                subTitle: '20,035',
                stats: 2,
              ),
              const SizedBox(height: TSizes.spaceBtwScetions),
              const TWeeklySalesGraph(),
              const SizedBox(height: TSizes.spaceBtwScetions),
              // -- Orders
              const TRoundedContainer(),
              const SizedBox(height: TSizes.spaceBtwScetions),
              // -- Pie Chart
              const OrderStatusPieChart(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/texts/seaction_heading.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/table/data_table.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/widgets/order_status_pie_chart.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/widgets/weekly_sales.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class DashbordTabletScreen extends StatelessWidget {
  const DashbordTabletScreen({super.key});

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
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Row(
                children: [
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
              const TWeeklySalesGraph(),
              const SizedBox(height: TSizes.spaceBtwScetions),
              // -- Orders
              const TRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(title: 'Recent Orders'),
                    SizedBox(height: TSizes.spaceBtwScetions),
                    DashboardDataTable(),
                  ],
                ),
              ),
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

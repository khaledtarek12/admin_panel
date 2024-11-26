import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/data_table/paginated_data_table.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/table/data_source.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class DashboardDataTable extends StatelessWidget {
  const DashboardDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: TSizes.lg * 1.2,
      columns: const [
        DataColumn2(label: Text('Order ID')),
        DataColumn2(label: Text('Date')),
        DataColumn2(label: Text('Items')),
        DataColumn2(label: Text('Status')),
        DataColumn2(label: Text('Amount')),
      ],
      source: OrderRows(),
    );
  }
}

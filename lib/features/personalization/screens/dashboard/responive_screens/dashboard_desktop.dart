import 'package:flutter/material.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Colum 1')),
            DataColumn(label: Text('Colum 2')),
          ],
          rows: const [
            DataRow(
              cells: [
                DataCell(Text('Cell 1')),
                DataCell(Text('Cell 2')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Cell 3')),
                DataCell(Text('Cell 4')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

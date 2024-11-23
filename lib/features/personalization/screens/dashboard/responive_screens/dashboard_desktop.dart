import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/common/widgets/data_table/paginated_data_table.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: controller.searchTextController,
                  onChanged: (query) => controller.searchQueary(query),
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Iconsax.search_normal),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwScetions),
                Obx(
                  () {
                    // Orders & Selected Rows are Hidden Just to update the UI Obx [ProductRows]
                    Visibility(
                        visible: false,
                        child:
                            Text(controller.filterdDataList.length.toString()));

                    return TPaginatedDataTable(
                      tableHeight: MediaQuery.of(context).size.height * .76,
                      sorColumnIndex: controller.sortColumnIndex.value,
                      sortAscending: controller.sortAscending.value,
                      rowsPerPage: 10,
                      columns: [
                        const DataColumn2(label: Text('Colum 1')),
                        DataColumn2(
                          label: const Text('Colum 2'),
                          onSort: (columnIndex, ascending) =>
                              controller.sortById(columnIndex, ascending),
                        ),
                        const DataColumn2(label: Text('Colum 3')),
                        DataColumn2(
                          label: const Text('Colum 4'),
                          onSort: (columnIndex, ascending) =>
                              controller.sortById(columnIndex, ascending),
                        ),
                      ],
                      source: MyData(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final controller = Get.put(DashboardController());
  @override
  DataRow? getRow(int index) {
    final data = controller.filterdDataList[index];
    return DataRow2(
      onTap: () {},
      selected: controller.selectedRows[index],
      onSelectChanged: (value) {
        controller.selectedRows[index] = value ?? false;
      },
      cells: [
        DataCell(Text(data['Column1'] ?? '')),
        DataCell(Text(data['Column2'] ?? '')),
        DataCell(Text(data['Column3'] ?? '')),
        DataCell(Text(data['Column4'] ?? '')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filterdDataList.length;

  @override
  int get selectedRowCount => 0;
}

class DashboardController extends GetxController {
  var filterdDataList = <Map<String, String>>[].obs;
  var dataList = <Map<String, String>>[].obs;
  // Observable list to store selected rows
  RxList<bool> selectedRows = <bool>[].obs;

  // Observable for tracking the index of the column for sorting
  RxInt sortColumnIndex = 1.obs;
  // Observable for tracking the sorting order (ascending or descending)
  RxBool sortAscending = true.obs;
  // Controller for handling search text input
  final searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchDummyData();
  }

  void sortById(int sortColumnIndex, bool ascending) {
    sortAscending.value = ascending;
    filterdDataList.sort((a, b) {
      if (ascending) {
        return filterdDataList[0]['Column1'].toString().toLowerCase().compareTo(
              filterdDataList[0]['Column1'].toString().toLowerCase(),
            );
      } else {
        return filterdDataList[0]['Column1'].toString().toLowerCase().compareTo(
              filterdDataList[0]['Column1'].toString().toLowerCase(),
            );
      }
    });
    this.sortColumnIndex.value = sortColumnIndex;
  }

  searchQueary(String query) {
    filterdDataList.assignAll(
      dataList.where(
        (item) => item['Column1']!.contains(query.toLowerCase()),
      ),
    );
  }

  void fetchDummyData() {
    selectedRows.assignAll(List.generate(36, (index) => false));
    filterdDataList.addAll(
      List.generate(
        36,
        (index) => {
          'Column1': 'Data ${index + 1} - 1',
          'Column2': 'Data ${index + 1} - 2',
          'Column3': 'Data ${index + 1} - 3',
          'Column4': 'Data ${index + 1} - 4',
        },
      ),
    );
    dataList.addAll(
      List.generate(
        36,
        (index) => {
          'Column1': 'Data ${index + 1} - 1',
          'Column2': 'Data ${index + 1} - 2',
          'Column3': 'Data ${index + 1} - 3',
          'Column4': 'Data ${index + 1} - 4',
        },
      ),
    );
  }
}

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/common/widgets/loading/animation_loader.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/image_strings.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class TPaginatedDataTable extends StatelessWidget {
  const TPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.tableHeight = 760,
    this.onPageChanged,
    this.sorColumnIndex,
    this.dataRowHeight = TSizes.xl * 2,
    this.sortAscending = true,
    this.minWidth = 1000,
  });

  /// Whether to sort the Datatable in ascending or descending order.
  final bool sortAscending;

  // Inoex Of tne column to sort Dy.
  final int? sorColumnIndex;

  /// Numner of rons to disp:ay per page.
  final int rowsPerPage;

  /// Data source for the DataTable.
  final DataTableSource source;

  /// List of columns for the Data Tab t e.
  final List<DataColumn2> columns;

  /// Cattback function to handle page changes.
  final Function(int)? onPageChanged;

  /// Height of each data row in the Data Tab t e.
  final double dataRowHeight;

  /// Height of the entire Data Table.
  final double tableHeight;

  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: CardTheme(
            color: THelperFunction.isDarkMode(context)
                ? TColors.dark
                : Colors.white,
            elevation: 0,
          ),
        ),
        child: PaginatedDataTable2(
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          rowsPerPage: rowsPerPage,
          dataRowHeight: dataRowHeight,
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateProperty.resolveWith(
            (states) => THelperFunction.isDarkMode(context)
                ? TColors.darkGrey
                : TColors.primaryBackground,
          ),
          headingRowDecoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TSizes.borderRadiusMd),
              topRight: Radius.circular(TSizes.borderRadiusMd),
            ),
          ),
          empty: const TAnimationLoaderWidgets(
            text: 'Nothing Found',
            animation: TImages.pencilWaking,
            height: 200,
            width: 200,
          ),

          // -- check box
          showCheckboxColumn: true,

          // -- pagination
          showFirstLastButtons: true,
          onPageChanged: onPageChanged,
          renderEmptyRowsInTheEnd: false,
          availableRowsPerPage: const [12, 24],
          onRowsPerPageChanged: (noOfRows) {},

          // -- sorting
          sortAscending: sortAscending,
          sortArrowAlwaysVisible: true,
          sortArrowIcon: Iconsax.arrow_down,
          sortColumnIndex: sorColumnIndex,
          sortArrowBuilder: (ascending, sorted) {
            if (sorted) {
              return Icon(
                ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,
                size: TSizes.iconsSm,
              );
            } else {
              return const Icon(Iconsax.arrow_3, size: TSizes.iconsSm);
            }
          },

          columns: columns,
          source: source,
        ),
      ),
    );
  }
}

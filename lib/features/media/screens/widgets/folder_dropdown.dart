import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/features/media/controller/media_controller.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class MediaFolderDropdown extends StatelessWidget {
  const MediaFolderDropdown({super.key, this.onChange});

  final void Function(MediaCategory?)? onChange;

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;

    return Obx(
      () {
        return SizedBox(
          width: 180, // Ensure enough width for the dropdown
          child: DropdownButtonFormField2<MediaCategory>(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(TSizes.md),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            isExpanded: true, // Allow full width usage
            value: controller.selectedPath.value,
            items: MediaCategory.values
                .map(
                  (element) => DropdownMenuItem<MediaCategory>(
                    value: element,
                    child: Text(
                      element.name.capitalize.toString(),
                      overflow: TextOverflow.ellipsis, // Prevent overflow
                      softWrap: false,
                    ),
                  ),
                )
                .toList(),
            onChanged: onChange,
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Rounded edges
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              offset: const Offset(0, -8), // Adds floating effect
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:helloapi/screens/create_record/create_record.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

floatingButtonForCreateRecord(BuildContext context, refreshData) {
  return FloatingActionButton(
    child: const Icon(
      Icons.add_rounded,
    ),
    onPressed: () async {
      await Future.delayed(const Duration(seconds: 0), () async {
        await showMaterialModalBottomSheet(
          context: context,
          expand: true,
          builder: (ctx) {
            return CreateOrUpdateRecord(sheetContext: ctx);
          },
        );
      });
      refreshData();
    },
  );
}

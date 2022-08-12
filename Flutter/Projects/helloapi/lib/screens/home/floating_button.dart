import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';
import 'package:helloapi/screens/create_record/create_record.dart';
import 'package:helloapi/services/services.dart';
import 'package:http/http.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

floatingButtonForCreateRecord(BuildContext context, setState) {
  return FloatingActionButton(
    child: const Icon(
      Icons.add_rounded,
    ),
    onPressed: () async {
      await Future.delayed(const Duration(seconds: 0), () async {
        showMaterialModalBottomSheet(
          context: context,
          expand: true,
          builder: (ctx) {
            Data data = Data();
            return CreateOrUpdateRecord(
              sheetContext: ctx,
              data: data,
              finalFunction: () {
                setState(() {
                  postData(data);
                });
              },
            );
          },
        );
      });
    },
  );
}

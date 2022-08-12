import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';
import 'package:helloapi/screens/create_record/create_record.dart';
import 'package:helloapi/services/services.dart';
import 'package:helloapi/widgets/close_dialog.dart';
import 'package:helloapi/widgets/loading_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

PopupMenuButton<dynamic> updateOrDelete(
    BuildContext context, List<Data> data, int index, refreshData) {
  return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: Colors.black),
      itemBuilder: (ctx) => [
            updateItem(context, data, index, refreshData),
            deleteItem(context, data, index, refreshData)
          ]);
}

PopupMenuItem<dynamic> deleteItem(
    BuildContext context, List<Data> data, int index, refreshData) {
  return PopupMenuItem(
    child: Row(
      children: const [
        Icon(Icons.delete, color: Colors.black),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text("Delete"),
        ),
      ],
    ),
    onTap: () {
      circleProgressDialog(context);
      deleteData(data[index].id!);
      closeDialog(context);
      refreshData();
    },
  );
}

PopupMenuItem<dynamic> updateItem(
    BuildContext context, List<Data> data, int index, refreshData) {
  return PopupMenuItem(
      child: Row(
        children: const [
          Icon(Icons.edit, color: Colors.black),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Update"),
          ),
        ],
      ),
      onTap: () async {
        await Future.delayed(const Duration(seconds: 0), () async {
          await showMaterialModalBottomSheet(
              context: context,
              expand: true,
              builder: (ctx) => CreateOrUpdateRecord(
                  updateData: true, sheetContext: ctx, data: data[index]));
        });
        refreshData();
      });
}

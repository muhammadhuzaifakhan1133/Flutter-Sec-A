import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

PopupMenuButton<dynamic> menuForGroupBy(setState, widget, color) {
  return PopupMenuButton(
      icon: Icon(
        Icons.more_vert,
        color: color,
      ),
      itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                children: const [
                  Icon(Icons.sort, color: Colors.black),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Group by"))
                ],
              ),
              onTap: () {
                Icon inUseIcon =
                    const Icon(Icons.check, color: Colors.green, size: 30);
                Future.delayed(const Duration(seconds: 0), () {
                  showMaterialModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0))),
                    builder: (ctx) {
                      return Container(
                        height: 161,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: 8.0, left: 20, top: 20),
                              child: Text("Group by",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                            ListTile(
                              leading: Icon(Icons.list),
                              title: Text("List"),
                              trailing:
                                  widget.groupBy == "list" ? inUseIcon : null,
                              onTap: () {
                                setState(() {
                                  widget.groupBy = "list";
                                });
                                Navigator.pop(ctx);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.list),
                              title: Text("Due Date"),
                              trailing:
                                  widget.groupBy == "date" ? inUseIcon : null,
                              onTap: () {
                                setState(() {
                                  widget.groupBy = "date";
                                });
                                Navigator.pop(ctx);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                });
              },
            )
          ]);
}

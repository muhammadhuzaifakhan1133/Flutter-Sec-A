import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

PopupMenuItem<dynamic> sortMenuItem(BuildContext context, widget, setState,
    {importantSort = true, completeSort = true}) {
  return PopupMenuItem(
    child: Row(
      children: const [
        Icon(Icons.sort, color: Colors.black),
        Padding(padding: EdgeInsets.only(left: 10), child: Text("Sort by"))
      ],
    ),
    onTap: () {
      Icon inUseIcon = const Icon(Icons.check, color: Colors.green, size: 30);
      Future.delayed(const Duration(seconds: 0), () {
        showMaterialModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          builder: (ctx) => Container(
            height: (!(completeSort && importantSort)) ? 230 : 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, left: 20, top: 20),
                  child: Text("Sort by",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                if (importantSort)
                  ListTile(
                    leading: const Icon(Icons.star_border),
                    title: const Text("Importance"),
                    trailing: widget.sortBy == "important" ? inUseIcon : null,
                    onTap: () {
                      Navigator.pop(ctx);
                      setState(() {
                        widget.sortBy = "important";
                        widget.sortKey = "importance";
                      });
                    },
                  ),
                if (completeSort)
                  ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: const Text("Completion"),
                    trailing: widget.sortBy == "complete" ? inUseIcon : null,
                    onTap: () {
                      Navigator.pop(ctx);
                      setState(() {
                        widget.sortBy = "complete";
                        widget.sortKey = "completion";
                      });
                    },
                  ),
                ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: const Text("Due Date"),
                  trailing: widget.sortBy == "date" ? inUseIcon : null,
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() {
                      widget.sortBy = "date";
                      widget.sortKey = "due date";
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.swap_vert),
                  title: const Text("Alphabetically"),
                  trailing: widget.sortBy == "name" ? inUseIcon : null,
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() {
                      widget.sortBy = "name";
                      widget.sortKey = "alphabetically";
                    });
                  },
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

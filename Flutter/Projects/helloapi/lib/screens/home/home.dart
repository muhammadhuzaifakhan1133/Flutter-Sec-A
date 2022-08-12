import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';
import 'package:helloapi/screens/create_record/create_record.dart';
import 'package:helloapi/screens/home/floating_button.dart';
import 'package:helloapi/screens/home/update_or_delete.dart';
import 'package:helloapi/screens/users_info/render_slides.dart';
import 'package:helloapi/screens/users_info/user_info.dart';
import 'package:helloapi/services/services.dart';
import 'package:helloapi/widgets/close_dialog.dart';
import 'package:helloapi/widgets/loading_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<UserModel> _future;

  @override
  void initState() {
    super.initState();
    _future = getUsers();
  }

  refreshData() {
    setState(() {
      _future = getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            floatingButtonForCreateRecord(context, refreshData),
        body: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
              if (snapshot.data != null) {
                List<Data> data = snapshot.data!.data!;
                List<Widget> slides =
                    renderSlides(users: data, context: context);
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${data[index].name}"),
                      subtitle: Text("${data[index].email}"),
                      trailing:
                          updateOrDelete(context, data, index, refreshData),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserInfo(
                                      slides: slides,
                                      index: index,
                                    )));
                      },
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}

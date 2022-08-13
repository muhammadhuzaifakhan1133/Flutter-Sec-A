import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';
import 'package:helloapi/screens/create_record/create_record.dart';
import 'package:helloapi/screens/users_info/render_slides.dart';
import 'package:helloapi/screens/users_info/user_info.dart';
import 'package:helloapi/services/services.dart';
import 'package:helloapi/widgets/close_dialog.dart';
import 'package:helloapi/widgets/loading_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: const Text("API INTEGRATION - CRUD"),
        ),
        floatingActionButton: FloatingActionButton(
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
                    finalFunction: () async {
                      await postData(data);
                      setState(() {});
                    },
                  );
                },
              );
            });
          },
        ),
        body: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
              if (snapshot.hasError) {
                Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<Data> data = snapshot.data!.data!;
              List<Widget> slides = renderSlides(users: data, context: context);
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: ListTile(
                      title: Text("${data[index].name}",
                          overflow: TextOverflow.ellipsis),
                      subtitle: Text("${data[index].email}",
                          overflow: TextOverflow.ellipsis),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () async {
                                await Future.delayed(const Duration(seconds: 0),
                                    () async {
                                  showMaterialModalBottomSheet(
                                      context: context,
                                      expand: true,
                                      builder: (ctx) => CreateOrUpdateRecord(
                                            updateData: true,
                                            sheetContext: ctx,
                                            data: data[index],
                                            finalFunction: () async {
                                              await updateData(
                                                  data: data[index],
                                                  id: data[index].id!);
                                              setState(() {});
                                            },
                                          ));
                                });
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () async {
                                circleProgressDialog(context);
                                await deleteData(id: data[index].id!);
                                closeDialog(context);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserInfo(
                                      slides: slides,
                                      index: index,
                                    )));
                      },
                    ),
                  );
                },
              );

              return const Center(child: CircularProgressIndicator());
            }));
  }
}

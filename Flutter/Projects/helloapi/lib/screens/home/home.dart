import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';
import 'package:helloapi/screens/users_info/render_slides.dart';
import 'package:helloapi/screens/users_info/user_info.dart';
import 'package:helloapi/services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add_rounded,
          ),
          onPressed: () {
            Future.delayed(const Duration(seconds: 0), () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return Column();
                },
              );
            });
          },
        ),
        body: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
              if (snapshot.data != null) {
                List<Widget> slides = renderSlides(
                    users: (snapshot.data!.data)!, context: context);
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${snapshot.data!.data![index].name}"),
                      subtitle: Text("${snapshot.data!.data![index].email}"),
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

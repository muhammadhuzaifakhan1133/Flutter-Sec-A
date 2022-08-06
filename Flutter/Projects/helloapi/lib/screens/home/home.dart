import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';
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
        body: FutureBuilder(
            future: getUsers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${snapshot.data![index].name}"),
                      subtitle: Text("${snapshot.data![index].email}"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserInfo(
                                      users: snapshot.data!,
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

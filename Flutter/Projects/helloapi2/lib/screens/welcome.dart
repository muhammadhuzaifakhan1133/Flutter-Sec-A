import 'package:flutter/material.dart';
import 'package:helloapi2/model/user_model.dart';
import 'package:helloapi2/screens/home.dart';
import 'package:helloapi2/services/model_services.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text("Get Data")),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () async {
                  await postData(
                      // user: Data(
                      //     name: "1234567",
                      //     username: "1234567",
                      //     phone: "sdfjlsdjfho32498hfs",
                      //     email: "hell1234567o12email"),
                      );
                },
                child: Text("Post Data")),
            ElevatedButton(
                onPressed: () async {
                  await updateData(
                      user: Data(
                          name: "huzaifa",
                          username: "hello1233",
                          email: "hello12email"),
                      id: 70);
                },
                child: Text("Update Data")),
            ElevatedButton(
                onPressed: () async {
                  await deleteData(id: 85);
                },
                child: Text("Delete Data")),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/services/user_service.dart';

class HomeApi extends StatefulWidget {
  const HomeApi({Key? key}) : super(key: key);

  @override
  State<HomeApi> createState() => _HomeApiState();
}

class _HomeApiState extends State<HomeApi> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Integration")),
      body: Column(
        children: [
          SizedBox(height: 15),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
                labelText: "Enter name to search",
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {});
                    }),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          Expanded(
            child: FutureBuilder(
                future: getUser(queryName: searchController.text),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].name),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      scrollable: true,
                                      content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Id : ${snapshot.data[index].id}"),
                                          Text(
                                              "Name : ${snapshot.data[index].name}"),
                                          Text(
                                              "Username : ${snapshot.data[index].username}"),
                                          Text(
                                              "Email : ${snapshot.data[index].email}"),
                                          Text(
                                              "Phone : ${snapshot.data[index].phone}"),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel"))
                                      ],
                                    ));
                          },
                        );
                      });
                }
                // },
                ),
          ),
        ],
      ),
    );
  }
}

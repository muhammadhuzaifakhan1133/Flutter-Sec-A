import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:ecommerce/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> keywords = [];
  List<String> suggestions = [];

  @override
  void initState() {
    super.initState();
    List<String> Keywords = [];
    (() async {
      Keywords = await getProductKeywords();
      setState(() {
        keywords = Keywords;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (keywords.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: textFieldWidget(
              height: size.height * 0.06,
              width: size.width * 0.8,
              radius: 0,
              autofocus: true,
              hintText: "Search Keyword",
              suffixIcon: searchController.text.isNotEmpty ? Icons.close : null,
              onPressedSuffixIcon: () {
                searchController.clear();
                setState(() {
                  suggestions = [];
                });
              },
              controller: searchController,
              onChanged: (String value) {
                if (searchController.text.isNotEmpty) {
                  setState(() {
                    suggestions = keywords
                        .where((element) => element.contains(value))
                        .toList();
                  });
                } else {
                  setState(() {
                    suggestions = [];
                  });
                }
              },
              keyboardtype: TextInputType.text,
              textInputAction: TextInputAction.search),
        ),
        body: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
                onTap: () async {
                  searchController.text = suggestions[index];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BottomBarController(query: suggestions[index])));
                },
                title: Text(suggestions[index]));
          },
        ),
      );
    } else {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}

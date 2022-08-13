import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl(BuildContext context, String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Could not launch $url')));
  }
}

List<Widget> renderSlides(
    {required List<Data> users, required BuildContext context}) {
  List<Widget> slides = [];
  double spaceBetween = 10;
  Size size = MediaQuery.of(context).size;
  TextStyle keyStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  TextStyle valueStyle = const TextStyle(fontSize: 18);
  TextStyle linkValueStyle = const TextStyle(
      fontSize: 18, color: Colors.blue, decoration: TextDecoration.underline);
  for (var i = 0; i < users.length; i++) {
    slides.add(
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          child: Icon(Icons.person),
                        ),
                        Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 15),
                              width: size.width * 0.6,
                              child: Text(users[i].name!.toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 15),
                              width: size.width * 0.6,
                              child: Text("${users[i].email}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(thickness: 2),
                    SizedBox(height: 30),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("Username : ", style: keyStyle),
                            Text("${users[i].username}", style: valueStyle),
                          ],
                        ),
                        SizedBox(height: spaceBetween),
                        Row(
                          children: [
                            Text("Address     : ", style: keyStyle),
                            Flexible(
                              child: Text(
                                  "${users[i].address?.suite} ${users[i].address?.street} ${users[i].address?.city} ${users[i].address?.zipcode}",
                                  style: valueStyle),
                            ),
                          ],
                        ),
                        SizedBox(height: spaceBetween),
                        Row(
                          children: [
                            Text("Location     : ", style: keyStyle),
                            InkWell(
                              child: Text("view on map", style: linkValueStyle),
                              onTap: () => _launchUrl(context,
                                  'https://www.google.com/maps/search/?api=1&query=${users[i].address?.geo?.lat},${users[i].address?.geo?.lng}'),
                            ),
                          ],
                        ),
                        SizedBox(height: spaceBetween),
                        Row(
                          children: [
                            Text("Phone         : ", style: keyStyle),
                            InkWell(
                              child: Text("${users[i].phone}",
                                  style: linkValueStyle),
                              onTap: () => _launchUrl(
                                  context, "tel://${users[i].phone}"),
                            ),
                          ],
                        ),
                        SizedBox(height: spaceBetween),
                        Row(
                          children: [
                            Text("Website      : ", style: keyStyle),
                            InkWell(
                              child: Text("${users[i].website}",
                                  style: linkValueStyle),
                              onTap: () => _launchUrl(
                                  context, "https://www.${users[i].website}"),
                            ),
                          ],
                        ),
                        SizedBox(height: spaceBetween),
                        Row(
                          children: [
                            Text("Company    : ", style: keyStyle),
                            Flexible(
                              child: Text(
                                  "${users[i].company?.name} | ${users[i].company?.catchPhrase} | ${users[i].company?.bs}",
                                  style: valueStyle),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  return slides;
}

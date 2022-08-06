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
    {required List<User> users, required BuildContext context}) {
  List<Widget> slides = [];
  double spaceBetween = 10;
  TextStyle keyStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  TextStyle valueStyle = const TextStyle(fontSize: 18);
  TextStyle linkValueStyle = const TextStyle(
      fontSize: 18, color: Colors.blue, decoration: TextDecoration.underline);
  for (var i = 0; i < users.length; i++) {
    slides.add(Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Id                : ", style: keyStyle),
                  Text("${users[i].id}", style: valueStyle),
                ],
              ),
              SizedBox(height: spaceBetween),
              Row(
                children: [
                  Text("Name         : ", style: keyStyle),
                  Text("${users[i].name}", style: valueStyle),
                ],
              ),
              SizedBox(height: spaceBetween),
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
                    child: Text("${users[i].phone}", style: linkValueStyle),
                    onTap: () => _launchUrl(context, "tel://${users[i].phone}"),
                  ),
                ],
              ),
              SizedBox(height: spaceBetween),
              Row(
                children: [
                  Text("Website      : ", style: keyStyle),
                  InkWell(
                    child: Text("${users[i].website}", style: linkValueStyle),
                    onTap: () =>
                        _launchUrl(context, "https://www.${users[i].website}"),
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
        ),
      ),
    ));
  }
  return slides;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloapi/screens/create_record/field_controllers.dart';
import 'package:helloapi/screens/create_record/field_errors.dart';
import 'package:helloapi/widgets/text_field.dart';

class CreateRecord extends StatelessWidget {
  CreateRecord({Key? key}) : super(key: key);
  CreateRecordFieldControllers controllers = CreateRecordFieldControllers();
  CreateRecordFieldErrors errors = CreateRecordFieldErrors();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "NEW RECORD",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Container(
            width: size.width * 0.9,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Personal Info',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  textFieldWidget(
                      size: size,
                      controller: controllers.name,
                      errorText: errors.name,
                      hintText: "Enter name",
                      keyboardtype: TextInputType.name),
                  textFieldWidget(
                      size: size,
                      controller: controllers.email,
                      errorText: errors.email,
                      hintText: "Enter email",
                      keyboardtype: TextInputType.emailAddress),
                  textFieldWidget(
                      size: size,
                      controller: controllers.username,
                      errorText: errors.username,
                      hintText: "Enter username"),
                  textFieldWidget(
                      size: size,
                      controller: controllers.phone,
                      errorText: errors.phone,
                      hintText: "Enter phone",
                      keyboardtype: TextInputType.number),
                  textFieldWidget(
                      size: size,
                      controller: controllers.website,
                      errorText: errors.website,
                      hintText: "Enter website",
                      keyboardtype: TextInputType.url),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: size.width * 0.9,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Address Info',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  textFieldWidget(
                      size: size,
                      controller: controllers.addressSuit,
                      errorText: errors.addressSuit,
                      hintText: "Enter suit"),
                  textFieldWidget(
                      size: size,
                      controller: controllers.addressStreet,
                      errorText: errors.addressStreet,
                      hintText: "Enter street",
                      keyboardtype: TextInputType.streetAddress),
                  textFieldWidget(
                      size: size,
                      controller: controllers.addressCity,
                      errorText: errors.addressCity,
                      hintText: "Enter city"),
                  textFieldWidget(
                      size: size,
                      controller: controllers.addressZipcode,
                      errorText: errors.addressZipcode,
                      hintText: "Enter zipcode",
                      keyboardtype: TextInputType.number),
                  textFieldWidget(
                      size: size,
                      controller: controllers.addressLang,
                      errorText: errors.addressLang,
                      hintText: "langitude",
                      keyboardtype: const TextInputType.numberWithOptions()),
                  textFieldWidget(
                      size: size,
                      controller: controllers.addressLati,
                      errorText: errors.addressLati,
                      hintText: "latitude",
                      keyboardtype: const TextInputType.numberWithOptions()),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: size.width * 0.9,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Company Info',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  textFieldWidget(
                      size: size,
                      controller: controllers.companyName,
                      errorText: errors.companyName,
                      hintText: "Enter name",
                      keyboardtype: TextInputType.name),
                  textFieldWidget(
                      size: size,
                      controller: controllers.companyPhrase,
                      errorText: errors.companyPhrase,
                      hintText: "Enter catch phrase",
                      keyboardtype: TextInputType.name),
                  textFieldWidget(
                      size: size,
                      controller: controllers.companyBs,
                      errorText: errors.companyBs,
                      hintText: "Enter bs",
                      keyboardtype: TextInputType.name),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey, elevation: 10),
            child: const Text("CREATE"),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

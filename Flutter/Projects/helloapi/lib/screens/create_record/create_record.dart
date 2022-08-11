import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helloapi/screens/create_record/field_controllers.dart';
import 'package:helloapi/widgets/text_field.dart';

class CreateRecord extends StatefulWidget {
  CreateRecord({this.updateData = true, Key? key}) : super(key: key);
  bool updateData;
  @override
  State<CreateRecord> createState() => _CreateRecordState();
}

class _CreateRecordState extends State<CreateRecord> {
  CreateRecordFields fields = CreateRecordFields();

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
                      controller: fields.name.controller,
                      errorText: fields.name.error,
                      hintText: "Enter name",
                      keyboardtype: TextInputType.name),
                  textFieldWidget(
                      size: size,
                      controller: fields.email.controller,
                      errorText: fields.email.error,
                      hintText: "Enter email",
                      keyboardtype: TextInputType.emailAddress),
                  textFieldWidget(
                      size: size,
                      controller: fields.username.controller,
                      errorText: fields.username.error,
                      hintText: "Enter username"),
                  textFieldWidget(
                      size: size,
                      controller: fields.phone.controller,
                      errorText: fields.phone.error,
                      hintText: "Enter phone",
                      keyboardtype: TextInputType.number),
                  textFieldWidget(
                      size: size,
                      controller: fields.website.controller,
                      errorText: fields.website.error,
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
                      controller: fields.addressSuit.controller,
                      errorText: fields.addressSuit.error,
                      hintText: "Enter suit"),
                  textFieldWidget(
                      size: size,
                      controller: fields.addressStreet.controller,
                      errorText: fields.addressStreet.error,
                      hintText: "Enter street",
                      keyboardtype: TextInputType.streetAddress),
                  textFieldWidget(
                      size: size,
                      controller: fields.addressCity.controller,
                      errorText: fields.addressCity.error,
                      hintText: "Enter city"),
                  textFieldWidget(
                      size: size,
                      controller: fields.addressZipcode.controller,
                      errorText: fields.addressZipcode.error,
                      hintText: "Enter zipcode",
                      keyboardtype: TextInputType.number),
                  textFieldWidget(
                      size: size,
                      controller: fields.addressLang.controller,
                      errorText: fields.addressLang.error,
                      hintText: "langitude",
                      keyboardtype: const TextInputType.numberWithOptions()),
                  textFieldWidget(
                      size: size,
                      controller: fields.addressLati.controller,
                      errorText: fields.addressLati.error,
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
                      controller: fields.companyName.controller,
                      errorText: fields.companyName.error,
                      hintText: "Enter name",
                      keyboardtype: TextInputType.name),
                  textFieldWidget(
                      size: size,
                      controller: fields.companyPhrase.controller,
                      errorText: fields.companyPhrase.error,
                      hintText: "Enter catch phrase",
                      keyboardtype: TextInputType.name),
                  textFieldWidget(
                      size: size,
                      controller: fields.companyBs.controller,
                      errorText: fields.companyBs.error,
                      hintText: "Enter bs",
                      keyboardtype: TextInputType.name),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              fields.clearErrors();
              if (fields.ifAnyMantadotryFieldTextisEmpty()) {
                setState(() {
                  fields.setEmptyErrorForMandatoryField();
                });
                Fluttertoast.showToast(msg: "Please fill all required fields");
              }
            },
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

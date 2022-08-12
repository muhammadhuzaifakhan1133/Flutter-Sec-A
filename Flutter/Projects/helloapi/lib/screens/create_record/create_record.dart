import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helloapi/model/user_model.dart';
import 'package:helloapi/screens/create_record/create_record_fields.dart';
import 'package:helloapi/services/services.dart';
import 'package:helloapi/widgets/close_dialog.dart';
import 'package:helloapi/widgets/loading_widget.dart';
import 'package:helloapi/widgets/text_field.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CreateOrUpdateRecord extends StatefulWidget {
  CreateOrUpdateRecord(
      {this.updateData = false,
      required this.data,
      required this.sheetContext,
      required this.finalFunction,
      Key? key})
      : super(key: key);
  bool updateData;
  Data data;
  BuildContext sheetContext;
  Function finalFunction;
  @override
  State<CreateOrUpdateRecord> createState() => _CreateOrUpdateRecordState();
}

class _CreateOrUpdateRecordState extends State<CreateOrUpdateRecord> {
  CreateRecordFields fields = CreateRecordFields();

  @override
  void initState() {
    super.initState();
    if (widget.updateData) {
      fields.getDatafromRecord(widget.data);
    }
  }

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
            onPressed: () async {
              fields.clearErrors();
              if (fields.ifAnyMantadotryFieldTextisEmpty()) {
                setState(() {
                  fields.setEmptyErrorForMandatoryField();
                });
                Fluttertoast.showToast(msg: "Please fill all required fields");
                return;
              }
              if (!(await InternetConnectionChecker().hasConnection)) {
                Fluttertoast.showToast(msg: "No Internet Connection");
                return;
              }
              fields.fieldValuesToDataModel(widget.data);
              circleProgressDialog(context);
              widget.finalFunction();
              closeDialog(context);
              Navigator.pop(widget.sheetContext);
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey, elevation: 10),
            child: Text(widget.updateData ? "SAVE" : "CREATE"),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

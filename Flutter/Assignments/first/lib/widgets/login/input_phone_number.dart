import 'package:first/constants/user_constants.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter/material.dart';

inputPhoneNumber({controller}) {
  var constants = UserConstants();
  return Container(
    margin: EdgeInsets.only(top: 25),
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: 350,
    height: 50,
    decoration: BoxDecoration(
      color: Color(0xffEDEFFF),
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.black.withOpacity(0.13)),
    ),
    child: InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      onInputValidated: (bool value) {
        print(value);
      },
      selectorConfig: SelectorConfig(
          showFlags: true,
          selectorType: PhoneInputSelectorType.DIALOG,
          leadingPadding: 25),
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: Colors.black, fontSize: 17),
      textFieldController: controller,
      textStyle: TextStyle(fontSize: 17),
      formatInput: true,
      maxLength: 11,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
      cursorColor: Colors.black,
      inputDecoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 15, left: 0),
        border: InputBorder.none,
        hintText: 'Phone Number',
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 17),
      ),
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
    ),
  );
}

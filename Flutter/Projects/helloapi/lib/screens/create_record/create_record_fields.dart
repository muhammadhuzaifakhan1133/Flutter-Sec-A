import 'package:helloapi/model/user_model.dart';
import 'package:helloapi/widgets/custom_controller.dart';

class CreateRecordFields {
  customField name = customField();
  customField email = customField();
  customField username = customField();
  customField phone = customField();
  customField website = customField();
  customField addressSuit = customField();
  customField addressStreet = customField();
  customField addressCity = customField();
  customField addressZipcode = customField();
  customField addressLang = customField();
  customField addressLati = customField();
  customField companyName = customField();
  customField companyPhrase = customField();
  customField companyBs = customField();

  getDatafromRecord(Data data) {
    name.controller.text = data.name!;
    email.controller.text = data.email!;
    username.controller.text = data.username!;
    phone.controller.text = data.phone ?? "";
    website.controller.text = data.website ?? "";
    addressSuit.controller.text = data.address?.suite ?? "";
    addressStreet.controller.text = data.address?.street ?? "";
    addressCity.controller.text = data.address?.city ?? "";
    addressZipcode.controller.text = data.address?.zipcode ?? "";
    addressLang.controller.text = data.address?.geo?.lng ?? "";
    addressLati.controller.text = data.address?.geo?.lat ?? "";
    companyName.controller.text = data.company?.name ?? "";
    companyPhrase.controller.text = data.company?.catchPhrase ?? "";
    companyBs.controller.text = data.company?.bs ?? "";
  }

  getValue(String text) {
    if (text.isEmpty) {
      return null;
    }
    return text;
  }

  Map<String, dynamic> tojson() {
    Data data = Data();
    data.name = name.controller.text;
    data.email = email.controller.text;
    data.username = username.controller.text;
    data.phone = getValue(phone.controller.text);
    data.website = getValue(website.controller.text);
    data.address?.suite = getValue(addressSuit.controller.text);
    data.address?.street = getValue(addressStreet.controller.text);
    data.address?.city = getValue(addressCity.controller.text);
    data.address?.zipcode = getValue(addressZipcode.controller.text);
    data.address?.geo?.lng = getValue(addressLang.controller.text);
    data.address?.geo?.lat = getValue(addressLati.controller.text);
    data.company?.name = getValue(companyName.controller.text);
    data.company?.catchPhrase = getValue(companyPhrase.controller.text);
    data.company?.bs = getValue(companyBs.controller.text);
    return data.toJson();
  }

  List<customField> getMandatoryFields() {
    return [name, email, username];
  }

  List<customField> getAllFields() {
    return [
      name,
      email,
      username,
      phone,
      website,
      addressSuit,
      addressStreet,
      addressCity,
      addressZipcode,
      addressLang,
      addressLati,
      companyName,
      companyPhrase,
      companyBs
    ];
  }

  bool ifAnyMantadotryFieldTextisEmpty() {
    for (customField field in getMandatoryFields()) {
      if (field.controller.text.isEmpty) {
        return true;
      }
    }
    return false;
  }

  void setEmptyErrorForMandatoryField() {
    for (customField field in getMandatoryFields()) {
      if (field.controller.text.isEmpty) {
        field.error = "This field is required";
      }
    }
  }

  void clearErrors() {
    for (customField field in getAllFields()) {
      field.error = null;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/login/feild_errors.dart';
import 'package:ecommerce/screens/login/login_screen.dart';
import 'package:ecommerce/screens/register/feild_errors.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<dynamic> addUser(
    {required BuildContext context,
    required setState,
    required String email,
    required String password,
    required RegisterFieldErrors errors}) async {
  try {
    // ignore: unused_local_variable
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      setState(() {
        errors.emailError = "The account already exists for that email.";
      });
      return false;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }
}

Future<bool> logIn(
    {required setState,
    required String email,
    required String password,
    required LoginFieldErrors errors}) async {
  try {
    // ignore: unused_local_variable
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      setState(() {
        errors.emailError = 'No user found for that email.';
      });
    } else if (e.code == 'wrong-password') {
      setState(() {
        errors.passwordError = 'Wrong password provided for that user.';
      });
    }
    return false;
  }
}

Future<void> saveUserName(
    {required String documentID, required String name}) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentReference usersDoc = users.doc(documentID);
  await usersDoc.set({
    'name': name,
  });
  // add wishlist collection
  CollectionReference collection =
      FirebaseFirestore.instance.collection("wishlist");
  DocumentReference document = collection.doc(documentID);
  await document.set({"productID": []});
  // add bag collection
  CollectionReference collection2 =
      FirebaseFirestore.instance.collection("bag");
  DocumentReference document2 = collection2.doc(documentID);
  await document2.set({
    "productID": [],
    "length": [],
    "breadth": [],
    "waist": [],
    "qty": [],
    "color": [],
    "material": []
  });
}

// add bag
Future<String> getUserName({required String email}) async {
  DocumentReference user =
      FirebaseFirestore.instance.collection("users").doc(email);
  DocumentSnapshot data = await user.get();
  Map<String, dynamic> values = data.data() as Map<String, dynamic>;
  return values["name"];
}

Future<bool> checkEmailVerified() async {
  User user = FirebaseAuth.instance.currentUser!;
  if (await InternetConnectionChecker().hasConnection) {
    await user.reload();
  }
  if (user.emailVerified) {
    return true;
  }
  return false;
}

Future<bool> sendVerificationEmail(context) async {
  final auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  try {
    await user?.sendEmailVerification();
    Fluttertoast.showToast(msg: "Verification link sent");
    return true;
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    return false;
  }
}

Future<bool> checkIfDocExist({required String documentID}) async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");
  DocumentSnapshot doc = await collectionReference.doc(documentID).get();
  return doc.exists;
}

deleteAccount(
    {required BuildContext context, required String documentID}) async {
  if (!(await InternetConnectionChecker().hasConnection)) {
    Fluttertoast.showToast(msg: "No Internet Connection");
    return;
  }
  await logout(context: context, deleteAccount: true);
  await deleteDocument(collectionID: "users", documentID: documentID);
}

Future<void> deleteDocument(
    {required String collectionID, required String documentID}) async {
  DocumentReference doc =
      FirebaseFirestore.instance.collection(collectionID).doc(documentID);
  await doc.delete();
}

logout({required BuildContext context, bool deleteAccount = false}) async {
  circleProgressDialog(context);
  if (!(await InternetConnectionChecker().hasConnection)) {
    closeDialog(context);
    Fluttertoast.showToast(msg: "No Internet Connection");
    return;
  }
  await GoogleSignIn().signOut();

  if (deleteAccount) {
    User? user = FirebaseAuth.instance.currentUser;
    user!.delete();
  } else {
    FirebaseAuth.instance.signOut();
  }
  await removeActiveUser();
  // ignore: use_build_context_synchronously
  closeDialog(context);
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
}

Future<List<String>> getEmailProviders(String emailAddress, context) async {
  try {
    // Fetch sign-in methods for the email address
    final list =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
    return list;
  } catch (error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.toString())));
  }
  return [];
}

addProduct(context) async {
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");
  bool isUserWishList = true;
  DocumentReference prodDoc = await products.add({
    "collection": "women",
    "designer": "OhCzdXt1ZaKFeRlDzEBI",
    "favoriteCount": 9123,
    "imgPaths": [
      "assets/images/image8_1.png",
    ],
    "info": {
      "description":
          "If you are looking for the latest and the most stylish Pakistan lawn collection 2018 with chiffon dupatta, you have come at the right place as Alkaram has brought fully embroidered lawn suits with chiffon and sleeves in its wide range of stitched and unstitched lawn suits.",
      "materials":
          "AS SEEN IN REDBOOK! You'll be primed and ready in the Perfect Situation Purple Long Sleeve Shift Dress when everything starts falling into place! This woven poly dress has a casual shift shape, accented by a rounded neckline.",
      "washInstructions":
          "AS SEEN IN REDBOOK! You'll be primed and ready in the Perfect Situation Purple Long Sleeve Shift Dress when everything starts falling into place! This woven poly dress has a casual shift shape, accented by a rounded neckline."
    },
    "keywords": ["tops"],
    "price": 22.00,
    "shareCount": 5551
  });
  if (isUserWishList) {
    DocumentReference wishlist = FirebaseFirestore.instance
        .collection("wishlist")
        .doc("huzaifaacademy11@gmail.com");
    DocumentSnapshot data = await wishlist.get();
    Map<String, dynamic> wishlistData = data.data() as Map<String, dynamic>;
    wishlistData["productID"].add(prodDoc.id);
    wishlist.update({"productID": wishlistData});
  }
}

addDesigner(context) async {
  CollectionReference products =
      FirebaseFirestore.instance.collection("designers");
  try {
    products.add({
      "name": "Kyle",
      "status": "Tailor",
      "imgPath": "assets/images/designer8.png"
    });
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<List<dynamic>> getWishList({required String email}) async {
  DocumentSnapshot wishlist =
      await FirebaseFirestore.instance.collection("wishlist").doc(email).get();
  Map<String, dynamic> wishlistData = wishlist.data() as Map<String, dynamic>;
  return wishlistData["productID"];
}

getDesignerData({required String documentID}) async {
  DocumentSnapshot data = await FirebaseFirestore.instance
      .collection("designers")
      .doc(documentID)
      .get();
  Map<String, dynamic> designerData = data.data() as Map<String, dynamic>;
  return designerData;
}

Future addToUserWishList(
    {required String email, required String productID}) async {
  DocumentReference wishlist =
      FirebaseFirestore.instance.collection("wishlist").doc(email);
  DocumentSnapshot wishListData = await wishlist.get();
  Map<String, dynamic> data = wishListData.data() as Map<String, dynamic>;
  List<dynamic> productIds = data["productID"];
  productIds.add(productID);
  await wishlist.update({"productID": productIds});
}

Future removeFromUserWishList(
    {required String email, required String productID}) async {
  DocumentReference wishlist =
      FirebaseFirestore.instance.collection("wishlist").doc(email);
  DocumentSnapshot wishListData = await wishlist.get();
  Map<String, dynamic> data = wishListData.data() as Map<String, dynamic>;
  List<dynamic> productIds = data["productID"];
  productIds.remove(productID);
  await wishlist.update({"productID": productIds});
}

Future<void> addProductToBag(
    {required String email,
    required String productID,
    required int breadth,
    required int waist,
    required int length,
    required String color,
    required String material,
    required int qty}) async {
  DocumentReference bag =
      FirebaseFirestore.instance.collection("bag").doc(email);
  DocumentSnapshot bagSnapshot = await bag.get();
  Map<String, dynamic> bagData = bagSnapshot.data() as Map<String, dynamic>;
  bagData["breadth"].add(breadth);
  bagData["waist"].add(waist);
  bagData["length"].add(length);
  bagData["color"].add(color);
  bagData["material"].add(material);
  bagData["qty"].add(qty);
  bagData["productID"].add(productID);
  await bag.update({
    "breadth": bagData["breadth"],
    "waist": bagData["waist"],
    "length": bagData["length"],
    "color": bagData["color"],
    "material": bagData["material"],
    "qty": bagData["qty"],
    "productID": bagData["productID"],
  });
}

Future<void> updateBagProduct(
    {required String email,
    required int index,
    required String productID,
    required int breadth,
    required int waist,
    required int length,
    required String color,
    required String material,
    required int qty}) async {
  DocumentReference bag =
      FirebaseFirestore.instance.collection("bag").doc(email);
  DocumentSnapshot bagSnapshot = await bag.get();
  Map<String, dynamic> bagData = bagSnapshot.data() as Map<String, dynamic>;
  bagData["breadth"][index] = breadth;
  bagData["waist"][index] = waist;
  bagData["length"][index] = length;
  bagData["color"][index] = color;
  bagData["material"][index] = material;
  bagData["qty"][index] = qty;
  bagData["productID"][index] = productID;
  await bag.update({
    "breadth": bagData["breadth"],
    "waist": bagData["waist"],
    "length": bagData["length"],
    "color": bagData["color"],
    "material": bagData["material"],
    "qty": bagData["qty"],
    "productID": bagData["productID"],
  });
}

Future<void> removeProductFromBag(
    {required BuildContext context,
    required String email,
    required int index}) async {
  DocumentReference bag =
      FirebaseFirestore.instance.collection("bag").doc(email);
  DocumentSnapshot bagSnapshot = await bag.get();
  Map<String, dynamic> bagData = bagSnapshot.data() as Map<String, dynamic>;
  bagData["breadth"].removeAt(index);
  bagData["waist"].removeAt(index);
  bagData["length"].removeAt(index);
  bagData["color"].removeAt(index);
  bagData["material"].removeAt(index);
  bagData["qty"].removeAt(index);
  bagData["productID"].removeAt(index);
  await bag.update({
    "breadth": bagData["breadth"],
    "waist": bagData["waist"],
    "length": bagData["length"],
    "color": bagData["color"],
    "material": bagData["material"],
    "qty": bagData["qty"],
    "productID": bagData["productID"],
  });
}

Future<double> getTotalPriceOfBagProducts({required String email}) async {
  DocumentSnapshot bagDocument =
      await FirebaseFirestore.instance.collection("bag").doc(email).get();
  Map<String, dynamic> bagProductsData =
      bagDocument.data() as Map<String, dynamic>;
  List<String> bagProductIDs = List<String>.from(bagProductsData["productID"]);
  List<int> qty = List<int>.from(bagProductsData["qty"]);
  double totalPrice = 0;
  for (var i = 0; i < bagProductIDs.length; i++) {
    DocumentSnapshot productDocument = await FirebaseFirestore.instance
        .collection("products")
        .doc(bagProductIDs[i])
        .get();
    double price = productDocument["price"];
    totalPrice += price * qty[i];
  }
  return totalPrice;
}

import 'package:blood_donation/model/usermodel.dart';
import 'package:blood_donation/views/bdhome.dart';
import 'package:blood_donation/views/bdlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController name_cntrl = TextEditingController();
  TextEditingController email_cntrl = TextEditingController();
  TextEditingController pass_cntrl = TextEditingController();
  TextEditingController loginemail_cntrl = TextEditingController();
  TextEditingController loginpass_cntrl = TextEditingController();

  var obscure = true.obs;
  var checBoxvalue = false.obs;
//registration with email and password
  signUp() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email_cntrl.text, password: pass_cntrl.text);
       await saveAuth();
      email_cntrl.clear();
      pass_cntrl.clear();
      name_cntrl.clear();
      Get.to(()=>BdLogin(),transition: Transition.size);
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

//saving username and email to firestore

  saveAuth() async {
    UserModel user = UserModel(
        id: auth.currentUser?.uid,
        usename: name_cntrl.text,
        email: auth.currentUser?.email);
    await db
        .collection("users")
        .doc(auth.currentUser?.uid)
        .collection("logindetails")
        .add(user.toMap());
  }

  ///signIn
  signIN() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: loginemail_cntrl.text, password: loginpass_cntrl.text);

      Get.offAll(()=>BdHome(),transition: Transition.upToDown,duration: Duration(milliseconds: 300));
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

//checkbox func
  checkboxChange() {
    checBoxvalue.value = !checBoxvalue.value;
  }

//obsecure txt func
  hideText() {
    obscure.value = !obscure.value;
  }
}

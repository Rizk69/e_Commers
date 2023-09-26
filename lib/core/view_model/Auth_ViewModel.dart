import 'package:ecommers/View/Home_Screen/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/User_Model.dart';
import '../services/FireStore_User.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  late String email, password, name;

  late Rx<User?> _users;

  String? get user => _users.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _users = Rx<User?>(null);
    _users.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user, user.user?.displayName);
    });
    Get.offAll(() => HomeScreen());
    // print(userCredential.user);
  }

  faceBookSignInMethod() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(customPermissions: ['email']);
    final accessToken = result.accessToken!.token;
    print(accessToken);
    if (result.status == FacebookAuthProvider.credential(accessToken)) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);

      await _auth.signInWithCredential(faceCredential).then((user) {
        saveUser(user, user.user?.displayName);
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        saveUser(user, user.user?.displayName);
      });
      Get.offAll(HomeScreen());
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error Login Account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        saveUser(user, name);
      });
      Get.offAll(HomeScreen());
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error Create Account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user, String? name) async {
    await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user?.uid,
        name: name ?? user.user?.displayName,
        email: user.user?.email,
        password: ''));
  }
}

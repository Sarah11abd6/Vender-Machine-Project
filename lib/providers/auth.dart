import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vender_machine/Screens/bottomNavBar.dart';
import 'package:vender_machine/Screens/login/login.dart';
import 'package:vender_machine/constants.dart';

class Auth with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool? isLoading = false;
  String? message;
  final storage = GetStorage();

  signIn(String email, password) async {
    try {
      isLoading = true;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        storage.write('email', email);
        // storage.write('name', value.user!.displayName!);
        Get.to(ButtomNavBar());
        isLoading = false;
      });
    } on FirebaseAuthException catch (error) {
      isLoading = false;
      String? title = error.code;
      String? message;
      if (error.code == 'week-password') {
        message = 'كلمة المرور ضعيفة ';
      } else if (error.code == 'email-already-in-use') {
        message = 'هذا الايميل مستخدم بالفعل ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: kPrimaryColor,
        colorText: kBackgroundColor,
      );
    } catch (error) {
      Get.snackbar('حدث خطأ', error.toString());
    }
    notifyListeners();
  }

  login(String? email, String? password) async {
    isLoading = true;

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      storage.write('email', email);
      // storage.write('name', value.user!.displayName!);
      isLoading = false;
      Get.to(ButtomNavBar());
      emailController.text = '';
      passwordController.text = '';
    }).catchError((onError) {
      isLoading = false;
      Get.snackbar(
        "otp info",
        'الايميل او كلمة المرور غير صحيح',
        snackPosition: SnackPosition.BOTTOM,
      );
    });
    notifyListeners();
  }

  signInWithGoogle() async {
    isLoading = true;
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
       storage.write('email', value.user!.email);
        // storage.write('name', value.user!.displayName!);
      Get.to(ButtomNavBar());
      isLoading = false;
    }).catchError((onError) {
      isLoading = false;
      printError(info: onError);
    });
    // print(userCredential.user!.email);
  }

  logOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Get.offAll(() => LoginScreen());
    });
  }

  Widget showSnackBarItem(String? message) {
    return SnackBar(
        content: Container(
      color: Colors.black,
      child: Text(
        message!,
        style: const TextStyle(color: Colors.white),
      ),
    ));
  }
}

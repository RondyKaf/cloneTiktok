import 'dart:async';
import 'dart:io';

import 'package:clonetiktok/constant.dart';
import 'package:clonetiktok/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../views/home_screen.dart';
import '../views/screens/auth/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> user;
  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?> (firebaseAuth.currentUser);
    user.bindStream(firebaseAuth.authStateChanges());
    ever(user, setInitialeScreem);
  }

  setInitialeScreem(User? user){
    if(user == null){
      Get.offAll(()=>LoginScreen());
    }else{
      Get.offAll(()=>const HomeScreen());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar("profile selectionné", "votre selection à réussi");
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  //update image
  Future<String> _updateToString(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child("profil")
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  //register the user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {

        //save out user to our ath and firebase  firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downoadUrl = await _updateToString(image);
        model.User user = model.User(
            name: username,
            email: email,
            uid: cred.user!.uid,
            profilePhoto: downoadUrl);
        await firebaseFirestore.collection("users").doc(cred.user!.uid).set(user.toJson());
      } else {
        Get.snackbar("Error  creating Account", "plaese enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error  creating Account", e.toString());
    }
  }
  void loginUser(String email,String passWord) async{
    try{
      if(email.isNotEmpty && passWord.isNotEmpty){
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: passWord);
        print("log success");
      }else{
        Get.snackbar('error login', "passWord error");
      }
    }catch(e){
      Get.snackbar("Error login", e.toString());
    }
  }
  void timer(String emailUser,String nameUser, String passeWord) async{
    Timer(const Duration(seconds: 2),(){
      nameUser = '';
      emailUser = '';
      passeWord = '';
    });
  }
}

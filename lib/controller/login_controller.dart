import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repository/movie_repository.dart';
import '../utils/firebase_service.dart';

class LoginController extends GetxController{
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  RxString id=''.obs;
  RxString otp=''.obs;

  void verifyPhone() {
     FirebaseService().phoneAuthentication(phoneController.text,(value){
                   id=(value as String).obs;
                   update();
                });
  }

  void updateOtp(String pin) {
    otp=pin.obs;
    update();
              print("Completed: " + pin);
  }

  void signUp() async{
    FirebaseService().signInWithCredentials(id.value, otp.value)!.then((value) async{
       var data=FirebaseService().signUpFirebase(emailController.text,passController.text);
                var getData=await MovieRepository().generateTokenUrl(UrlConstants.authUrl);
                print(FirebaseService().getUser());
                if(FirebaseService().getUser()!=null){
                  Get.toNamed('/Login');
                }
    });
               
  }
}
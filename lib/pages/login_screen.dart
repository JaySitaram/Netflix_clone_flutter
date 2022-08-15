import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netflix_demo/controller/login_controller.dart';
import 'package:flutter_netflix_demo/repository/common_repository.dart';
import 'package:flutter_netflix_demo/repository/movie_repository.dart';
import 'package:flutter_netflix_demo/utils/colors.dart';
import 'package:flutter_netflix_demo/widgets/button_widget.dart';
import 'package:flutter_netflix_demo/widgets/textfieldwidget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../assets.dart';
import '../utils/firebase_service.dart';
import '../utils/shared_pref_service.dart';
import 'wrapper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  
  LoginController loginController=Get.put(LoginController());
  GlobalKey<ScaffoldState> globalKey=GlobalKey();
  GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WrapperElement(
      globalKey: globalKey,
      formKey: formKey,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormWidget(
            textEditingController: loginController.emailController,
            fillColor: AppColors.greyColor,
            hintText: "Email or phone number",
            maxLines: 1,
            labelTitle: "Email or phone number",
            keyboard: TextInputType.text,
            onChanged: (value){},
            validator: (value){
              if(value!.isEmpty){
                return "Email or password required";
              }
            },
          ),
          SizedBox(
            height: 5.w,
          ),
          TextFormWidget(
             textEditingController: loginController.passController,
              fillColor: AppColors.greyColor,
            hintText: "Password",
            maxLines: 1,
            keyboard: TextInputType.text,
            onChanged: (value){},
            labelTitle: "Password",
            validator: (value){
              if(value!.isEmpty){
                return "Email or password required";
              }
            },
          ),
          SizedBox(
            height: 5.w,
          ),
          ButtonWidget(
            onPressed: () async{
              if(formKey.currentState!.validate()){
                SharedPrefs.setBoolValue("isLogin", true);
                var data=FirebaseService().loginFirebase(loginController.emailController.text,loginController.passController.text);
                var getData=await MovieRepository().generateTokenUrl(UrlConstants.authUrl);
                if(FirebaseService().getUser()!=null){
                  Get.toNamed('/Home');
                }
              }
            },
            width: 100.w,
            height: 15.w,
            widget: Text("Sign In"),
            borderColor: AppColors.whiteColor,
          ),
          SizedBox(
            height: 5.w,
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed('/SignUp');
            },
            child: Text("Dont have account?Sign Up",style: TextStyle(
              color: AppColors.greyColor,
             fontSize: 10.sp
            ),),
          ),
        ],
      ),
    );
  }
}
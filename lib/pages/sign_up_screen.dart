import 'package:flutter/material.dart';
import 'package:flutter_netflix_demo/pages/wrapper.dart';
import 'package:flutter_netflix_demo/repository/movie_repository.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

import '../controller/login_controller.dart';
import '../utils/colors.dart';
import '../utils/firebase_service.dart';
import '../widgets/button_widget.dart';
import '../widgets/textfieldwidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  LoginController loginController=Get.put(LoginController());
  GlobalKey<ScaffoldState> globalKey=GlobalKey();
  GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: loginController,
      builder: (controller) {
        return WrapperElement(
          formKey: formKey,
          globalKey: globalKey,
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormWidget(
                textEditingController: loginController.emailController,
                fillColor: AppColors.greyColor,
                hintText: "Email Address",
                maxLines: 1,
                labelTitle: "Email Address",
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
              TextFormWidget(
                 textEditingController: loginController.phoneController,
                  fillColor: AppColors.greyColor,
                hintText: "Phone Number",
                maxLines: 1,
                keyboard: TextInputType.phone,
                onChanged: (value){},
                labelTitle: "Phone Number",
                validator: (value){
                  if(value!.isEmpty){
                    return "Phone Number required";
                  }
                },
              ),
              SizedBox(
                height: 5.w,
              ),
              ButtonWidget(
                onPressed: () async{
                  if(formKey.currentState!.validate()){
                    loginController.verifyPhone();
                  }
                },
                width: 100.w,
                height: 15.w,
                widget: Text("Verify Phone"),
                borderColor: AppColors.whiteColor,
              ),
                SizedBox(
                height: 5.w,
              ),
              loginController.id.value.isNotEmpty?OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 8.w,
                style: TextStyle(
                  fontSize: 17
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  loginController.updateOtp(pin);
                },
              ):Container(),
                loginController.id.value.isNotEmpty? SizedBox(
                height: 5.w,
              ):Container(),
              ButtonWidget(
                onPressed: () async{
                  if(formKey.currentState!.validate()){
                     loginController.signUp();
                  }
                },
                width: 100.w,
                height: 15.w,
                widget: Text("Sign Up"),
                borderColor: AppColors.whiteColor,
              ),
              
               SizedBox(
                height: 5.w,
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed('/Login');
                },
                child: Text("Already have account?Sign In",style: TextStyle(
                  color: AppColors.greyColor,
                fontSize: 10.sp
                ),),
              ),
            ],
          ),
        );
      }
    );    
  }
}
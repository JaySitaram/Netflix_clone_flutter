import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/common_repository.dart';

class FirebaseService {
  loginFirebase(String email, String password) {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .catchError((e) {
        throw CustomException(e);
      });
    } on SocketException catch (e) {
    } on FormatException catch (e) {
    } on CustomException catch (e) {
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: "Something went wrong",
      ));
    }
  }

  signUpFirebase(String email, String password) {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((e) {
        throw CustomException(e);
      });
    } on SocketException catch (e) {
    } on FormatException catch (e) {
    } on CustomException catch (e) {
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: "Something went wrong",
      ));
    }
  }

  getUser() {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }

  phoneAuthentication(String phoneNumber,Function(dynamic) function) {
    try {
      FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 60),
          verificationCompleted: (value) {},
          verificationFailed: (value) {
             Get.showSnackbar(GetSnackBar(
        message: "Verification Failed",
      ));
          },
          codeSent: (value, value1) {
            function(value);
          },
          codeAutoRetrievalTimeout: (value) {
             Get.showSnackbar(GetSnackBar(
        message: "showing timeout",
      ));
          });
    } on SocketException catch (e) {
       Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    } on FormatException catch (e) {
       Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    } on CustomException catch (e) {
       Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }

  Future<UserCredential>? signInWithCredentials(String verificationId,String smsCode){
    var credentials=PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    try{
      return FirebaseAuth.instance.signInWithCredential(credentials);
    }
    catch(e){
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }
}

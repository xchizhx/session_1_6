import 'package:flutter/cupertino.dart';
import 'package:ses_son_1_5/common/widgets/utils.dart';

class LogInPresenter {

  var isValidEmail = true;
  var isValidPassword = true;

  bool isValid(
      String email,
      String password,
      ){
    isValidEmail = true;
    isValidPassword = true;
    if (!checkEmail(email)){
      isValidEmail = false;
      return false;
    }
    if (password.isEmpty){
      isValidPassword = false;
      return false;
    }

    return true;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:ses_son_1_5/auth/data/models/modelAuth.dart';
import 'package:ses_son_1_5/auth/data/repository/supabase.dart';
import 'package:ses_son_1_5/common/widgets/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPresenter {

  var isValidEmail = true;
  var isValidPassword = true;
  var isValidConfirmPassword = true;

  bool isValid(
      String email,
      String password,
      String confirmPassword
      ){
     isValidEmail = true;
     isValidPassword = true;
     isValidConfirmPassword = true;
    if (!checkEmail(email)){
      isValidEmail = false;
      return false;
    }
    if (password.isEmpty){
      isValidPassword = false;
      return false;
    }
    if (confirmPassword != password) {
      isValidConfirmPassword = false;
      return false;
    }
    return true;
  }

  void pressSignUp(
      String email,
      String password,
      Function(AuthResponse) onResponse,
      Function(String) onError
      ){
    ModelAuth modelAuth = ModelAuth(email: email, password: password);
    request(
        request: () async  {return await signUp(modelAuth); },
        onResponse: onResponse,
        onError: onError);
  }
}


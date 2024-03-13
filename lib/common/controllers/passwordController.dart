import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';

class PasswordTextController extends TextEditingController{
  String getHashText(){
    var bytes = utf8.encode(text);
    var hash = sha256.convert(bytes).toString();
    return hash;
  }
}
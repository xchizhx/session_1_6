import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ses_son_1_5/auth/presentation/pages/signUpPage.dart';
import 'package:ses_son_1_5/common/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: "",
      anonKey: "");
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
      theme: theme,
    );
  }

}
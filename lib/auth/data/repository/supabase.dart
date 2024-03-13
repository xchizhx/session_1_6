import 'package:ses_son_1_5/auth/data/models/modelAuth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var supabase = Supabase.instance.client;

Future<AuthResponse> signUp(
    ModelAuth modelAuth
) async {
  return await supabase.auth.signUp(
    email: modelAuth.email,
    password: modelAuth.password);
}

Future<AuthResponse> signIp(
    ModelAuth modelAuth
    ) async {
  return await supabase.auth.signInWithPassword(
      email: modelAuth.email,
      password: modelAuth.password);
}

Future<void> logOut() async{
  await supabase.auth.signOut();
}
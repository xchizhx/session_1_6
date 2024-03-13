

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

bool checkEmail(String email){
  return RegExp(r"^[0-9a-z]+@[0-9a-z]+\.\w{2,}$").hasMatch(email);
}

void showErrorDialog(BuildContext context, String error){
  showDialog(context: context, builder: (_) => AlertDialog(
    title: const Text("Ошибка"),
    content: Text(error),
    actions: [
      TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text("OK"))
    ],
  ));
}

Future<bool> checkNetworkConnection()
async {
  var connectivityResult = Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

void showLoading(BuildContext context){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
          child: Dialog(
            surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            child: Center(
              child: Transform.scale(
                scale: 1.5,
                child: CircularProgressIndicator(),
              ),
            ),
          ))
  );
}

Future<void> request<T>({
  required Function() request,
  required Function(T) onResponse,
  required Function(String) onError
}
    )async {
  try {
    if (! await checkNetworkConnection()){
      onError("Ошибка подключения к интернету.");
      return;
    }
    dynamic result = await request();
    onResponse(result);
  } on AuthException catch(e) {
    onError(e.message);
  } on PostgrestException catch(e){
    onError(e.message);
  } on Exception catch(e){
    onError(e.toString());
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Holder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
            onPressed: (){},
            child: Text("ВЫХОД")),
      ),
    );
  }

}
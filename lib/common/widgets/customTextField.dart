import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomTextField extends StatefulWidget{
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isValid;
  final bool enableObscure;
  final Function(String)? onChange;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.isValid,
    required this.controller,
    this.enableObscure = false,
    this.onChange, });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text(widget.label),
        SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChange,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 58, 58, 58),
              )
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10),
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.titleMedium,
            suffixIcon: (widget.enableObscure) ?
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ) : null
          ),
        )
      ],
    );
  }
}
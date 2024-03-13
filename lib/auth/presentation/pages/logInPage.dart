import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ses_son_1_5/auth/domain/logInPresenter.dart';
import 'package:ses_son_1_5/auth/presentation/pages/Holder.dart';
import 'package:ses_son_1_5/auth/presentation/pages/signUpPage.dart';
import 'package:ses_son_1_5/common/controllers/passwordController.dart';

import '../../../common/widgets/customTextField.dart';

class LogIn extends StatefulWidget{
  const LogIn({super.key});
  
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  void initState(){
    super.initState();
    presenter = LogInPresenter();
  }

  late LogInPresenter presenter;

  var email = TextEditingController();
  var password = PasswordTextController();
  bool isRemember = false;

  bool isValid = false;

  void onChange(_){
    isValid = presenter.isValid(
        email.text,
        password.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 78,),
            Text("Добро пожаловать",
              style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 8,),
            Text("Заполните почту и пароль чтобы продолжить",
              style: Theme.of(context).textTheme.titleMedium,),
            CustomTextField(
              label: "Почта",
              hint: "**********@gmail.com",
              controller: email,
              onChange: onChange,
              isValid: presenter.isValidEmail || email.text.isEmpty
            ),
            CustomTextField(
                label: "Пароль",
                hint: "**********",
                controller: password,
                onChange: onChange,
              isValid: presenter.isValidEmail || password.text.isEmpty,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Holder()));
                          },
                          child: Text("Войти",
                            style: Theme.of(context).textTheme.titleSmall,)
                      ),
                    ),
                    SizedBox(height: 14,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => SignUpPage()));
                      },
                      child: RichText(text: TextSpan(
                          children: [
                            TextSpan(
                                text: "У меня нет аккаунта! ",
                                style: Theme.of(context).textTheme.titleMedium),
                            TextSpan(
                                text: "Создать",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: const Color.fromARGB(255, 106, 139, 249)
                                )
                            )
                          ])),
                    ),
                    SizedBox(height: 32,)
                  ],)
            )
          ],
        ),
      ),
    );
  }
}
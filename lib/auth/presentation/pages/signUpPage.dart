import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ses_son_1_5/auth/domain/signUpPresenter.dart';
import 'package:ses_son_1_5/auth/presentation/pages/Holder.dart';
import 'package:ses_son_1_5/auth/presentation/pages/logInPage.dart';
import 'package:ses_son_1_5/common/controllers/passwordController.dart';
import 'package:ses_son_1_5/common/widgets/customTextField.dart';
import 'package:ses_son_1_5/common/widgets/utils.dart';

class SignUpPage extends StatefulWidget{
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool isValid = false;

  late SignUpPresenter presenter;

  @override
  void initState(){
    super.initState();
    presenter = SignUpPresenter();
  }


  var email = TextEditingController();
  var password = PasswordTextController();
  var confirmPassword = TextEditingController();



  void onChange(_){
    setState(() {
      isValid = presenter.isValid(
        email.text,
        password.text,
        confirmPassword.text
      );
    });
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
            Text("Создать аккаунт",
            style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 8,),
            Text("Завершите регистрацию чтобы начать",
            style: Theme.of(context).textTheme.titleMedium,),
            CustomTextField(
              label: "Почта",
              hint: "**********@gmail.com",
              controller: email,
              onChange: onChange,
              isValid: presenter.isValidEmail ||
                  email.text.isEmpty,
            ),
            CustomTextField(
                label: "Пароль",
                hint: "**********",
                controller: password,
                onChange: onChange,
                isValid: presenter.isValidPassword ||
                    password.text.isEmpty,
            ),
            CustomTextField(
              label: "Повторите пароль",
              hint: "**********",
              controller: confirmPassword,
              onChange: onChange,
              isValid: presenter.isValidConfirmPassword ||
                confirmPassword.text.isEmpty,),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                            onPressed: (isValid)? (){
                              presenter.pressSignUp(
                                  email.text,
                                  password.getHashText(),
                                      (_) {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (_) => Holder()),
                                                (route) => false);
                                      },
                                      (error) {
                                    showErrorDialog(context, error);
                                      }
                              );
                              Navigator.pop(context);
                            } : null,
                            child: Text("Зарегестрироваться",
                            style: Theme.of(context).textTheme.titleSmall,)
                        ),
                      ),
                      SizedBox(height: 14,),
                       GestureDetector(
                         onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(
                               builder: (_) => const LogIn()));
                         },
                         child: RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "У меня уже есть аккаунт! ",
                                    style: Theme.of(context).textTheme.titleMedium),
                                TextSpan(
                                  text: "Войти",
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
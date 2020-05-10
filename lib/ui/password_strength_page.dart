import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:password_criteria/bloc/password_strength/password_strength_bloc.dart';


class PasswordStrengthPage extends StatefulWidget {
  String value;
  PasswordStrengthPage( this.value);

  @override
  _PasswordStrengthPageState createState() => _PasswordStrengthPageState();
}

class _PasswordStrengthPageState extends State<PasswordStrengthPage> {
  PasswordStrengthBloc passwordStrengthBloc = PasswordStrengthBloc();
  bool isValidPassword = false;
  bool islowerCase = false;
  bool isuperCase = false;
  bool isnumber = false;
  bool isEightChar = false;
  bool isspecialChar = false;
  bool ispattern = false;
  String isVisible;

  final FocusNode _passFocus = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    passwordStrengthBloc.add(OnTextChangedEvent(text: widget.value));
    return BlocListener<PasswordStrengthBloc, PasswordStrengthState>(
      listener: (context, state) {
        if (state is OnTextChangedState) {
          isVisible = state.text;
          passwordStrengthBloc.add(PasswordRegEx(passwordtext: state.text));
        }
        if (state is ValidPassword) {
          isValidPassword = true;
          islowerCase = true;
          isuperCase = true;
          isnumber = true;
          isEightChar = true;
          isspecialChar = true;
          ispattern = true;
        }
        if (state is InvalidPassword) {
          isValidPassword = state.isInvalidPassword;
          if (state.passwordValidation['lowerCase'] != null && state.passwordValidation['lowerCase']) {
            islowerCase = true;
          } else {
            islowerCase = false;
          }
          if (state.passwordValidation['upperCase'] != null && state.passwordValidation['upperCase']) {
            isuperCase = true;
          } else {
            isuperCase = false;
          }
          if (state.passwordValidation['specialChar'] != null && state.passwordValidation['specialChar']) {
            isspecialChar = true;
          } else {
            isspecialChar = false;
          }
          if (state.passwordValidation['minEightChar'] != null && state.passwordValidation['minEightChar']) {
            isEightChar = true;
          } else {
            isEightChar = false;
          }
          if (state.passwordValidation['oneNumber'] != null && state.passwordValidation['oneNumber']) {
            isnumber = true;
          } else {
            isnumber = false;
          }
        }
      },


     /* Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          key: const Key('passwordField'),
          textInputAction: TextInputAction.done,
          // decoration: (),
          focusNode: _passFocus,
          onChanged: (value) {
            passwordStrengthBloc.add(OnTextChangedEvent(text: value));
          },
        ),
      ),*/


      bloc: passwordStrengthBloc,
      child: BlocBuilder<PasswordStrengthBloc, PasswordStrengthState>(
        builder: (context, state) {
          return Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Criteria for a secure password",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(isEightChar == true ? "\u2713 At least 8 characters" : "•   At least 8 characters",
                          style: TextStyle(
                              color: (isEightChar == true) ? Colors.black : Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 15)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        isuperCase == true
                            ? "\u2713 At least 1 uppercase letter"
                            : "•   At least 1 uppercase letter",
                        style: TextStyle(
                            color: (isuperCase == true) ? Colors.black : Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          islowerCase == true
                              ? "\u2713 At least 1 lowercase letter"
                              : "•   At least 1 lowercase letter",
                          style: TextStyle(
                              color: (islowerCase == true) ? Colors.black : Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 15)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        isnumber == true ? "\u2713 At least 1 number" : "•   At least 1 number",
                        style: TextStyle(
                            color: (isnumber == true) ? Colors.black : Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        isspecialChar == true
                            ? "\u2713 At least 1 special character\n    ^  * . [ ] { } ( ) ? - \" ! @ # % & / \\ , > < ' : ; | _ ~ `"
                            : "•   At least 1 special character\n    ^  * . [ ] { } ( ) ? - \" ! @ # % & / \\ , > < ' : ; | _ ~ `",
                        style: TextStyle(
                            color: (isspecialChar == true) ? Colors.black : Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              ));
        },
        bloc: passwordStrengthBloc,
      ),
    );

  }
}

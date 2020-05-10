part of 'password_strength_bloc.dart';

@immutable
abstract class PasswordStrengthState {}

class InitialPasswordStrengthState extends PasswordStrengthState {}
class OnTextChangedState extends PasswordStrengthState {
  String text;
  OnTextChangedState({this.text});
}

class ValidPassword extends PasswordStrengthState{}
class InvalidPassword extends PasswordStrengthState {
  Map<String, bool> passwordValidation;
  bool isInvalidPassword ;

  InvalidPassword({@required this.passwordValidation ,  this.isInvalidPassword});
}
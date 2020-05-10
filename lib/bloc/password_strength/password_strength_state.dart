part of 'password_strength_bloc.dart';

@immutable
abstract class PasswordStrengthState {}

class InitialPasswordStrengthState extends PasswordStrengthState {}

class OnTextChangedState extends PasswordStrengthState {
  final String text;

  OnTextChangedState({this.text});
}

class ValidPassword extends PasswordStrengthState {}

class InvalidPassword extends PasswordStrengthState {
  final Map<String, bool> passwordValidation;
  final bool isInvalidPassword;

  InvalidPassword({@required this.passwordValidation, this.isInvalidPassword});
}

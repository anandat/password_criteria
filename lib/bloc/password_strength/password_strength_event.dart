part of 'password_strength_bloc.dart';

@immutable
abstract class PasswordStrengthEvent {}

class OnTextChangedEvent extends PasswordStrengthEvent {
  String text;

  OnTextChangedEvent({this.text});
}

class PasswordRegEx extends PasswordStrengthEvent {
  String passwordtext;

  PasswordRegEx({this.passwordtext});
}

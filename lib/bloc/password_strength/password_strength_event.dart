part of 'password_strength_bloc.dart';

@immutable
abstract class PasswordStrengthEvent {}

@immutable
class OnTextChangedEvent extends PasswordStrengthEvent {
  final String text;

  OnTextChangedEvent({this.text});
}

@immutable
class PasswordRegEx extends PasswordStrengthEvent {
  final String passwordtext;

  PasswordRegEx({this.passwordtext});
}

import 'dart:async';
import "package:bloc/bloc.dart";
import 'package:meta/meta.dart';
import 'package:password_criteria/utility/utility.dart';


part 'password_strength_event.dart';

part 'password_strength_state.dart';

class PasswordStrengthBloc extends Bloc<PasswordStrengthEvent, PasswordStrengthState> {
  @override
  PasswordStrengthState get initialState => InitialPasswordStrengthState();

  @override
  Stream<PasswordStrengthState> mapEventToState(PasswordStrengthEvent event) async* {
    if (event is OnTextChangedEvent) {
      yield OnTextChangedState(text: event.text);
    }

    if (event is PasswordRegEx) {
      Map<String, bool> passwordRegEx;
      passwordRegEx = Utility().validatePasswordStructure(event.passwordtext);

      if (passwordRegEx['pattern'] != null && passwordRegEx['pattern']) {
        yield ValidPassword();
      } else {
        yield InvalidPassword(passwordValidation: passwordRegEx);
      }
    }
  }
}

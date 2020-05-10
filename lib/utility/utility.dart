class Utility {
  validatePasswordStructure(String value) {
    Map<String, bool> passwordRegEx = Map<String, bool>();

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[)(\][)(|:};{?.="\u0027%!+<@>#\$/&*~^_-`,\u005C\u002D]).{8,}$'; //[‘”]

    String lowerCase = r'^(?=.*?[a-z])';
    String upperCase = r'^(?=.*?[A-Z])';
    String specialChar = r'^(?=.*?[)(\][)(|:};{?.="\u0027%!+<@>#\$/&*~^_-`,\u005C\u002D])';

    String oneNumber = r'^(?=.*?[0-9])';

    if (RegExp(
      lowerCase,
      unicode: true,
    ).hasMatch(value)) {
      passwordRegEx['lowerCase'] = true;
    }
    if (RegExp(
      upperCase,
      unicode: true,
    ).hasMatch(value)) {
      passwordRegEx['upperCase'] = true;
    }
    if (RegExp(
      specialChar,
      unicode: true,
    ).hasMatch(value)) {
      passwordRegEx['specialChar'] = true;
    }
    if (value.length > 7) {
      passwordRegEx['minEightChar'] = true;
    }
    if (RegExp(
      oneNumber,
      unicode: true,
    ).hasMatch(value)) {
      passwordRegEx['oneNumber'] = true;
    }
    if (RegExp(
      pattern,
      unicode: true,
    ).hasMatch(value)) {
      passwordRegEx['pattern'] = true;
    }

    return passwordRegEx;
  }
}

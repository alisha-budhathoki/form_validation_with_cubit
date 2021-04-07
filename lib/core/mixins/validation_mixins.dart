mixin ValidationMixin {
  bool isPasswordValiid(String password) => password.length > 2 ? true : false;
  bool isValidEmailAddress(String email) {
    if (email == null) {
      return false;
    }

    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  // bool isValidAge(String age) =>
  //     age.length > 0 && int.parse(age) < 20 && int.parse(age) > 0
  //         ? true
  //         : false;
  bool isAgeLess(String age) {
    if (age.length > 0 && int.parse(age) < 20 && int.parse(age) > 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isAgeGreater(String age) {
    print('age value here: ' + age.toString());
    if (age.length > 0 && int.parse(age) > 40 && int.parse(age) < 60) {
      return true;
    } else {
      return false;
    }
  }
}

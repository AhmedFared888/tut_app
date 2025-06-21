import 'dart:async';

import 'package:tut_app/presentation/base/base_view_model.dart';

class LoginViewmodel extends BaseViewModel
    implements LoginViewmodelInputs, LoginViewmodelOutputs {
  final StreamController _userNameStreamController = StreamController<
      String>.broadcast(); // broadcast to make the streamContoller has many listeners
  final StreamController _passWordStreamController = StreamController<
      String>.broadcast(); // broadcast to make the streamContoller has many listeners

  // inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passWordStreamController.close();
  }

  @override
  void start() {}

  @override
  Sink get inputPassword => _passWordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() {}

  @override
  setPassword(String password) {}

  @override
  setUserName(String userName) {}
  // outputs
  @override
  Stream<bool> get outputIsPasswordValid => _passWordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }
}

abstract class LoginViewmodelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewmodelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
}

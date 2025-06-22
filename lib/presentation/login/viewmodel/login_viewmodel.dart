import 'dart:async';

import 'package:tut_app/presentation/base/base_view_model.dart';
import 'package:tut_app/presentation/common/freezed_data_classes.dart';

class LoginViewmodel extends BaseViewModel
    implements LoginViewmodelInputs, LoginViewmodelOutputs {
  final StreamController _userNameStreamController = StreamController<
      String>.broadcast(); // broadcast to make the streamContoller has many listeners
  final StreamController _passWordStreamController = StreamController<
      String>.broadcast(); // broadcast to make the streamContoller has many listeners
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");
  // final LoginUsecase _loginUsecase;
  // LoginViewmodel(this._loginUsecase);

  // inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passWordStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {}

  @override
  Sink get inputPassword => _passWordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  login() async {
    // (await _loginUsecase.execute(
    //         LoginUsecaseInput(loginObject.userName, loginObject.password)))
    //     .fold(
    //         (left) => {
    //               // left -> failure
    //             },
    //         (R) => {
    //               // right -> success
    //             });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputAreAllInputsValid.add(null);
  }

  // outputs
  @override
  Stream<bool> get outputIsPasswordValid => _passWordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isUserNameValid(loginObject.userName) &&
        _isPasswordValid(loginObject.password);
  }
}

abstract class LoginViewmodelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}

abstract class LoginViewmodelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputAreAllInputsValid;
}

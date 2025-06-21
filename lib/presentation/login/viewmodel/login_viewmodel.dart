import 'package:tut_app/presentation/base/base_view_model.dart';

class LoginViewmodel extends BaseViewModel
    implements LoginViewmodelInputs, LoginViewmodelOutputs {
  // inputs
  @override
  void dispose() {}

  @override
  void start() {}

  @override
  Sink get inputPassword => throw UnimplementedError();

  @override
  Sink get inputUserName => throw UnimplementedError();

  @override
  login() {}

  @override
  setPassword(String password) {}

  @override
  setUserName(String userName) {}
  // outputs
  @override
  Stream<bool> get outputIsPasswordValid => throw UnimplementedError();

  @override
  Stream<bool> get outputIsUserNameValid => throw UnimplementedError();
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

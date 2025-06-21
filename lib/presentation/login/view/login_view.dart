import 'package:flutter/material.dart';

import '../viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewmodel _viewModel = LoginViewmodel(_loginUseCase);
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _bind() {
    _viewModel.start(); // tell viewmodel, start your job
    _userNameController.addListener(() => _viewModel.setUserName(
        _userNameController.text)); // listen to every char the user will input
    _passwordController.addListener(() => _viewModel.setPassword(
        _passwordController.text)); // listen to every char the user will input
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

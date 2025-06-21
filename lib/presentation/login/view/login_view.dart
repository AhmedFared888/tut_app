import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/valus_manager.dart';

import '../../resources/assets_manager.dart';
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
  final _formKey = GlobalKey<FormState>();

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

  Widget _getContentWidget() {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p85),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(child: Image.asset(ImageAssets.splashLogo)),
                const SizedBox(
                  height: AppSize.s40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p48),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameController,
                        decoration: InputDecoration(
                            hintText: StringsManager.userName,
                            labelText: StringsManager.userName,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : StringsManager.userNameError),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p48),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: StringsManager.password,
                            labelText: StringsManager.password,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : StringsManager.passwordError),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: AppSize.s48,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p48),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordValid,
                    builder: (context, snapshot) {
                      return ElevatedButton(
                        onPressed: () {
                          _viewModel.login();
                        },
                        child: const Text(
                          StringsManager.login,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:tut_app/data/repository/repository_impl.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/valus_manager.dart';

import '../../../domain/repos/repo.dart';
import '../../../domain/usecase/login_usecase.dart';
import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Repo _repo = RepositoryImpl(_remoteDataSource, _networkInfo) 
  final LoginUsecase _loginUseCase = LoginUsecase(_repo);
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
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p155),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(child: Image.asset(ImageAssets.splashLogo)),
                const SizedBox(
                  height: AppSize.s48,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p30),
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
                  height: AppSize.s30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p30),
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
                  height: AppSize.s70,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputAreAllInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.login();
                                }
                              : null,
                          child: const Text(
                            StringsManager.login,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20,
                    vertical: AppPadding.p8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              (context), RoutesManager.forgetPasswordRoute);
                        },
                        child: Text(
                          StringsManager.forgetPassword,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: ColorManager.primary),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              (context), RoutesManager.registerRoute);
                        },
                        child: Text(
                          StringsManager.registerText,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: ColorManager.primary),
                        ),
                      ),
                    ],
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

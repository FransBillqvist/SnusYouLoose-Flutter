import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Components/app_textfield.dart';
import 'package:snusyoulooseflutter/Config/app_strings.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Model/User.dart';
import '../Services/app_services.dart';

class CreateAccountWidget extends StatefulWidget {
  final VoidCallback onExit;
  CreateAccountWidget({required this.onExit});

  @override
  State<CreateAccountWidget> createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final _emailFormKey = GlobalKey<FormFieldState>();
  final _passwordFormKey = GlobalKey<FormFieldState>();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _lastFocusNode = FocusNode();
  bool _emailIsValid = false;
  bool _passwordIsValid = false;
  bool _firstIsValid = false;
  bool _lastIsValid = false;
  bool _formIsValid = false;
  bool _nameIsValid = false;
  late int stage = 0;
  var _email = '';
  var _password = '';
  var _firstName = '';
  var _lastName = '';

  bool isValidEmail(String input) {
    final RegExp regex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return regex.hasMatch(input);
  }

  bool isValidPassword(String input) {
    final RegExp regex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{6,}$');
    return regex.hasMatch(input);
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateEmailValidity);
    passwordController.addListener(_updatePasswordValidity);
    firstNameController.addListener(_updateFirstValidity);
    lastNameController.addListener(_updateLastValidity);
  }

  @override
  void dispose() {
    emailController.removeListener(_updateEmailValidity);
    passwordController.removeListener(_updatePasswordValidity);
    firstNameController.removeListener(_updateFirstValidity);
    lastNameController.removeListener(_updateLastValidity);
    super.dispose();
  }

  void _updateEmailValidity() {
    setState(() {
      _emailIsValid = isValidEmail(emailController.text);
      _formIsValid = _emailIsValid && _passwordIsValid;
    });
  }

  void _updatePasswordValidity() {
    setState(() {
      _passwordIsValid = isValidPassword(passwordController.text);
      _formIsValid = _emailIsValid && _passwordIsValid;
    });
  }

  void _updateFirstValidity() {
    setState(() {
      _firstIsValid = firstNameController.text.length >= 2;
      _nameIsValid = _firstIsValid && _lastIsValid;
    });
  }

  void _updateLastValidity() {
    setState(() {
      _lastIsValid = lastNameController.text.length >= 2;
      _nameIsValid = _firstIsValid && _lastIsValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: _passwordIsValid
              ? MediaQuery.of(context).size.height * .5
              : MediaQuery.of(context).size.height * .55,
          width: MediaQuery.of(context).size.width * .99,
          decoration: BoxDecoration(
            color: AppColors.cartBgLight2,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Text(
                  AppStrings.createAccountWelcome,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(28, 10, 10, 0),
                child: Text(
                  AppStrings.createAccountInfo,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              if (stage == 0) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(
                    AppStrings.stage0reg,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 8, 0),
                  child: AppTextField(
                    controllerName: firstNameController,
                    labelText: '${AppStrings.firstName}',
                    onChanged: (value) {
                      _firstName = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 18, 8, 0),
                  child: AppTextField(
                    controllerName: lastNameController,
                    labelText: '${AppStrings.lastName}',
                    onChanged: (value) {
                      _lastName = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 52),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: Size(200, 50),
                    ),
                    onPressed:
                        _nameIsValid // Enable the button if the form is valid
                            ? () {
                                setState(() {
                                  stage = 1;
                                });
                              }
                            : null,
                    child: Text('Next'),
                  ),
                ),
              ] else if (stage == 1) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 8, 0),
                  child: AppTextField(
                    key: _emailFormKey, // Use the key here
                    controllerName: emailController,
                    labelText: '${AppStrings.email}',
                    focusNode: _emailFocusNode,
                    validator: (value) {
                      if (!isValidEmail(value!)) {
                        return 'Invalid email format.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 18, 8, 0),
                  child: AppTextField(
                    key: _passwordFormKey, // Use the key here
                    controllerName: passwordController,
                    labelText: '${AppStrings.password}',
                    focusNode: _passwordFocusNode,
                    obscureText: true,
                    validator: (value) {
                      if (!isValidPassword(value!)) {
                        return 'Invalid Password, please try again. \nPassword must contain at least 6 characters,\nincluding UPPER/lowercase, numbers and\nnon-alphanumeric characaters.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 63.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fixedSize: Size(200, 50),
                      ),
                      onPressed: _formIsValid
                          ? () async {
                              var _fullName = _firstName + " " + _lastName;
                              var _username = _firstName + "." + _lastName;
                              var authBody = {
                                "email": _email,
                                "username": _firstName + "." + _lastName,
                                "fullName": _firstName + " " + _lastName,
                                "password": _password,
                                "confirmPassword": _password
                              };
                              try {
                                var authRequest = await postCreateAuthUser(
                                    _email, _password, _fullName, _username);
                                var user = User(
                                    _password,
                                    "string",
                                    "string",
                                    authRequest.id,
                                    _username,
                                    _email,
                                    "string",
                                    _firstName,
                                    _lastName,
                                    "string",
                                    "string",
                                    authRequest.id,
                                    DateTime.now(),
                                    "string");
                                await postCreateUser(user);
                              } catch (e) {
                                print(e);
                              }
                            }
                          : null,
                      child: Text(AppStrings.createAccountButton)),
                ),
              ]
            ]),
          ),
        ),
      ],
    );
  }
}

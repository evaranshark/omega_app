import 'dart:io';
import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omega_app/constants.dart';
import 'package:omega_app/helpers.dart';
import 'package:omega_app/widgets/omega_text_button.dart';

import 'widgets/omega_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(
      {super.key,
      this.onForgotPassword,
      this.onRegister,
      this.onLogin,
      this.onLoginSuccess,
      this.onLoginFailed});
  final VoidCallback? onForgotPassword,
      onRegister,
      onLogin,
      onLoginSuccess,
      onLoginFailed;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  void onPressed() {
    if (_formKey.currentState!.validate()) {
      widget.onLogin?.call();
    }
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Text(
                          "Вход",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: AppColors.textH,
                                fontSize:
                                    _calculateHFontSize(constraints.maxWidth),
                              ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Text(
                          "Введите данные, чтобы войти в личный кабинет.",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textP,
                                    fontSize: Helpers.constraintWidthValue(
                                      constraintWidth: constraints.maxWidth,
                                      values: [(400, 15)],
                                      defaultValue: 16,
                                    ),
                                  ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    OmegaFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        label: Text("E-mail"),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Пожалуйста, введите E-mail";
                        }
                        if (!EmailValidator.validate(value)) {
                          return " Некорректный e-mail";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OmegaFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text("Пароль"),
                      ),
                      validator: (value) {
                        if ((value == null || value.isEmpty)) {
                          return 'Пожалуйста, введите пароль';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: OmegaTextButton.underlined(
                        onPressed: widget.onForgotPassword ?? () {},
                        child: const Text("Забыли пароль?"),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        onPressed: onPressed,
                        child: const Text(
                          "Войти",
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    const _LoginFormDivider(),
                    const SizedBox(
                      height: 25,
                    ),
                    const SocialLoginRow(),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text.rich(
                        TextSpan(text: "Ещё нет аккаунта? ", children: [
                          WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              // Alternatively we can use [LinkText] widget as a child
                              child: OmegaTextButton(
                                onPressed: widget.onRegister ?? () {},
                                child: const Text("Зарегистрируйтесь"),
                              )),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateHFontSize(double maxWidth) {
    if (kIsWeb) {
      return 52;
    }
    if (Platform.isWindows) {
      return 52;
    }
    return Helpers.constraintWidthValue<double>(
      constraintWidth: maxWidth,
      values: [(400, 39)],
      defaultValue: 50,
    );
  }
}

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(14),
          ),
          onPressed: () {},
          child: Image.asset(Assets.yColoredPng),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(14),
          ),
          onPressed: () {},
          child: SvgPicture.asset(
            Assets.gColored,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(14),
          ),
          onPressed: () {},
          child: Image.asset(Assets.vkColoredPng),
        ),
      ],
    );
  }
}

class _LoginFormDivider extends StatelessWidget {
  const _LoginFormDivider();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Или войдите с помощью:",
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return LoginPage();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Text("Links"),
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            collapsedHeight: 80,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ColoredBox(
                    color: Colors.red,
                    child: Text("1"),
                  ),
                ),
                Expanded(
                  child: ColoredBox(
                    color: Colors.blue,
                    child: Text("2"),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 880,
            ),
            child: LoginPageWeb(),
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: ColoredBox(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Scaffold(
            backgroundColor: Colors.transparent,
            body: kIsWeb
                ? Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      _LoginForm(),
                      Spacer(
                        flex: 7,
                      ),
                    ],
                  )
                : _LoginForm(),
          ),
        ],
      ),
    );
  }
}

class LoginPageWeb extends StatelessWidget {
  const LoginPageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Spacer(
              flex: 1,
            ),
            _LoginForm(),
            Spacer(
              flex: 7,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: LoginForm(
            onLogin: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("login actions")),
            ),
          ),
        ),
      ),
    );
  }
}

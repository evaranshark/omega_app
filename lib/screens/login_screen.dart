import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:omega_app/widgets/page_bar.dart';

import '../login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const LoginPage();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Text("Links"),
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            collapsedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageBar(
                      pages: [
                        PageItem(text: "Игры"),
                        PageItem(text: "Приложения"),
                        PageItem(text: "Сообщество"),
                        PageItem(text: "Турнир"),
                        PageItem(text: "Справка"),
                      ],
                      onSelected: (value) {
                        debugPrint("Selected menu item $value");
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 880,
            ),
            child: const LoginPageWeb(),
          )),
          const SliverToBoxAdapter(
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
    return const Scaffold(
      body: DecoratedBox(
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
          padding: const EdgeInsets.all(16.0),
          child: LoginForm(
            onLogin: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("login actions")),
            ),
          ),
        ),
      ),
    );
  }
}

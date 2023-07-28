import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omega_app/constants.dart';
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
            toolbarHeight: 0,
            backgroundColor: Colors.white,
            pinned: true,
            collapsedHeight: 80,
            flexibleSpace: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(Assets.logo),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 320,
                      ),
                      child: const TextField(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OmegaIconButton(
                        icon: SvgPicture.asset(Assets.cart),
                      ),
                      OmegaIconButton(
                        icon: SvgPicture.asset(Assets.favorite),
                      ),
                      OmegaIconButton(
                        icon: SvgPicture.asset(Assets.login),
                        label: const Text("Вход"),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
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

class OmegaIconButton extends StatelessWidget {
  final Widget icon;
  final Widget? label;
  const OmegaIconButton({
    super.key,
    required this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: (label == null)
              ? icon
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon,
                    const SizedBox(
                      width: 2,
                    ),
                    label!,
                  ],
                ),
        ),
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

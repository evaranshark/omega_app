import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omega_app/constants.dart';
import 'package:omega_app/themes.dart';
import 'package:omega_app/widgets/link_text.dart';
import 'package:omega_app/widgets/page_bar.dart';

import '../login_form.dart';
import '../widgets/omega_icon_button.dart';
import '../widgets/omega_search_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const LoginPage();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const OmegaLinksLine(),
          // Probably needs to be adapted for small screen sizes.
          // UI design not provided
          const OmegaToolbar(),
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

class OmegaLinksLine extends StatelessWidget {
  const OmegaLinksLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var linkStyle = Theming.defaultHeaderLinkStyle;
    return Theme(
      data: Theme.of(context).copyWith(
        extensions: [linkStyle],
      ),
      child: SliverToBoxAdapter(
        child: SizedBox(
          height: 20,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1150,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    LinkText(
                      text: "Для вас",
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    LinkText(
                      text: "Для бизнеса",
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    LinkText(
                      text: "Для разработчиков",
                      onPressed: () {},
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
}

class OmegaToolbar extends StatelessWidget {
  const OmegaToolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 0,
      backgroundColor: Colors.white,
      pinned: true,
      collapsedHeight: 80,
      flexibleSpace: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1150,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                  child: const OmegaSearchField(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OmegaIconButton(
                      svgAsset: Assets.cart,
                    ),
                    OmegaIconButton(
                      svgAsset: Assets.favorite,
                    ),
                    OmegaIconButton(
                      svgAsset: Assets.login,
                      label: "Вход",
                    ),
                  ],
                ),
              ),
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screen parts/login_page.dart';
import 'screen parts/omega_links_line.dart';
import 'screen parts/omega_toolbar.dart';

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
              height: 558,
              child: ColoredBox(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

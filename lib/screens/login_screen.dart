import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omega_app/constants.dart';
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
            child: Footer(),
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 558,
      child: Scaffold(
        backgroundColor: AppColors.footerBg,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 140,
            vertical: 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1160,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _FooterLinksArea()),
                  Divider(),
                  Expanded(child: _FooterCompanyArea()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterCompanyArea extends StatelessWidget {
  const _FooterCompanyArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _FooterLinksArea extends StatelessWidget {
  const _FooterLinksArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

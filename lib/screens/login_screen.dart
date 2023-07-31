import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/omega_web_page.dart';
import 'screen parts/login_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const LoginPage();
    return OmegaWebPage(
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 880,
        ),
        child: const LoginPageWeb(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeDataBase = ThemeData.light();
    return MaterialApp(
      restorationScopeId: "Omega app",
      theme: themeDataBase.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return const Color.fromARGB(255, 240, 238, 255);
              }
              if (states.contains(MaterialState.hovered)) {
                return const Color.fromARGB(255, 134, 27, 192);
              }
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 160, 74, 207);
              }
              return const Color.fromARGB(255, 160, 74, 207);
            }),
            foregroundColor: MaterialStateColor.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? const Color.fromARGB(255, 125, 110, 233)
                  : Colors.white;
            }),
            shadowColor:
                const MaterialStatePropertyAll<Color>(Colors.transparent),
            textStyle: MaterialStatePropertyAll(GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.03,
            )),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 35,
              ),
            ),
            minimumSize: const MaterialStatePropertyAll<Size>(Size(50, 50)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            visualDensity: VisualDensity.standard,
          ),
        ),
      ),
      home: const LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: onPressed,
            child: const Text(
              "Кнопка",
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_app/constants.dart';
import 'package:omega_app/omega_form_field.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeDataBase = ThemeData.light().copyWith(
      textTheme: ThemeData.light().textTheme.copyWith(
          labelSmall: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
          ),
          titleMedium: GoogleFonts.rubik(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          )),
    );
    return MaterialApp(
      restorationScopeId: "Omega app",
      theme: themeDataBase.copyWith(
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 170, 158, 255),
        ),
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
                  ? AppColors.violetHard
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
        inputDecorationTheme: InputDecorationTheme(
            border: MaterialStateOutlineInputBorder.resolveWith((states) {
          var activeStates = [
            MaterialState.hovered,
            MaterialState.focused,
            MaterialState.selected,
            MaterialState.pressed
          ];
          InputBorder getBorder(Color color) {
            return OutlineInputBorder(
              borderSide: BorderSide(
                color: color,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            );
          }

          if (activeStates.any(states.contains)) {
            return getBorder(AppColors.violetHard);
          }
          if (states.contains(MaterialState.error)) {
            return getBorder(AppColors.errorColor);
          }
          return getBorder(AppColors.violetLight);
        }), labelStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.03,
              color: AppColors.textP,
            );
          }
          return GoogleFonts.rubik(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.03,
            color: AppColors.violetLight,
          );
        }), floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.error)) {
            return themeDataBase.textTheme.labelSmall!.copyWith(
              color: AppColors.textLight,
            );
          }
          return themeDataBase.textTheme.labelSmall!.copyWith(
            color: AppColors.violetLight,
          );
        })),
      ),
      home: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  void onPressed() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: OmegaFormField(
                  textColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.error)) {
                      return Colors.red;
                    }
                    return Colors.black;
                  }),
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                  decoration: const InputDecoration(
                    label: Text("Подсказка"),
                  ),
                  validator: (value) {
                    if (!(value == null || value.isEmpty)) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(
                    "Кнопка",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

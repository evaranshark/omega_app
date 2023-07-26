import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'omega_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

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
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.75),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OmegaFormField(
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
                SizedBox(
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
      ),
    );
  }
}

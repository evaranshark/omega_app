import 'package:flutter/material.dart';

/// Need to propogate callbacks for [TextField]
class OmegaSearchField extends StatelessWidget {
  const OmegaSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Поиск",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: Icon(
          Icons.search,
        ),
      ),
    );
  }
}

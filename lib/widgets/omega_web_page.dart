import 'package:flutter/material.dart';

import '../screens/screen parts/footer.dart';
import '../screens/screen parts/omega_links_line.dart';
import '../screens/screen parts/omega_toolbar.dart';

class OmegaWebPage extends StatelessWidget {
  final Widget body;
  const OmegaWebPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const OmegaLinksLine(),
          // Probably needs to be adapted for small screen sizes.
          // UI design not provided
          const OmegaToolbar(),
          SliverToBoxAdapter(
            child: body,
          ),
          const SliverToBoxAdapter(
            child: Footer(),
          ),
        ],
      ),
    );
  }
}

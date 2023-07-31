import 'package:flutter/material.dart';

import '../../themes.dart';
import '../../widgets/link_text.dart';

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
                maxWidth: 1160,
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

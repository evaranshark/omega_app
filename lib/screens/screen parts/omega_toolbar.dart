import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../widgets/omega_icon_button.dart';
import '../../widgets/omega_search_field.dart';
import '../../widgets/page_bar.dart';

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
            maxWidth: 1160,
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

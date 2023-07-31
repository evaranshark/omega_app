import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../themes.dart';
import '../../widgets/link_text.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.rubik(
            color: AppColors.footerHeader,
            fontSize: 16.0,
            height: 26 / 16,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: GoogleFonts.rubik(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.footerHeader,
          ),
        ),
        elevatedButtonTheme: Theming.footerElevatedButtonTheme,
        extensions: [
          LinkTextStyle(
            textStyle: MaterialStateTextStyle.resolveWith(
              (states) => GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.cardBg,
              ),
            ),
          ),
        ],
      ),
      child: DefaultTextStyle(
        style: GoogleFonts.rubik(
          color: AppColors.footerHeader,
          fontSize: 16.0,
          height: 26 / 16,
          fontWeight: FontWeight.w400,
        ),
        child: ColoredBox(
          color: AppColors.footerBg,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 140,
              vertical: 80,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1160,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _FooterLinksArea(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 28.0),
                      child: Divider(
                        indent: 0,
                        endIndent: 0,
                        color: AppColors.textLight,
                      ),
                    ),
                    _FooterCompanyArea(),
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

class _FooterCompanyArea extends StatelessWidget {
  const _FooterCompanyArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("© 2023 ООО «ОМЕГА СТУДИО»"),
            Text("ИНН: 3528327105, ОГРН: 1213500003122"),
            Text(
                "162608, Вологодская область, г. Череповец, ул Белинского, д. 1/3"),
          ],
        ),
        Image.asset(Assets.footerLogo),
      ],
    );
  }
}

class _FooterLinksArea extends StatelessWidget {
  const _FooterLinksArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Links column 1
            const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FooterLinksGroup(
                  title: "Компания",
                  links: [
                    LinkText(text: "Omega Studio"),
                    LinkText(text: "Работа в Omega Studio"),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                _FooterLinksGroup(
                  title: "Разработчикам",
                  links: [
                    LinkText(text: "Справка"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 70,
            ),
            // Links column 2
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 215),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FooterLinksGroup(
                    title: "Пользователям",
                    links: [
                      LinkText(
                        text: "Пользовательское соглашение",
                        maxLines: 2,
                      ),
                      LinkText(
                        text: "Политика конфиденциальности",
                        maxLines: 2,
                      ),
                      LinkText(
                        text: "Политика использования файлов cookie",
                        maxLines: 2,
                      ),
                      LinkText(text: "Справка")
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            // Links column 3
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FooterLinksGroup(
                  title: "Бизнесу",
                  links: [
                    LinkText(text: "Контакты"),
                    LinkText(text: "Новости"),
                    LinkText(text: "Справка"),
                  ],
                ),
              ],
            ),
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 280,
          ),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image.asset(Assets.download),
                    const SizedBox(width: 10),
                    const Text(
                      "Скачать приложение",
                      maxLines: 1,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Text(
                      "Социальные сети:",
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(9.0),
                        ),
                        child: SvgPicture.asset(Assets.socialVk),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(9.0),
                        ),
                        child: SvgPicture.asset(Assets.socialTg),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(9.0),
                        ),
                        child: SvgPicture.asset(Assets.socialYt),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FooterLinksGroup extends StatelessWidget {
  final String title;
  final List<LinkText> links;
  const _FooterLinksGroup({
    super.key,
    required this.title,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ...links.map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 15),
            child: e,
          ),
        ),
      ],
    );
  }
}

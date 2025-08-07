import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class PageCouldNotBeReached extends StatelessWidget {
  const PageCouldNotBeReached({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: PageCouldNotBeReachedContent()));
  }
}

class PageCouldNotBeReachedContent extends StatelessWidget {
  const PageCouldNotBeReachedContent({super.key});


  @override
  Widget build(BuildContext context) {
    final l10n = "context.l10n";
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Container(child: SvgPicture.asset(Assets.icons.userCircle)), TODO
          SizedBox(height: Dimens.heightSmall),
          Text(
            "l10n.page_could_not_be_reached",
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorName.primary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimens.heightSmall),
          Text(
            "l10n.page_could_not_be_reached_content",
            style: textTheme.titleMedium?.copyWith(
              color: ColorName.primary.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

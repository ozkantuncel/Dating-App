import 'package:dating_app/resources/assets.gen.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isProfile;
  final VoidCallback? onPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.onPressed,
    this.isProfile = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorName.black,
      scrolledUnderElevation: 0.0,
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorName.white,
              ),
            )
          : null,
      leading: GestureDetector(
        onTap: () {
          if (!isProfile!) {
            context.pop();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            Assets.icon.back,
            height: 16,
            width: 16,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      actions: [
        if (isProfile!)
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: SvgPicture.asset(Assets.icon.gem),
            label: Text(
              'Sınırlı Teklif',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorName.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

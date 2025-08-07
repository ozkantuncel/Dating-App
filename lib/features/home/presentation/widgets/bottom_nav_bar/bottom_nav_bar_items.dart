import 'package:dating_app/features/home/presentation/widgets/home_page_view.dart';
import 'package:dating_app/features/profile/presentation/widgets/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Widget> bottomNavScreens = const [HomePageView(), ProfilePageView()];

class CustomNavItem extends StatelessWidget {
  final String assetPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavItem({
    super.key,
    required this.assetPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.white.withOpacity(0.1),
        highlightColor: Colors.white.withOpacity(0.05),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey.shade800 : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? Colors.white : Colors.grey.shade600,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                assetPath,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                  BlendMode.srcIn,
                ),
                width: 22,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Colors.white.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

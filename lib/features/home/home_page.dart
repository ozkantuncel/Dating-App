import 'package:dating_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:dating_app/features/home/presentation/widgets/bottom_nav_bar/bottom_nav_bar_items.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_page_bloc.dart';
import 'package:dating_app/features/profile/presentation/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:dating_app/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:dating_app/resources/assets.gen.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageBloc()),
        BlocProvider(create: (context) => ProfilePageBloc()),
      ],
      child: Scaffold(
        backgroundColor: ColorName.black,
        appBar: tabIndex == 1
            ? CustomAppBar(
                title: "Profil Detay",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return const LimitedOfferSheet();
                    },
                  );
                },
              )
            : null,
        body: bottomNavScreens[tabIndex],
        bottomNavigationBar: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomNavItem(
                  assetPath: Assets.icon.home,
                  label: 'Anasayfa',
                  isSelected: tabIndex == 0,
                  onTap: () => _onTabSelected(0),
                ),
                CustomNavItem(
                  assetPath: Assets.icon.profile,
                  label: 'Profil',
                  isSelected: tabIndex == 1,
                  onTap: () => _onTabSelected(1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

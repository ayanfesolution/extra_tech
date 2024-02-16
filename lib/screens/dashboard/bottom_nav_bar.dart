import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/dashboard/favourite/favourite_screen.dart';
import 'package:extra_tech/screens/dashboard/home/home_screen.dart';
import 'package:extra_tech/screens/dashboard/search/search_screen.dart';
import 'package:extra_tech/screens/dashboard/settings/settings_screen.dart';
import 'package:extra_tech/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavBar extends StatefulHookConsumerWidget {
  const BottomNavBar({super.key, this.currentIndex = 0});
  final int currentIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(widget.currentIndex);
    List<Widget> pages = [
      const HomeScreen(),
      const SearchScreen(),
      const FavoriteScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      body: pages[currentIndex.value],
      bottomNavigationBar: SizedBox(
        height: autoAdjustHeight(78),
        width: double.maxFinite,
        child: Container(
          decoration: BoxDecoration(
            color: kWHTCOLOUR,
            boxShadow: [
              BoxShadow(
                spreadRadius: autoAdjustHeight(0.02),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: autoAdjustWidth(16),
              vertical: autoAdjustHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavBarButton(
                  imagePath: 'assets/svgs/home_icon.svg',
                  isItActive: currentIndex.value == 0,
                  onTap: () {
                    currentIndex.value = 0;
                  },
                ),
                NavBarButton(
                  imagePath: 'assets/svgs/search-status-svgrepo-com1.svg',
                  isItActive: currentIndex.value == 1,
                  onTap: () {
                    currentIndex.value = 1;
                  },
                ),
                NavBarButton(
                  imagePath: 'assets/svgs/favourite_icon.svg',
                  isItActive: currentIndex.value == 2,
                  onTap: () {
                    currentIndex.value = 2;
                  },
                ),
                NavBarButton(
                  imagePath: 'assets/svgs/setting-2-svgrepo-com 7.svg',
                  isItActive: currentIndex.value == 3,
                  onTap: () {
                    currentIndex.value = 3;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    super.key,
    required this.imagePath,
    required this.isItActive,
    required this.onTap,
  });
  final String imagePath;
  final bool isItActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: autoAdjustHeight(36),
        width: autoAdjustWidth(56),
        color: isItActive ? kPRYCOLOUR.withOpacity(0.15) : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: SvgPicture.asset(imagePath),
        ),
      ),
    );
  }
}

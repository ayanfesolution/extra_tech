import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/auth/sign_in.dart';
import 'package:extra_tech/screens/dashboard/favourite/favourite_screen.dart';
import 'package:extra_tech/screens/dashboard/settings/notification/notification.dart';
import 'package:extra_tech/screens/dashboard/settings/profile/profile_screen.dart';
import 'package:extra_tech/screens/dashboard/settings/settings_screen.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../broadcast/broadcast_screen.dart';
import '../../products/product_details.dart';
import '../search/main_search.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final pageController = PageController(initialPage: 0);
  //final tabController = TabController(length: 2, vsync: this,);
  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kWHTCOLOUR,
        drawer: Drawer(
          backgroundColor: kWHTCOLOUR,
          // width: autoAdjustWidth(300),
          child: Padded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(autoAdjustHeight(75)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      maxRadius: autoAdjustHeight(20),
                      child: Image.asset(
                        'assets/images/Group19.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Gap(autoAdjustWidth(11)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Raphael Mobbin',
                          style: kCustomTextStyle(
                            size: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Distributor',
                          style: kCustomTextStyle(
                            size: 11,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF7D7D7D),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(autoAdjustHeight(8)),
                const Divider(),
                Gap(autoAdjustHeight(45)),
                ListTile(
                  leading: SvgPicture.asset(
                      'assets/svgs/user-edit-svgrepo-com 1.svg'),
                  title: Text(
                    'Profile',
                    style: kCustomTextStyle(
                      fontWeight: FontWeight.w700,
                      size: 16,
                    ),
                  ),
                  onTap: () {
                    RouteNavigators.route(
                      context,
                      const ProfileScreenPage(),
                    );
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/svgs/setting-bell-notification-.svg',
                  ),
                  title: Text(
                    'Notifications',
                    style: kCustomTextStyle(
                      fontWeight: FontWeight.w700,
                      size: 16,
                    ),
                  ),
                  onTap: () {
                    RouteNavigators.route(
                      context,
                      const NotificationScreen(),
                    );
                  },
                ),
                ListTile(
                  leading:
                      SvgPicture.asset('assets/svgs/favorite-chart-svgrep.svg'),
                  title: Text(
                    'Favorites',
                    style: kCustomTextStyle(
                      fontWeight: FontWeight.w700,
                      size: 16,
                    ),
                  ),
                  onTap: () {
                    RouteNavigators.route(
                      context,
                      const FavoriteScreen(),
                    );
                  },
                ),
                ListTile(
                  leading:
                      SvgPicture.asset('assets/svgs/private-lock-icon4.svg'),
                  title: Text(
                    'Settings',
                    style: kCustomTextStyle(
                      fontWeight: FontWeight.w700,
                      size: 16,
                    ),
                  ),
                  onTap: () {
                    RouteNavigators.route(
                      context,
                      const SettingsScreen(),
                    );
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Divider(),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/svgs/logout-svgrepo-com.svg',
                          ),
                          title: Text(
                            'Logout',
                            style: kCustomTextStyle(
                              fontWeight: FontWeight.w700,
                              size: 16,
                            ),
                          ),
                          onTap: () {
                            RouteNavigators.routeNoWayHome(
                              context,
                              const SignInScreen(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padded(
          child: Column(
            children: [
              Gap(autoAdjustHeight(50)),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: CircleAvatar(
                      maxRadius: autoAdjustHeight(20),
                    ),
                  ),
                ],
              ),
              Gap(autoAdjustHeight(18)),
              GestureDetector(
                onTap: () {
                  RouteNavigators.route(
                    context,
                    const MainSearchingScreen(),
                  );
                },
                child: Container(
                  height: autoAdjustHeight(46),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      autoAdjustHeight(20),
                    ),
                    color: const Color(0xFFF0F5F5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: autoAdjustWidth(33)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            'assets/svgs/search-svgrepo-com 1.svg'),
                        Gap(autoAdjustWidth(8)),
                        Text(
                          'Search',
                          style: kCustomTextStyle(
                            size: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFA8B4BA),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gap(autoAdjustHeight(25)),
              SizedBox(
                height: autoAdjustHeight(180),
                width: double.maxFinite,
                child: PageView.builder(
                  onPageChanged: (value) {
                    pageController.page == value;
                    currentIndex.value = value;
                  },
                  controller: pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padded(
                      child: Image.asset(
                        'assets/images/fullbackgrounddashboard.png',
                      ),
                    );
                  },
                ),
              ),
              Gap(autoAdjustHeight(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: autoAdjustHeight(5),
                    backgroundColor: currentIndex.value == 0
                        ? const Color(0xFF5CB4E6)
                        : const Color(0xFFC7C7C7).withOpacity(0.3),
                  ),
                  Gap(autoAdjustWidth(5)),
                  CircleAvatar(
                    radius: autoAdjustHeight(5),
                    backgroundColor: currentIndex.value == 1
                        ? const Color(0xFF5CB4E6)
                        : const Color(0xFFC7C7C7).withOpacity(0.3),
                  ),
                  Gap(autoAdjustWidth(5)),
                  CircleAvatar(
                    radius: autoAdjustHeight(5),
                    backgroundColor: currentIndex.value == 2
                        ? const Color(0xFF5CB4E6)
                        : const Color(0xFFC7C7C7).withOpacity(0.3),
                  )
                ],
              ),
              Gap(autoAdjustHeight(24)),
              const TabBar(
                tabs: [
                  Tab(
                    text: 'Recommended',
                  ),
                  Tab(
                    text: 'Broadcasts',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: autoAdjustWidth(16),
                        mainAxisSpacing: autoAdjustHeight(18),
                        mainAxisExtent: autoAdjustHeight(202),
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          RouteNavigators.route(
                              context, const ProductDetailsScreen());
                        },
                        child: const ProductGridWidget(),
                      ),
                      itemCount: 6,
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) =>
                          const BroadcastSingleWidget(),
                      itemCount: 5,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BroadcastSingleWidget extends StatelessWidget {
  const BroadcastSingleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: autoAdjustHeight(11),
      ),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'assets/images/totalenergies1.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Gap(autoAdjustWidth(10)),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Energies',
                      style: kCustomTextStyle(
                        size: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'It is the life that we choose, for...',
                      style: kCustomTextStyle(
                        size: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Gap(autoAdjustWidth(6)),
            Padded(
              child: SizedBox(
                height: autoAdjustHeight(274),
                width: double.maxFinite,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        RouteNavigators.route(
                          context,
                          const BroadcastFullScreen(),
                        );
                      },
                      child: Image.asset(
                        'assets/images/postUpdate.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        child: SvgPicture.asset(
                            'assets/svgs/play-svgrepo-com3.svg'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(autoAdjustHeight(8)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/chat-svgrepo-com2.svg',
                            ),
                            Text(
                              '2.3k',
                              style: kCustomTextStyle(
                                  size: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Gap(autoAdjustHeight(20)),
                            SvgPicture.asset(
                              'assets/svgs/like_icon.svg',
                            ),
                            Text(
                              '15.9k',
                              style: kCustomTextStyle(
                                  size: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: autoAdjustHeight(202),
      width: autoAdjustWidth(167),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          autoAdjustHeight(10),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: const Color.fromARGB(198, 199, 199, 110).withOpacity(0.43),
            spreadRadius: 0,
          ),
          BoxShadow(
            blurRadius: 12,
            color: const Color.fromRGBO(199, 199, 110, 0.78).withOpacity(0.43),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: autoAdjustHeight(116),
            width: autoAdjustWidth(167),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  autoAdjustHeight(10),
                ),
              ),
            ),
            child: Image.asset(
              'assets/images/product_pic.png',
            ),
          ),
          Gap(
            autoAdjustHeight(11),
          ),
          Padded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fossil Diesel',
                  style: kCustomTextStyle(
                    size: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gap(
                  autoAdjustHeight(16),
                ),
                Row(
                  children: [
                    Text(
                      '520.99',
                      style: kCustomTextStyle(
                        size: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(autoAdjustWidth(8)),
                    Container(
                      color: const Color(0xFFCF0505).withOpacity(0.5),
                      padding: EdgeInsets.all(
                        autoAdjustHeight(3),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '3.2%',
                            style: kCustomTextStyle(
                              size: 7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(autoAdjustWidth(2)),
                          SvgPicture.asset('assets/svgs/Vector.svg')
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

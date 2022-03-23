import 'package:facebook_clone_app/data/data.dart';
import 'package:facebook_clone_app/screens/screens.dart';
import 'package:facebook_clone_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                child: CustomAppBar(
                  onTap: (index) => setState(() => _selectedIndex = index),
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                ),
                preferredSize: Size(screenSize.width, 100),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomTabBar(
                  onTap: (index) => setState(() => _selectedIndex = index),
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

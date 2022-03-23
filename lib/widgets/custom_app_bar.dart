import 'package:facebook_clone_app/config/palette.dart';
import 'package:facebook_clone_app/models/models.dart';
import 'package:facebook_clone_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.onTap,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
  }) : super(key: key);
  final Function(int) onTap;
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
              onTap: onTap,
              icons: icons,
              selectedIndex: selectedIndex,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                const SizedBox(width: 12),
                CircleButton(
                  onPressed: () => debugPrint('Search'),
                  icon: Icons.search,
                  iconSize: 30,
                ),
                CircleButton(
                  onPressed: () => debugPrint('Messenger'),
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

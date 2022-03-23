import 'package:facebook_clone_app/models/models.dart';
import 'package:facebook_clone_app/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6),
          Text(
            user.name,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

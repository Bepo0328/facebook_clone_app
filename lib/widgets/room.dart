import 'package:facebook_clone_app/config/palette.dart';
import 'package:facebook_clone_app/models/models.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);
  final List<User> onlineUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 4,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _CreateRoomButton(),
            );
          }
          return Container(
            margin: const EdgeInsets.all(2),
            height: 20,
            width: 20,
            color: Colors.red,
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => debugPrint('Create Room'),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(
          width: 3,
          color: Colors.blueAccent.shade100,
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          const Text('Create\nRoom'),
        ],
      ),
    );
  }
}

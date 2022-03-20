import 'package:facebook_clone_app/models/models.dart';
import 'package:facebook_clone_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?',
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 10, thickness: 0.5),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => debugPrint('Live'),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Live',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(width: 8),
                TextButton.icon(
                  onPressed: () => debugPrint('Photo'),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text(
                    'Photo',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(width: 8),
                TextButton.icon(
                  onPressed: () => debugPrint('Room'),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purple,
                  ),
                  label: const Text(
                    'Room',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

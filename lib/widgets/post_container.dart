import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone_app/config/palette.dart';
import 'package:facebook_clone_app/models/models.dart';
import 'package:facebook_clone_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 4),
                Text(post.caption),
                post.imageUrl != ''
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6),
              ],
            ),
          ),
          post.imageUrl != ''
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => debugPrint('More'),
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              onTap: () => debugPrint('Like'),
              label: 'Like',
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
            ),
            _PostButton(
              onTap: () => debugPrint('Comment'),
              label: 'Comment',
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
            ),
            _PostButton(
              onTap: () => debugPrint('Share'),
              label: 'Share',
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  const _PostButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.icon,
  }) : super(key: key);
  final Function() onTap;
  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

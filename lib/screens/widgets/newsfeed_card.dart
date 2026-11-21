import 'package:flutter/material.dart';

class NewsfeedCard extends StatelessWidget {
  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    required this.numLikes,
    required this.avatarUrl,
    this.hasImage = false,
    this.imageUrl,
  });

  final String userName;
  final String postContent;
  final String date;
  final int numLikes;
  final String avatarUrl;
  final bool hasImage;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final photo = imageUrl;
    final ImageProvider avatar = avatarUrl.startsWith('assets/')
        ? AssetImage(avatarUrl)
        : NetworkImage(avatarUrl);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: ClipOval(
              child: Image(
                image: avatar,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    const CircleAvatar(child: Icon(Icons.person)),
              ),
            ),
            title: Text(userName),
            subtitle: Text(date),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(postContent),
          ),
          if (hasImage && photo != null)
            Image.asset(
              photo,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('$numLikes likes'),
          ),
        ],
      ),
    );
  }
}

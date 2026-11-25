import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsfeedCard extends StatefulWidget {
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
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard>
    with AutomaticKeepAliveClientMixin {
  Future<void> sharePost(BuildContext context) async {
    await Clipboard.setData(
      ClipboardData(text: '${widget.userName}: ${widget.postContent}'),
    );
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Post copied for sharing')));
    }
  }

  bool liked = false;
  bool showComments = false;
  final comments = <String>[];
  final input = TextEditingController();
  @override
  bool get wantKeepAlive => true;
  @override
  void dispose() {
    input.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final photo = widget.imageUrl;
    final avatarUrl = widget.avatarUrl;
    final ImageProvider avatar = avatarUrl.startsWith('assets/')
        ? AssetImage(avatarUrl)
        : NetworkImage(avatarUrl);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: avatarUrl.isEmpty
                ? const CircleAvatar(child: Icon(Icons.person))
                : ClipOval(
                    child: Image(
                      image: avatar,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) =>
                          const CircleAvatar(child: Icon(Icons.person)),
                    ),
                  ),
            title: Text(widget.userName),
            subtitle: Text(widget.date),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(widget.postContent),
          ),
          if (widget.hasImage && photo != null)
            Image.asset(
              photo,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          if (widget.hasImage && photo == null)
            const Padding(
              padding: EdgeInsets.all(12),
              child: AspectRatio(aspectRatio: 1.5, child: Placeholder()),
            ),
          Wrap(
            children: [
              TextButton.icon(
                onPressed: () => setState(() => liked = !liked),
                icon: Icon(liked ? Icons.thumb_up : Icons.thumb_up_outlined),
                label: Text('${widget.numLikes + (liked ? 1 : 0)}'),
              ),
              TextButton.icon(
                onPressed: () => setState(() => showComments = !showComments),
                icon: const Icon(Icons.chat_bubble_outline),
                label: const Text('Comment'),
              ),
              TextButton.icon(
                onPressed: () => sharePost(context),
                icon: const Icon(Icons.share_outlined),
                label: const Text('Share'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: input,
              decoration: const InputDecoration(hintText: 'Write a comment…'),
              onSubmitted: (value) {
                if (value.trim().isEmpty) return;
                setState(() {
                  comments.add(value.trim());
                  showComments = true;
                  input.clear();
                });
              },
            ),
          ),
          TextButton(
            onPressed: () => setState(() => showComments = !showComments),
            child: Text(showComments ? 'Hide comments' : 'View comments'),
          ),
          if (showComments)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                comments.isEmpty ? 'No comments yet' : comments.join('\n'),
              ),
            ),
        ],
      ),
    );
  }
}

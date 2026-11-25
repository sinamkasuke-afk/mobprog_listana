import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    required this.seen,
    required this.onToggle,
  });
  final String name, post, description;
  final bool seen;
  final VoidCallback onToggle;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      tileColor: seen
          ? colors.surface
          : colors.primaryContainer.withValues(alpha: 0.32),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: seen ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Post: $post'),
          Text(
            description,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
      trailing: PopupMenuButton<bool>(
        icon: const Icon(Icons.more_horiz),
        onSelected: (_) => onToggle(),
        itemBuilder: (_) => [
          PopupMenuItem(
            value: true,
            child: Text(seen ? 'Mark as unread' : 'Mark as read'),
          ),
        ],
      ),
    );
  }
}

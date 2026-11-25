import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static const names = [
    'Mika Cruz',
    'Luis Santos',
    'Ana Reyes',
    'Paolo Lim',
    'Bea Garcia',
  ];
  static const posts = [
    'Weekend market',
    'Campus fun run',
    'Study group',
    'Courtyard photos',
  ];
  static const actions = [
    'Liked your post',
    'Left a comment',
    'Shared your post',
    'Mentioned you in a comment',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ValueNotifier<Set<int>>({}),
      child: Consumer<ValueNotifier<Set<int>>>(
        builder: (context, read, _) => ListView.separated(
          key: const PageStorageKey('notifications'),
          itemCount: names.length * posts.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final seen = read.value.contains(index);
            return NotificationWidget(
              name: names[index % names.length],
              post: posts[index ~/ names.length],
              description: actions[index % actions.length],
              seen: seen,
              onToggle: () {
                final updated = {...read.value};
                if (seen) {
                  updated.remove(index);
                } else {
                  updated.add(index);
                }
                read.value = updated;
              },
            );
          },
        ),
      ),
    );
  }
}

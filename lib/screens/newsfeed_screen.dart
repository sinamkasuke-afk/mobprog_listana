import 'package:flutter/material.dart';

import 'widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key, this.showAppBar = true});

  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    final feed = ListView(
      children: const [
        NewsfeedCard(
          userName: 'Steve Rogers',
          postContent: 'I can do this all day! #AvengersAssemble',
          date: '2 hours ago',
          numLikes: 10,
          avatarUrl: 'https://i.pravatar.cc/150?img=12',
        ),
        NewsfeedCard(
          userName: 'Baby M',
          postContent: 'my father died today #Exciting',
          date: 'December 1, 2023',
          numLikes: 1000,
          hasImage: true,
          avatarUrl: 'assets/images/bombom.jpg',
          imageUrl: 'assets/images/ube_latte.jpg',
        ),
      ],
    );

    if (!showAppBar) return feed;

    return Scaffold(
      appBar: AppBar(title: const Text('Newsfeed')),
      body: feed,
    );
  }
}

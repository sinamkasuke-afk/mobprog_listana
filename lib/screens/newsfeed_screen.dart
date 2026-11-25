import 'package:flutter/material.dart';

import 'widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key, this.showAppBar = true});

  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    const posts = [
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
      NewsfeedCard(
        userName: 'kitty D',
        postContent: 'Cute langf.',
        date: 'November 24, 2026',
        numLikes: 12,
        avatarUrl: '',
        hasImage: true,
        imageUrl: 'assets/images/mika_cruz.jpeg',
      ),
      NewsfeedCard(
        userName: 'Luis Santos',
        postContent: 'Found a quiet corner in the library.',
        date: 'November 23, 2026',
        numLikes: 19,
        avatarUrl: '',
        hasImage: false,
      ),
      NewsfeedCard(
        userName: 'Ana Reyes',
        postContent: 'Who is joining the campus fun run?',
        date: 'November 22, 2026',
        numLikes: 26,
        avatarUrl: '',
        hasImage: false,
      ),
      NewsfeedCard(
        userName: 'Paolo Lim',
        postContent: 'The courtyard after the rain.',
        date: 'November 21, 2026',
        numLikes: 33,
        avatarUrl: '',
        hasImage: true,
      ),
      NewsfeedCard(
        userName: 'Bea Garcia',
        postContent: 'Our study group finally cracked the last problem!',
        date: 'November 20, 2026',
        numLikes: 40,
        avatarUrl: '',
        hasImage: false,
      ),
      NewsfeedCard(
        userName: 'Nico Tan',
        postContent: 'First batch of pandesal is ready.',
        date: 'November 19, 2026',
        numLikes: 47,
        avatarUrl: '',
        hasImage: false,
      ),
      NewsfeedCard(
        userName: 'Ella Ramos',
        postContent: 'Sunset practice with the photography club.',
        date: 'November 18, 2026',
        numLikes: 54,
        avatarUrl: '',
        hasImage: true,
      ),
      NewsfeedCard(
        userName: 'Sam Flores',
        postContent: 'See you at the weekend market!',
        date: 'November 17, 2026',
        numLikes: 61,
        avatarUrl: '',
        hasImage: false,
      ),
    ];
    final feed = ListView.builder(
      key: const PageStorageKey('feed'),
      itemCount: posts.length,
      itemBuilder: (_, index) => posts[index],
    );

    if (!showAppBar) return feed;

    return Scaffold(
      appBar: AppBar(title: const Text('Newsfeed')),
      body: feed,
    );
  }
}

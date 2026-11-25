# mobprog_listana

A new Flutter project.

Act 2
discussion question: Laboratory Discussion: Discuss how you manage to do the posts and the notification efficiently. Also, how you’ve accomplished the enhancement states the challenges and how you address them 

I used a reusable card for all 10 posts, giving each one its own date, caption, like count, and optional photo or placeholder. I used a reusable row for all 20 notifications and made both lists build items as needed during scrolling. To keep interactions independent, I stored likes and comments in each post’s card and used Provider to track which notifications were marked as read. To keep navigation in sync, I used the selected tab index to update the app bar title and highlighted icon when users tapped or swiped between Home, Notifications, and the new Profile tab. I named the app Tambayan and defined its teal and pale green palette in constants.dart so the screens could share the same colors.
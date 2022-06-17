import 'package:flutter/material.dart';
import 'package:post/src/ui/pages/post.dart';
import 'package:post/src/ui/pages/profile.dart';
import 'package:post/src/ui/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  final pages = const [
    PostPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemSelected: (index) {
          setState(() {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut);
          });
        },
      ),
    );
  }
}

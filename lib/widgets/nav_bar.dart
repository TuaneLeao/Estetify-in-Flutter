import 'package:flutter/material.dart';
import 'package:teste/cart_screen.dart';
import 'package:teste/home_screen.dart';
import 'package:teste/profile_screen.dart';

class NavBar extends StatefulWidget {
    
  
    const NavBar({
      super.key});
    @override State<NavBar> createState() => _NavBar();
}
int _currentIndex = 0;
class _NavBar extends State<NavBar> {
    late PageController pageController;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int page){
    setState(() {
      _currentIndex = page;
    });
  }

  navigationTapped(int page){
    pageController.jumpToPage(page);
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: Container(
          child: NavigationBar(
          animationDuration: Duration(milliseconds: 200),
          selectedIndex: _currentIndex,
          onDestinationSelected: navigationTapped,
          destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          HomeScreen(title: 'Home'),
          CartScreen(),
          ProfileScreen(),
          
        ],
      ),
    );  
  }
}

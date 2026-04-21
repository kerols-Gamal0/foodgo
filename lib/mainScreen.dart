import 'package:flutter/material.dart';
import 'package:foodgo/customerSupportScreen.dart';
import 'package:foodgo/home.dart';
import 'package:foodgo/profileScreen.dart';
import 'package:foodgo/customizeBurgerScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const ProfileScreen(),
    const CustomerSupportScreen(),
    const Center(child: Text("Favorites")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _pages),
      floatingActionButton: SizedBox(
        width: 60.0,
        height: 60.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomizeBurgerScreen(),
              ),
            );
          },
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 10,
          child: const Icon(Icons.add, color: Colors.white, size: 30.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xffEF2A39),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 0),
            _buildNavItem(Icons.person_outline, 1),
            const SizedBox(width: 40),
            _buildNavItem(Icons.notifications_none, 2),
            _buildNavItem(Icons.favorite_border, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.cyanAccent,
                shape: BoxShape.circle,
              ),
            )
          else
            const SizedBox(height: 8),
        ],
      ),
    );
  }
}

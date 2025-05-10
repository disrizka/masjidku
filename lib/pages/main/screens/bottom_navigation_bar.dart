import 'package:flutter/material.dart';
import 'package:masjidku/pages/donation/screens/donation_screen.dart';
import 'package:masjidku/pages/home/screens/home_screen.dart';
import 'package:masjidku/pages/main/screens/coba.dart';
import 'package:masjidku/utils/constant/app_color.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CobaScreen(),
    Placeholder(),
    DonationScreen(),
    Placeholder(),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<IconData> _icons = [
    Icons.home,
    Icons.brightness_4_outlined,
    Icons.search,
    Icons.volunteer_activism,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: AppColor.tertiaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () => _onBottomNavTapped(index),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration:
                    isSelected
                        ? BoxDecoration(
                          color: AppColor.primaryColor, // Warna bulat aktif
                          shape: BoxShape.circle,
                        )
                        : null,
                child: Icon(
                  _icons[index],
                  size: 28,
                  color: isSelected ? Colors.white : AppColor.primaryColor,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

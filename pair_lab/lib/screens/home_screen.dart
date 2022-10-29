import 'package:flutter/material.dart';
import 'package:pair_lab/widgets/widgets.dart';
import 'package:pair_lab/utility/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  void _navBottom(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = const [HomeTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    Color primaryColor = themeColor(auth.currentUser?.email);
    return Scaffold(
      backgroundColor: primaryColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          TextButton(
            child: const Text(
              "Sign-out",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              AuthService().signOut();
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        fixedColor: Colors.white,
        onTap: _navBottom,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}

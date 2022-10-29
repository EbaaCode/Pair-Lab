import 'package:flutter/material.dart';
import 'package:pair_lab/utility/utility.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int? role;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text("Admin"),
          value: 1,
          groupValue: role,
          onChanged: (value) {
            setState(() {
              role = value;
              AuthService().updateUserRole(auth.currentUser, value);
            });
          },
        ),
        RadioListTile(
          title: const Text("User"),
          value: 0,
          groupValue: role,
          onChanged: (value) {
            setState(() {
              role = value;
              AuthService().updateUserRole(auth.currentUser, value);
            });
          },
        ),
      ],
    );
  }
}

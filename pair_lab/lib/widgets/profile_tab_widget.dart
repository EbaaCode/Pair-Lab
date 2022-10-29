import 'package:flutter/material.dart';
import 'package:pair_lab/utility/utility.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: users.doc(auth.currentUser?.uid).get(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!['email']),
                  Text(snapshot.data!['uid']),
                  Text(
                      "Role: ${snapshot.data!['role'] == 0 ? "User" : "Admin"}"),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        )
      ],
    );
  }
}

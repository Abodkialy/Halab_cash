import 'package:flutter/material.dart';

class Addfriend extends StatelessWidget {
  final String userName;
  final String userHandle;

  const Addfriend({
    super.key,
    required this.userName,
    required this.userHandle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  userName,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  userHandle,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(width: 12),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/profile.png"),
            ),
          ],
        ),
      ),
    );
  }
}

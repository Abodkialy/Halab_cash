import 'package:flutter/material.dart';

class Appbar1 extends StatelessWidget implements PreferredSizeWidget {
  const Appbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:  Color(0xff125A46),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text(
                'علي ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '@ahmad123',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
           SizedBox(width: 10),
           CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('profile.png'),
          ),
        ],
      ),
      leading: Padding(
        padding:  EdgeInsets.all(8.0),
        child: ClipOval(
          child: Container(
            width: 32,
            height: 32,
            color: Color(0xffD9D9D9), 
            child:  Icon(
              Icons.notifications_none, 
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:halab_cash/componants/input.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF1E6C4C), width: 3.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('profile.png'),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E6C4C),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white, // لون أيقونة الكاميرا
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),

          Inputfiled(labelText: 'الاسم', hintText: 'اكتب اسمك'),
          Inputfiled(labelText: 'اسم المستخدم', hintText: 'اسم المستخدم'),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1E6C4C),
              ),
              child: Text('حفظ', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF2F5F9),
              ),
              child: Text('رجوع', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}

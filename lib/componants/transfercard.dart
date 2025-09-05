import 'package:flutter/material.dart';

class Transfercard extends StatefulWidget {
  final String userName;
  final String userHandle;
  final int amount;
  final String status;

  const Transfercard({
    super.key,
    required this.userName,
    required this.userHandle,
    required this.amount,
    required this.status,
  });

  @override
  State<Transfercard> createState() => _TransfercardState();
}

class _TransfercardState extends State<Transfercard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "+ ${widget.amount} \$",
                  style:  TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 4),
                Text(
                  widget.status,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.userName,
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.userHandle,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                 SizedBox(width: 12),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("profile.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Inputfiled extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool showSearchIcon;
  final TextEditingController? controller;
  final bool obscureText; 

  const Inputfiled({
    super.key,
    required this.labelText,
    required this.hintText,
    this.showSearchIcon = false,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset:  Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: TextField(
          
          controller: controller, 
          obscureText: obscureText,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            label: Align(
              alignment: Alignment.centerRight,
              child: Text(labelText),
            ),
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.white,
            hintStyle:  TextStyle(color: Colors.grey),
            prefixIcon:
                showSearchIcon
                    ?  Icon(Icons.search, color: Colors.grey)
                    : null,
          ),
        ),
      ),
    );
  }
}

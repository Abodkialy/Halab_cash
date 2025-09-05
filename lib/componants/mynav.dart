import 'package:flutter/material.dart';

class Mynav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const Mynav({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Container(
        height: 70,
        decoration:  BoxDecoration(
          color: Color(0xFF1E6C4C),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  onItemTapped(0);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person,
                      color: selectedIndex == 0 ? Colors.white : Colors.white54,
                      size: 30,
                    ),
                    Text(
                      "الملف الشخصي",
                      style: TextStyle(
                        color:
                            selectedIndex == 0 ? Colors.white : Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(width: 48),
            Expanded(
              child: InkWell(
                onTap: () {
                  onItemTapped(2);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: selectedIndex == 2 ? Colors.white : Colors.white54,
                      size: 30,
                    ),
                    Text(
                      "الرئيسية",
                      style: TextStyle(
                        color:
                            selectedIndex == 2 ? Colors.white : Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

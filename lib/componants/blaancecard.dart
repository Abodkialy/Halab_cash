import 'package:flutter/material.dart';

class Blaancecard extends StatefulWidget {
  const Blaancecard({super.key});

  @override
  State<Blaancecard> createState() => _BlaancecardState();
}

class _BlaancecardState extends State<Blaancecard> {
  String selectedCurrency = '\$';
  List<String> currencies = ['\$', '€', 'ل.س'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image:  DecorationImage(
          image: AssetImage('assets/bachground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  dropdownColor: Colors.white,
                  underline: SizedBox(),
                  style: TextStyle(fontWeight: FontWeight.bold),

                  onChanged: (value) {
                    setState(() {
                      selectedCurrency = value!;
                    });
                  },
                  items:
                      currencies.map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                ),

                SizedBox(width: 8),
                 Text(
                  'الرصيد',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),

            Text(
              '25 $selectedCurrency',
              style:  TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

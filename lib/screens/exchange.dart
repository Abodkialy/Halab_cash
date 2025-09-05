import 'package:flutter/material.dart';
import 'package:halab_cash/componants/appbar.dart';
import 'package:halab_cash/componants/table.dart';

class Exchange extends StatefulWidget {
  const Exchange({super.key});

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar1(),
      body: ListView(children: [SizedBox(height: 24), Tablehaed()]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:halab_cash/componants/appbar.dart';
import 'package:halab_cash/componants/calctable.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Appbar1(), body: Calctable());
  }
}

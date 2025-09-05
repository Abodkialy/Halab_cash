import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Calctable extends StatefulWidget {
  const Calctable({super.key});

  @override
  State<Calctable> createState() => _CalctableState();
}

class _CalctableState extends State<Calctable> {
  final TextEditingController _dollarAmountController = TextEditingController();

  double _tryBuyRate = 0.0;
  double _syrBuyRate = 0.0;
  double _eurBuyRate = 0.0;
  double _sarBuyRate = 0.0;

  double _calculatedTryAmount = 0.0;
  double _calculatedSyrAmount = 0.0;
  double _calculatedEurAmount = 0.0;
  double _calculatedSarAmount = 0.0;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _dollarAmountController.addListener(_calculateCurrencyValues);
    fetchCurrencyRates();
  }

  Future<void> fetchCurrencyRates() async {
    final url = Uri.parse('https://open.er-api.com/v6/latest/USD');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          _tryBuyRate = (data['rates']['TRY'] as num).toDouble();
          _syrBuyRate = (data['rates']['SYP'] as num).toDouble();
          _eurBuyRate = (data['rates']['EUR'] as num).toDouble();
          _sarBuyRate = (data['rates']['SAR'] as num).toDouble();
          _isLoading = false;
          _calculateCurrencyValues();
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        print('Failed to load rates');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching rates: $e');
    }
  }

  void _calculateCurrencyValues() {
    final String text = _dollarAmountController.text;
    double dollarAmount = 0.0;

    try {
      dollarAmount = double.parse(text);
    } catch (e) {
      dollarAmount = 0.0;
    }

    setState(() {
      _calculatedTryAmount = dollarAmount * _tryBuyRate;
      _calculatedSyrAmount = dollarAmount * _syrBuyRate;
      _calculatedEurAmount = dollarAmount * _eurBuyRate;
      _calculatedSarAmount = dollarAmount * _sarBuyRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF125A46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () {},
                  child: const Text(
                    '\$',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 24,
                  right: 24,
                  left: 12,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 126, 126, 126),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _dollarAmountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'ادخل المبلغ',
                      hintTextDirection: TextDirection.rtl,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 52,
          decoration: const BoxDecoration(color: Color(0xFF125A46)),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Expanded(
                child: Center(
                  child: Text(
                    'مبيع',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'شراء',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'العملة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        _buildCurrencyRow(
          currencyName: 'ليرة تركية',
          currencyCode: 'TRY',
          buyRate: _tryBuyRate,
          calculatedAmount: _calculatedTryAmount,
        ),
        const SizedBox(height: 20),

        _buildCurrencyRow(
          currencyName: 'ليرة سورية',
          currencyCode: 'SYP',
          buyRate: _syrBuyRate,
          calculatedAmount: _calculatedSyrAmount,
        ),
        const SizedBox(height: 20),

        _buildCurrencyRow(
          currencyName: 'يورو',
          currencyCode: 'EUR',
          buyRate: _eurBuyRate,
          calculatedAmount: _calculatedEurAmount,
        ),
        const SizedBox(height: 20),

        _buildCurrencyRow(
          currencyName: 'ريال سعودي',
          currencyCode: 'SAR',
          buyRate: _sarBuyRate,
          calculatedAmount: _calculatedSarAmount,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCurrencyRow({
    required String currencyName,
    required String currencyCode,
    required double buyRate,
    required double calculatedAmount,
  }) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(color: Color(0xFF125A46)),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  calculatedAmount.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buyRate.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currencyName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  currencyCode,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:halab_cash/componants/input.dart';
import 'package:halab_cash/screens/exchange.dart'; 

class Transferbouttons extends StatefulWidget {
  const Transferbouttons({super.key});

  @override
  State<Transferbouttons> createState() => _TransferbouttonsState();
}

class _TransferbouttonsState extends State<Transferbouttons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              icon: Icons.compare_arrows,
              label: 'تبديل',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exchange()),
                );
              },
            ),
            _buildActionButton(
              icon: Icons.call_received,
              label: 'الوارد',
              onPressed: () {
                _showReceiveHistorySheet(context);
              },
            ),
            _buildActionButton(
              icon: Icons.call_made,
              label: 'إرسال',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding:  EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 16,
                        bottom: 32,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           Text(
                            'الأصدقاء',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           SizedBox(height: 12),
                          Inputfiled(
                            labelText: '',
                            hintText: 'hintText',
                            showSearchIcon: true,
                          ),
                           SizedBox(height: 12),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _showTransferForm(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:  Color(
                                          0xFF1E6C4C,
                                        ),
                                      ),
                                      child:  Text(
                                        'إرسال',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                         CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                            'assets/profile.png', // Ensure this path is correct
                                          ),
                                        ),
                                         SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                             Text(
                                              'علي',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '@ali35',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showReceiveHistorySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding:  EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text(
                  'الوارد',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                 SizedBox(height: 12),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 0.4, 
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                 CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    'assets/profile.png',
                                  ),
                                ),
                                 SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(
                                      'علي',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '@ali38',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                 Text(
                                  '+ 20 \$',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  '2025/1/1 - 12:00',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                 SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xffF2F5F9),
                    ),
                    child:  Text('إغلاق'),
                  ),
                ),
              ],
            ),
          ),
        );
    
    
    
      },
    );
  }

  void _showTransferForm(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController messageController = TextEditingController();
    String selectedCurrency = 'دولار اميريكي';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Directionality(
          // لضبط اتجاه النصوص من اليمين لليسار
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(
              top: 24,
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'إرسال ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                     SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'أدخل المبلغ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(width: 8),
                        InkWell(
                          onTap: () async {
                            final currency = await showModalBottomSheet<String>(
                              context: context,
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                              ),
                              builder: (context) {
                                return Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      ListTile(
                                        leading:  Icon(
                                          Icons.currency_lira,
                                          color: Colors.blue,
                                        ),
                                        title:  Text('ليرة سورية'),
                                        onTap:
                                            () => Navigator.pop(context, 'ل.س'),
                                      ),
                                      ListTile(
                                        leading:  Icon(
                                          Icons.attach_money,
                                          color: Colors.green,
                                        ),
                                        title:  Text('دولار أمريكي'),
                                        onTap:
                                            () => Navigator.pop(context, '\$'),
                                      ),
                                      ListTile(
                                        leading:  Icon(
                                          Icons.euro,
                                          color: Colors.blueAccent,
                                        ),
                                        title:  Text('يورو'),
                                        onTap:
                                            () => Navigator.pop(context, '€'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                            if (currency != null) {
                              setState(() {
                                selectedCurrency = currency;
                              });
                            }
                          },
                          child: Container(
                            padding:  EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(selectedCurrency),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(height: 16),
                    TextField(
                      controller: messageController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'أدخل رسالة ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                     SizedBox(height: 24),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              print(
                                'تم إرسال مبلغ: ${amountController.text} $selectedCurrency',
                              );
                              print('الرسالة: ${messageController.text}');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  Color(0xFF1E6C4C),
                            ),
                            child:  Text(
                              'إرسال',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                         SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  Color(0xffF2F5F9),
                            ),
                            child:  Text(
                              'رجوع',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape:  CircleBorder(),
            padding:  EdgeInsets.all(20),
            backgroundColor:  Color(0xFFEDEDED),
            elevation: 0,
          ),
          child: Icon(icon, color: Colors.black),
        ),
         SizedBox(height: 8),
        Text(
          label,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}

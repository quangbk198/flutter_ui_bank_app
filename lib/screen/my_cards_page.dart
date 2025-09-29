import 'package:bank_app_4/widgets/amount_limit_item.dart';
import 'package:bank_app_4/widgets/back_icon.dart';
import 'package:flutter/material.dart';

import '../model/transaction_data.dart';
import '../utils/app_shared_preference.dart';
import '../utils/constant.dart';
import '../widgets/card_info.dart';
import '../widgets/transaction_item.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});

  @override
  State<MyCardsPage> createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  String fullName = "";
  late final List<TransactionData> listTransaction;

  @override
  void initState() {
    super.initState();
    _initLocalData();
    listTransaction = _genTransactionList();
  }

  List<TransactionData> _genTransactionList() {
    List<TransactionData> listData = [];
    listData.add(
      TransactionData('assets/ic_spotify.svg', 'Spotify', 'Music', 199),
    );
    listData.add(
      TransactionData(
        'assets/ic_apple.svg',
        'Apple Store',
        'Entertainment',
        -233,
      ),
    );
    listData.add(
      TransactionData('assets/ic_grocery.svg', 'Shopping', 'Buy', -25),
    );
    return listData;
  }

  Future<void> _initLocalData() async {
    final String name = await AppSharedPreferences.getString(
      Constants.KEY_FULL_NAME,
    );
    setState(() {
      fullName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackIcon(onClick: () {}),
                const Text(
                  'My Cards',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E1E2D),
                  ),
                ),
                BackIcon(onClick: () {}, icon: Icons.add),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    key: const ValueKey("card"),
                    child: CardInfo(
                      cardNumber: "4562 1122 4595 7852",
                      ownerCard: fullName,
                      expiryDate: "06/2030",
                      cvv: "8899",
                    ),
                  ),
                  SliverList(
                    key: const ValueKey("list transaction"),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final TransactionData data = listTransaction[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TransactionItem(
                          icon: data.icon,
                          title: data.title,
                          description: data.description,
                          price: data.price,
                        ),
                      );
                    }, childCount: listTransaction.length),
                  ),
                  const SliverToBoxAdapter(
                    key: ValueKey("title"),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monthly spending limit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1E1E2D),
                            ),
                          ),
                          SizedBox(height: 16),
                          AmountLimitItem(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

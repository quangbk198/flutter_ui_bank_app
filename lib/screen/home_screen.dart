import 'package:bank_app_4/utils/app_shared_preference.dart';
import 'package:bank_app_4/utils/constant.dart';
import 'package:bank_app_4/widgets/back_icon.dart';
import 'package:bank_app_4/widgets/card_info.dart';
import 'package:bank_app_4/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/transaction_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = "";
  late final List<TransactionData> listTransaction;

  @override
  void initState() {
    super.initState();
    _initLocalData();
    listTransaction = _genTransactionList();
  }

  Future<void> _initLocalData() async {
    final String name = await AppSharedPreferences.getString(
      Constants.KEY_FULL_NAME,
    );
    setState(() {
      fullName = name;
    });
  }

  List<TransactionData> _genTransactionList() {
    List<TransactionData> listData = [];
    listData.add(
      TransactionData('assets/ic_spotify.svg', 'Spotify', 'Music', 199),
    );
    listData.add(
      TransactionData('assets/ic_apple.svg', 'Apple Store', 'Entertainment', -233),
    );
    listData.add(
      TransactionData('assets/ic_grocery.svg', 'Shopping', 'Buy', -25),
    );
    listData.add(
      TransactionData('assets/ic_spotify.svg', 'Spotify', 'Music', 199),
    );
    listData.add(
      TransactionData('assets/ic_apple.svg', 'Apple Store', 'Entertainment', -233),
    );
    listData.add(
      TransactionData('assets/ic_grocery.svg', 'Shopping', 'Buy', -25),
    );
    listData.add(
      TransactionData('assets/ic_spotify.svg', 'Spotify', 'Music', 199),
    );
    listData.add(
      TransactionData('assets/ic_apple.svg', 'Apple Store', 'Entertainment', -233),
    );
    listData.add(
      TransactionData('assets/ic_grocery.svg', 'Shopping', 'Buy', -25),
    );
    return listData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            key: const ValueKey("header info"),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome back,',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF7E848D),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          fullName,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1E1E2D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BackIcon(onClick: () {}, icon: Icons.search),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: const ValueKey("card"),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
              child: Column(
                children: [
                  CardInfo(
                    cardNumber: "4562 1122 4595 7852",
                    ownerCard: fullName,
                    expiryDate: "06/2030",
                    cvv: "8899",
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryIcon(
                        title: "Sent",
                        onClick: () {},
                        iconData: Icons.arrow_upward,
                      ),
                      CategoryIcon(
                        title: "Receive",
                        onClick: () {},
                        iconData: Icons.arrow_downward,
                      ),
                      CategoryIcon(
                        title: "Loan",
                        onClick: () {},
                        iconSvg: "assets/ic_loan.svg",
                      ),
                      CategoryIcon(
                        title: "Topup",
                        onClick: () {},
                        iconSvg: "assets/ic_top_up.svg",
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transaction',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1E1E2D),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {},
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF0066FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final TransactionData data = listTransaction[index];
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TransactionItem(
                  icon: data.icon,
                  title: data.title,
                  description: data.description,
                  price: data.price,
                ),
              );
            }, childCount: listTransaction.length),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final IconData? iconData;
  final String? iconSvg;

  const CategoryIcon({
    super.key,
    required this.onClick,
    this.iconData,
    this.iconSvg,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(50),
          child: Ink(
            width: 54,
            height: 54,
            decoration: const BoxDecoration(
              color: Color(0xFFF4F4F4),
              shape: BoxShape.circle,
            ),
            child: (iconData != null)
                ? Icon(iconData, color: const Color(0xFF1E1E2D), size: 24)
                : ((iconSvg != null)
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: SvgPicture.asset(iconSvg!),
                        )
                      : null),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: const TextStyle(color: Color(0xFF1E1E2D), fontSize: 13),
        ),
      ],
    );
  }
}

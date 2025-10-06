import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/transaction_data.dart';
import '../widgets/back_icon.dart';
import '../widgets/transaction_item.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {

  late final List<TransactionData> listTransaction;

  @override
  void initState() {
    super.initState();
    listTransaction = _genTransactionList();
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
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackIcon(onClick: () {}),
                  const Text(
                    'Statistics',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1E1E2D),
                    ),
                  ),
                  BackIcon(onClick: () {}, icon: Icons.notifications_none),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const Text(
                            'Current Balance',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFA2A2A7)
                            ),
                          ),
                          const SizedBox(height: 8,),
                          const Text(
                            '\$8,545.00',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1E1E2D)
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1.1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 18,
                                left: 12,
                                top: 24,
                                bottom: 12,
                              ),
                              child: LineChart(_lineChartData()),
                            ),
                          ),
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
                          const SizedBox(height: 16,)
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final TransactionData data = listTransaction[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: TransactionItem(
                            icon: data.icon,
                            title: data.title,
                            description: data.description,
                            price: data.price,
                          ),
                        );
                      }, childCount: listTransaction.length),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      color: Color(0xFFA2A2A7)
    );
    String text = switch (value.toInt()) {
      0 => 'Jan',
      1 => 'Feb',
      2 => 'Mar',
      3 => 'Apr',
      4 => 'May',
      5 => 'Jun',
      6 => 'Jul',
      7 => 'Aug',
      8 => 'Sep',
      9 => 'Oct',
      10 => 'Nov',
      11 => 'Dec',
      _ => '',
    };
    return Text(text, style: style);
  }

  LineChartData _lineChartData() {
    return LineChartData(
      gridData: FlGridData(
        drawHorizontalLine: false,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xFFF4F4F4),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        )
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(2, 5),
            FlSpot(3, 3.1),
            FlSpot(4, 4),
            FlSpot(5, 3),
            FlSpot(6, 3),
            FlSpot(7, 3),
            FlSpot(8, 3),
            FlSpot(9, 3),
            FlSpot(10, 3),
            FlSpot(11, 6),
          ],
          isCurved: true,
          barWidth: 5,
          color: const Color(0xFF0066FF),
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: const Color(0x2295BCF6),
          ),
        ),
      ],
      borderData: FlBorderData(
        show: false,
      ),
    );
  }
}

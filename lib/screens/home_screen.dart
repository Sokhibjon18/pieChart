import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/customs/pie_chart_painter.dart';
import 'package:flutter_application_1/consts.dart';
import 'package:flutter_application_1/models/card_model.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<CardModel> cardsList = [
    CardModel(name: '2131', amout: 231, color: Colors.amber),
    CardModel(name: '3342', amout: 187, color: Colors.red),
    CardModel(name: '3342', amout: 400, color: Colors.green),
    CardModel(name: '3211', amout: 700, color: Colors.blue),
  ];

  double strokeWidth = 40;
  late final double chartSize = MediaQuery.of(context).size.width * 0.7;
  late final double spaceBetweenCards =
      MediaQuery.of(context).size.width * 0.075;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [
            backgroundImage(),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    toolBar(),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 420,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: CustomPaint(
                              size: Size(chartSize, chartSize),
                              painter: PieChartPainter(cardsList,
                                  chartWidth: strokeWidth),
                            ),
                          ),
                          Positioned(
                            top: chartSize / 2 + strokeWidth + 48,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: mainCards(
                                    'Repayment\nCalculator',
                                    'Lorem ipsum dolor sit amet. consectetur adipiscing elit,',
                                    'assets/icon1.png',
                                  ),
                                ),
                                SizedBox(
                                  width: spaceBetweenCards,
                                ),
                                Expanded(
                                  child: mainCards(
                                    '£${cardsList[0].amout.toStringAsFixed(2)}',
                                    'Lorem ipsum dolor sit amet. consectetur adipiscing elit,',
                                    'assets/icon3.png',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 16, left: 8, right: 8, bottom: 16),
                      child: Stack(
                        children: const [
                          Center(
                            child: Text(
                              'My card',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Icon(Icons.add_rounded),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cardsList.length,
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemBuilder: (_, index) => listItems(index),
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

  Widget backgroundImage() => Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: dashboardHeader,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(64),
            bottomRight: Radius.circular(64),
          ),
        ),
      );

  Widget toolBar() => Row(
        children: [
          GestureDetector(
            onTap: (() {
              setState(() {
                cardsList = [
                  CardModel.mocked(),
                  CardModel.mocked(),
                  CardModel.mocked(),
                  CardModel.mocked(),
                ];
              });
            }),
            child: const Icon(Icons.autorenew_rounded),
          ),
          const Expanded(
            child: Text(
              'Hello Chris',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Stack(
            children: const [
              Icon(
                Icons.circle,
                size: 48,
                color: dashboardTertiary,
              ),
              Positioned(
                right: 2,
                top: 2,
                child: Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 16,
                ),
              )
            ],
          ),
        ],
      );

  Widget mainCards(String title, String desc, String assetPath) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 4,
            )
          ],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage(assetPath),
              width: 90,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 10,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      );

  Widget listItems(int index) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!.withOpacity(0.1),
              blurRadius: 8,
            )
          ],
        ),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey[200],
                child: Icon(
                  Icons.credit_card,
                  size: 32,
                  color: cardsList[index].color,
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '**** ${cardsList[index].name}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '£${cardsList[index].amout.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18,
                            color: dashboardSecondary,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Stack(children: [
                      Container(
                        color: dashboardTertiary,
                        width: double.infinity,
                        height: 9,
                      ),
                      Container(
                        color: dashboardSecondary,
                        width: MediaQuery.of(context).size.width /
                            (Random().nextInt(4) + 3),
                        height: 9,
                      ),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}

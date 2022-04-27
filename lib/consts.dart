import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/onboarding_model.dart';

//measurments
const double spaceBetweenCharts = pi / 90;
const Radius cornerRadius = Radius.circular(4);

//colors
const Color dashboardBkg = Color(0xffF8F8F8);
const dashboardHeader = Color(0xff44D0D0);
const Color dashboardSecondary = Color(0xff1E3A47);
const Color dashboardTertiary = Color(0xffFCF8BB);

//textSpan
const TextSpan totalBalanceText = TextSpan(
  text: 'Total balance',
  style: TextStyle(
    color: dashboardSecondary,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 0.2,
  ),
);

//textSpan
const TextSpan makeAPaymentText = TextSpan(
  text: 'Make a payment →',
  style: TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 0.2,
  ),
);

const List<OnboardingModel> onboardingList = [
  OnboardingModel(
    'Save even more',
    'Switch all your balances to Cardeo and you could save thousands every year.',
    'assets/icon3.png',
    Color.fromARGB(255, 14, 183, 183),
  ),
  OnboardingModel(
    'Repay, your way',
    'Set a personalised repayment target and we\'ll help you stick to it.',
    'assets/icon1.png',
    Color(0xffFBF066),
  ),
  OnboardingModel(
    'Personalised plans',
    'We\'ll figure out the perfect payment plan for you - based on your personal financial situation',
    'assets/icon2.png',
    Color(0xffFCF8BB),
  ),
];

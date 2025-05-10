import 'package:flutter/material.dart';
import 'package:masjidku/utils/constant/app_color.dart';
import 'package:masjidku/utils/constant/app_font.dart';

class SelectDonateScreen extends StatefulWidget {
  const SelectDonateScreen({super.key});

  @override
  State<SelectDonateScreen> createState() => _SelectDonateScreenState();
}

class _SelectDonateScreenState extends State<SelectDonateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          "Pilihan Donasi",
          style: PoppinsTextStyle.bold.copyWith(fontSize: 21),
        ),
        leading: const BackButton(),
      ),
    );
  }
}
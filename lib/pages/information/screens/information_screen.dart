import 'package:flutter/material.dart';
import 'package:masjidku/utils/constant/app_color.dart';
import 'package:masjidku/utils/constant/app_font.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final List<String> categories = [
    'Informasi',
    'Kajian Rutin',
    'Spesial Acara',
    'Agenda Lain',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          "Informasi",
          style: PoppinsTextStyle.bold.copyWith(fontSize: 21),
        ),
        leading: const BackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Filter kategori horizontal scroll
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(categories.length, (index) {
                final isSelected = index == selectedIndex;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColor.primaryColor),
                      ),
                      child: Text(
                        categories[index],
                        style: PoppinsTextStyle.medium.copyWith(
                          fontSize: 14,
                          color: isSelected
                              ? Colors.white
                              : AppColor.textPrimaryDark,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Builder(
                builder: (_) {
                  switch (selectedIndex) {
                    case 0:
                      return const Center(
                        child: Text("konten Informasi Umum"),
                      );
                    case 1:
                      return const Center(
                        child: Text("konten Kajian Rutin"),
                      );
                    case 2:
                      return const Center(
                        child: Text("konten Spesial Acara"),
                      );
                    case 3:
                      return const Center(
                        child: Text("konten Agenda Lain"),
                      );
                    default:
                      return const Center(
                        child: Text("Kategori tidak ditemukan"),
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

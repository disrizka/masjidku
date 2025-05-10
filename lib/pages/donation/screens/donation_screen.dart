import 'package:flutter/material.dart';
import 'package:masjidku/pages/donation/screens/donation_details_screen.dart';
import 'package:masjidku/utils/constant/app_color.dart';
import 'package:masjidku/utils/constant/app_font.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final List<int> donationOptions = [10000, 20000, 50000, 100000];
  int? selectedAmount;
  final TextEditingController customAmountController = TextEditingController();

  void selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
      customAmountController.clear();
    });
  }

  void onCustomAmountChanged(String value) {
    setState(() {
      selectedAmount = int.tryParse(value.replaceAll('.', ''));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          "Donasi",
          style: PoppinsTextStyle.bold.copyWith(fontSize: 21),
        ),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pilih Nominal Donasi",
                style: PoppinsTextStyle.semiBold.copyWith(
                  fontSize: 15,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              ...donationOptions.map((amount) {
                final isSelected = selectedAmount == amount;
                return GestureDetector(
                  onTap: () => selectAmount(amount),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? AppColor.secondaryColor
                              : AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rp. ${amount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                          style: PoppinsTextStyle.regular.copyWith(
                            fontSize: 15,
                            color: AppColor.textPrimaryDark,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 8),
              Text(
                "Masukan Nominal Donasi",
                style: PoppinsTextStyle.semiBold.copyWith(
                  fontSize: 15,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: customAmountController,
                keyboardType: TextInputType.number,
                onChanged: onCustomAmountChanged,
                decoration: InputDecoration(
                  hintText: "Rp.",
                  hintStyle: PoppinsTextStyle.regular.copyWith(
                    fontSize: 15,
                    color: AppColor.textPrimaryDark,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.successColor,
                  foregroundColor: AppColor.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size.fromHeight(36),
                ),
                onPressed: () {
                  // Navigasi ke riwayat donasi
                },
                icon: const Icon(Icons.history, color: Colors.white),
                label: Text(
                  "Lihat riwayat donasi saya",
                  style: PoppinsTextStyle.medium.copyWith(fontSize: 13),
                ),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed:
                    selectedAmount != null
                        ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DonationDetailsScreen(),
                            ),
                          );
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: AppColor.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size.fromHeight(48),
                ),
                child: Text(
                  "Lanjut",
                  style: PoppinsTextStyle.medium.copyWith(fontSize: 13),
                ),
              ),
              const SizedBox(height: 24), // ruang bawah
            ],
          ),
        ),
      ),
    );
  }
}

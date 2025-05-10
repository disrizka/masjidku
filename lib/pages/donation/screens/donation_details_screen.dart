import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masjidku/utils/constant/app_color.dart';
import 'package:masjidku/utils/constant/app_font.dart';

class DonationDetailsScreen extends StatefulWidget {
  const DonationDetailsScreen({super.key});

  @override
  State<DonationDetailsScreen> createState() => _DonationDetailsScreenState();
}

class _DonationDetailsScreenState extends State<DonationDetailsScreen> {
  final List<Map<String, dynamic>> donationDetails = [
    {"no ": 1, "desc": "Nominal Donasi"},
    {"no ": 2, "desc": "Biaya Transaksi"},
    {"no ": 3, "desc": "Dukungan perkembangan aplikasi"},
  ];

  final List<TextEditingController> controllers = [];
  int total = 0;

  final currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp. ',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < donationDetails.length; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void updateTotal() {
    int newTotal = 0;
    for (final controller in controllers) {
      final raw = controller.text.replaceAll(RegExp(r'[^0-9]'), '');
      final value = int.tryParse(raw) ?? 0;
      newTotal += value;
    }
    setState(() {
      total = newTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          "Detail Donasi",
          style: PoppinsTextStyle.bold.copyWith(fontSize: 21),
        ),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Donasi Detail",
              style: PoppinsTextStyle.semiBold.copyWith(
                fontSize: 15,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Berikut adalah rincian donasi detail",
              style: PoppinsTextStyle.regular.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(50),
                  1: FlexColumnWidth(),
                  2: IntrinsicColumnWidth(),
                },
                border: TableBorder.symmetric(
                  inside: const BorderSide(color: Colors.grey),
                  outside: BorderSide(color: Colors.grey[300]!),
                ),
                children: [
                  const TableRow(
                    decoration: BoxDecoration(color: Color(0xfff2f2f2)),
                    children: [
                      TableCellWidget(text: "No ", isHeader: true),
                      TableCellWidget(text: "Deskripsi", isHeader: true),
                      TableCellWidget(text: "Rincian", isHeader: true, alignRight: true),
                    ],
                  ),
                  ...donationDetails.asMap().entries.map((entry) {
                    final i = entry.key;
                    final item = entry.value;

                    return TableRow(
                      decoration: const BoxDecoration(color: Colors.white),
                      children: [
                        TableCellWidget(text: item['no'].toString()),
                        TableCellWidget(text: item['desc']),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextField(
                            controller: controllers[i],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.right,
                            onChanged: (value) => updateTotal(),
                            decoration: const InputDecoration(
                              hintText: "Rp. 0",
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            style: PoppinsTextStyle.regular.copyWith(fontSize: 13),
                          ),
                        ),
                      ],
                    );
                  }),
                  TableRow(
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                    ),
                    children: [
                      const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "Total Transfer",
                          style: PoppinsTextStyle.semiBold.copyWith(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          currencyFormatter.format(total),
                          style: PoppinsTextStyle.semiBold.copyWith(color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "* Biaya transaksi digunakan untuk biaya pertransaksi.\n\n"
              "* Dukungan perkembangan aplikasi digunakan untuk perkembangan dakwah.",
              style: PoppinsTextStyle.regular.copyWith(fontSize: 13),
            ),
            const SizedBox(height: 130),
            ElevatedButton(
              onPressed: () {
                // lanjut ke pembayaran
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size.fromHeight(48),
              ),
              child: Text("Lanjut", style: PoppinsTextStyle.bold.copyWith(fontSize: 13),),
            ),
          ],
        ),
      ),
    );
  }
}

class TableCellWidget extends StatelessWidget {
  final String text;
  final bool isHeader;
  final bool alignRight;

  const TableCellWidget({
    super.key,
    required this.text,
    this.isHeader = false,
    this.alignRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        textAlign: alignRight ? TextAlign.right : TextAlign.left,
        style: isHeader
            ? PoppinsTextStyle.semiBold.copyWith(fontSize: 13)
            : PoppinsTextStyle.regular.copyWith(fontSize: 13),
      ),
    );
  }
}

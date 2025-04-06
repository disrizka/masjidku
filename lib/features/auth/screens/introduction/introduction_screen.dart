import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:masjidku/features/auth/screens/login/login_screen.dart';
import 'package:masjidku/utils/constant/app_color.dart';
import 'package:masjidku/utils/constant/app_font.dart';
import 'package:masjidku/utils/constant/app_image.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: AppColor.secondaryColor,
      key: introKey,
      pages: [
        PageViewModel(
          titleWidget: SizedBox.shrink(),
          bodyWidget: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 90),
                Image.asset(AppImage.intro1),
                SizedBox(height: 40),
                Text(
                  "Mulai Perjalanan Menuntut Ilmu",
                  textAlign: TextAlign.left,
                  style: plusJakartaTextStyle.semiBold.copyWith(
                    fontSize: 22,
                    color: AppColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Komitmen kami memudahkan kaum muslimin untuk belajar agama dan bahasa Arab dimanapun.",
                  textAlign: TextAlign.center,
                  style: plusJakartaTextStyle.medium.copyWith(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 145),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Lanjut',
                      style: plusJakartaTextStyle.medium.copyWith(
                        fontSize: 16,
                        color: AppColor.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          titleWidget: SizedBox.shrink(),
          bodyWidget: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 90),
                Image.asset(AppImage.intro2),
                // SizedBox(height: 10),
                Text(
                  "Perjalanan Akan Terasa Menyenangkan",
                  textAlign: TextAlign.center,
                  style: plusJakartaTextStyle.semiBold.copyWith(
                    fontSize: 22,
                    color: AppColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Kami menyediakan sistem belajar yang menarik agar peserta merasa senang.",
                  textAlign: TextAlign.center,
                  style: plusJakartaTextStyle.medium.copyWith(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 90),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Lanjut',
                      style: plusJakartaTextStyle.medium.copyWith(
                        fontSize: 16,
                        color: AppColor.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          titleWidget: SizedBox.shrink(),
          bodyWidget: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 90),
                Image.asset(AppImage.intro3),
                // SizedBox(height: 10),
                Text(
                  "Belajar Islam dan Bahasa Arab Sesuai Keinginanmu",
                  textAlign: TextAlign.center,
                  style: plusJakartaTextStyle.semiBold.copyWith(
                    fontSize: 22,
                    color: AppColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Mau belajar dari dasar ? Ingin memperdalam berbagai cabang ilmu islam seperti Fiqh Syafi’i ? atau mau memilih belajar tingkat lanjut ? ",
                  textAlign: TextAlign.center,
                  style: plusJakartaTextStyle.medium.copyWith(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 36),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Lanjut',
                      style: plusJakartaTextStyle.medium.copyWith(
                        fontSize: 16,
                        color: AppColor.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      showNextButton: false,
      showDoneButton: true,
      done: Text(
        "Done",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColor.primaryColor,
        ),
      ),
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      dotsDecorator: DotsDecorator(
        activeColor: AppColor.primaryColor,
        color: AppColor.primaryColor.withOpacity(0.3),
        size: const Size(10.0, 10.0),
        activeSize: const Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

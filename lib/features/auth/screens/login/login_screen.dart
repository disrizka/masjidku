import 'package:flutter/material.dart';
import 'package:masjidku/features/auth/screens/register/register_screen.dart';
import 'package:masjidku/features/home/bottom_navigation_bar.dart';
import 'package:masjidku/utils/constant/app_color.dart';
import 'package:masjidku/utils/constant/app_font.dart';

class MasjidKuApp extends StatefulWidget {
  const MasjidKuApp({super.key});

  @override
  State<MasjidKuApp> createState() => _MasjidKuAppState();
}

class _MasjidKuAppState extends State<MasjidKuApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.mosque, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        'Masjid Ku',
                        style: plusJakartaTextStyle.bold.copyWith(
                          fontSize: 25,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert, color: Colors.black),
                ],
              ),
              const SizedBox(height: 50),

              Text(
                'Ahlan Wa Sahlan !',
                style: plusJakartaTextStyle.semiBold.copyWith(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Alhamdulillah bisa bertemu kembali, Login untuk melanjutkan pembelajaran',
                style: plusJakartaTextStyle.medium.copyWith(
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 32),

              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.visibility_off),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              // Lupa password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Lupa password ?',
                    style: TextStyle(
                      color: Color.fromARGB(136, 0, 0, 0),
                      fontFamily: "PlusJakartaSans",
                    ),
                  ),
                ),
              ),
              const Spacer(),

              // Daftar
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun ? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => BottomBar()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: plusJakartaTextStyle.bold.copyWith(
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
    );
  }
}

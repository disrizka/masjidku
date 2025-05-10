import 'package:flutter/material.dart';
import 'package:masjidku/pages/auth/screens/login/screens/login_screen.dart';
import 'package:masjidku/utils/constant/app_color.dart';
import 'package:masjidku/utils/constant/app_font.dart';
import 'package:masjidku/utils/constant/app_image.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImage.logo,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Masjid Ku',
                        style: PoppinsTextStyle.bold.copyWith(
                          fontSize: 25,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert, color: Colors.black),
                ],
              ),
              SizedBox(height: 50),

              // Judul
              Text(
                'Daftar dengan Email',
                style: PoppinsTextStyle.semiBold.copyWith(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Untuk proses lebih lanjut mohon\nlengkapi data berikut',
                style: PoppinsTextStyle.medium.copyWith(
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 24),

              // Input Fields
              buildTextField(Icons.person_outline, 'Nama Pengguna'),
              SizedBox(height: 16),
              buildTextField(Icons.email_outlined, 'Email'),
              SizedBox(height: 16),
              buildTextField(Icons.phone_outlined, 'Phone number'),
              SizedBox(height: 16),
              buildPasswordField('Password', true),
              SizedBox(height: 16),
              buildPasswordField('Konfirmasi Password', false),
              SizedBox(height: 150),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah memiliki akun ? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Registrasi',
                    style: PoppinsTextStyle.bold.copyWith(
                      fontSize: 16,
                      color: AppColor.backgroundColor,
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

  Widget buildTextField(IconData icon, String hint) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget buildPasswordField(String hint, bool isFirst) {
    return TextField(
      obscureText: isFirst ? _obscurePassword : _obscureConfirmPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline),
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(
            (isFirst ? _obscurePassword : _obscureConfirmPassword)
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              if (isFirst) {
                _obscurePassword = !_obscurePassword;
              } else {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              }
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

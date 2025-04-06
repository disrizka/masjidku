import 'package:flutter/material.dart';
import 'package:masjidku/utils/constant/app_color.dart';
import 'package:masjidku/utils/constant/app_font.dart';

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
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo dan Nama Aplikasi
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
              SizedBox(height: 50),

              // Judul
              Text(
                'Daftar dengan Email',
                style: plusJakartaTextStyle.semiBold.copyWith(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Untuk proses lebih lanjut mohon\nlengkapi data berikut',
                style: plusJakartaTextStyle.medium.copyWith(
                  fontSize: 18,
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF92883A),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Registrasi',
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

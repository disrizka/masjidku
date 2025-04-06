import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:masjidku/utils/constant/app_carosel.dart';
import 'package:masjidku/utils/constant/app_font.dart';
import 'package:masjidku/utils/constant/app_icon.dart';

// Ganti ini dengan path ke ikon

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarousel = 0;

  final List<String> carouselImages = [
    AppCarosel.carosel1,
    AppCarosel.carosel2,
    AppCarosel.carosel3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.mosque, color: Colors.amber),
            SizedBox(width: 8),
            Text(
              'Masjid Ku',
              style: plusJakartaTextStyle.bold.copyWith(
                fontSize: 25,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.notifications_none_rounded, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Greeting Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF95862E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Assalamualaikum, Sdr Budi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '“ Sesungguhnya ilmu adalah rasa takut kepada Allah ta’ala “.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.military_tech, color: Colors.yellow, size: 20),
                      SizedBox(width: 4),
                      Text('Pemula', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 16),
                      Icon(
                        Icons.workspace_premium,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text('22 Lencana', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),

            // Carousel Slider
            CarouselSlider.builder(
              itemCount: carouselImages.length,
              itemBuilder: (context, index, realIdx) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    carouselImages[index],
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                height: 160,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() => _currentCarousel = index);
                },
              ),
            ),

            SizedBox(height: 20),

            // Carousel Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  carouselImages.asMap().entries.map((entry) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentCarousel == entry.key
                                ? const Color(0xFF95862E)
                                : Colors.grey.shade300,
                      ),
                    );
                  }).toList(),
            ),

            // Grid Menu
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
                children: [
                  _MenuItem(
                    iconPath: AppIcon.icon1,
                    label: 'Pendaftaran',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PendaftaranScreen()),
                      // );
                    },
                  ),
                  _MenuItem(
                    iconPath: AppIcon.icon2,
                    label: 'Masjidku',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PendaftaranScreen()),
                      // );
                    },
                  ),
                  _MenuItem(
                    iconPath: AppIcon.icon3,
                    label: 'Artikel',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PendaftaranScreen()),
                      // );
                    },
                  ),
                  _MenuItem(
                    iconPath: AppIcon.icon4,
                    label: 'Website',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PendaftaranScreen()),
                      // );
                    },
                  ),
                  _MenuItem(
                    iconPath: AppIcon.icon5,
                    label: 'Sertifikat',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PendaftaranScreen()),
                      // );
                    },
                  ),
                  _MenuItem(
                    iconPath: AppIcon.icon6,
                    label: 'Donasi',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PendaftaranScreen()),
                      // );
                    },
                  ),
                  _MenuItem(
                    iconPath: AppIcon.icon7,
                    label: 'Aktivitas\nSaya',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PendaftaranScreen()),
                      // );
                    },
                  ),
                  _MenuItem(
                    iconPath: AppIcon.icon8,
                    label: 'Lainnya',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PendaftaranScreen()),
                      // );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const _MenuItem({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: 50, height: 50),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}

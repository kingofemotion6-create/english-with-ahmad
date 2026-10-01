import 'package:flutter/material.dart';

void main() {
  runApp(const EnglishWithAhmadApp());
}

class EnglishWithAhmadApp extends StatelessWidget {
  const EnglishWithAhmadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'English With Ahmad',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Roboto',
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const MonthsScreen(),
    const ImageCardsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'خانه'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'دوره ۳ ماهه'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'عکس‌های آموزشی'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'پروفایل'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English With Ahmad'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Colors.indigo, Colors.blueAccent]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('یادگیری حرفه‌ای انگلیسی', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('دوره جامع ۳ ماهه به همراه ویدیو و عکس‌های آموزشی روزانه.', style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('ویدیوهای آموزشی جدید', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 220,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        ),
                        child: const Center(child: Icon(Icons.play_circle_fill, size: 40, color: Colors.indigo)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ویدیوی روزانه شماره ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MonthsScreen extends StatelessWidget {
  const MonthsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> months = [
      {'title': 'ماه اول: پایه‌ای و مکالمات روزمره', 'days': 30, 'color': Colors.blue},
      {'title': 'ماه دوم: گرامر کاربردی و اصطلاحات', 'days': 30, 'color': Colors.indigo},
      {'title': 'ماه سوم: مکالمه پیشرفته و تسلط کامل', 'days': 30, 'color': Colors.deepPurple},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('دوره جامع ۳ ماهه (۹۰ روزه)'), centerTitle: true),
      body: ListView.builder(
        itemCount: months.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final month = months[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: month['color'].withOpacity(0.2),
                child: Text('${index + 1}', style: TextStyle(fontWeight: FontWeight.bold, color: month['color'])),
              ),
              title: Text(month['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text('شامل ${month['days']} روز درس و تمرین'),
              children: List.generate(30, (dayIndex) {
                final dayNum = (index * 30) + dayIndex + 1;
                return ListTile(
                  title: Text('روز $dayNum: آموزش اصطلاحات و واژگان'),
                  subtitle: const Text('متن آموزشی + تمرین'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () {},
                );
              }),
            ),
          );
        },
      ),
    );
  }
}

class ImageCardsScreen extends StatelessWidget {
  const ImageCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('عکس‌های آموزشی و انگیزشی'), centerTitle: true),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 6)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Center(
                    child: Icon(Icons.image, size: 50, color: Colors.indigo.shade300),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('عکس آموزشی شماره ${index + 1}: نکات کلیدی گرامر', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      const Text('توضیحات و نکات مهم یادگیری این تصویر برای مرور سریع.', style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('پروفایل کاربری'), centerTitle: true),
      body: const Center(
        child: Text('تنظیمات و پیشرفت یادگیری شما', style: TextStyle(fontSize: 15, color: Colors.grey)),
      ),
    );
  }
}

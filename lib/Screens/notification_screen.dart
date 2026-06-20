import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  // Mode sederhana: feed notifikasi statis ditampilkan berurutan
  final List<Map<String, String>> _notifications = const [
    {
      'title': 'Berita baru tersedia',
      'subtitle': 'Cek headline terbaru hari ini di Home',
      'time': 'Baru saja',
    },
    {
      'title': 'Update aplikasi',
      'subtitle': 'SpaceNews Core kini lebih cepat dan stabil',
      'time': '1 jam lalu',
    },
    {
      'title': 'Pengingat',
      'subtitle': 'Jangan lupa cek artikel favorit kamu',
      'time': 'Kemarin',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        backgroundColor: const Color(0xFFEF4444),
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _notifications.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = _notifications[index];
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFEF4444),
              child: Icon(Icons.notifications, color: Colors.white),
            ),
            title: Text(item['title']!),
            subtitle: Text(item['subtitle']!),
            trailing: Text(item['time']!,
                style: const TextStyle(fontSize: 11, color: Colors.grey)),
          );
        },
      ),
    );
  }
}

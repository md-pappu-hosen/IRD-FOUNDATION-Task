import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../home_controller.dart';

class CustomDrawer extends StatelessWidget {
  final items = [
    {'icon': Icons.home_outlined, 'title': 'Home'},
    {'icon': Icons.person_outline, 'title': 'Profile'},
    {'icon': Icons.location_on_outlined, 'title': 'Nearby'},
    {'icon': Icons.bookmark_outline, 'title': 'Bookmark'},
    {'icon': Icons.notifications_outlined, 'title': 'Notification'},
    {'icon': Icons.chat_bubble_outline, 'title': 'Message'},
    {'icon': Icons.settings_outlined, 'title': 'Setting'},
    {'icon': Icons.help_outline, 'title': 'Help'},
    {'icon': Icons.logout, 'title': 'Logout'},
  ];

  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();

    return Container(
      width: MediaQuery.of(context).size.width * 1.00,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kDrawerEnd, kDrawerEnd],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.only(top: 40),
            children: items.map((item) {
              final selected = c.selectedDrawerItem.value == item['title'];
              return ListTile(
                leading: Icon(
                  item['icon'] as IconData,
                  color: selected ? kDrawerStart : Colors.white,
                ),
                title: Text(
                  item['title'] as String,
                  style: TextStyle(
                    color: selected ? kDrawerStart : Colors.white,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                tileColor: selected ? Colors.white : Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                onTap: () {
                  c.selectedDrawerItem.value = item['title'] as String;
                  c.toggleDrawer();
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

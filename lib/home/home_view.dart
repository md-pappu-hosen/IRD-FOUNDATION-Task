import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import 'home_controller.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/near_card.dart';
import 'widgets/list_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: kDrawerStart,
      body: Stack(
        children: [
          // Drawer
          // Stack এর মধ্যে
          // 1. Drawer (যা ব্যাকগ্রাউন্ডে স্থির থাকবে)
          CustomDrawer(),

          // 2. Main content with Drawer animation
          Obx(() {
            final slideX = controller.isDrawerOpen.value
                ? MediaQuery.of(context).size.width * 0.75
                : 0.0;
            final scale = controller.isDrawerOpen.value ? 0.8 : 1.0;
            final borderRadius = controller.isDrawerOpen.value ? 30.0 : 0.0;

            return Transform(
              transform: Matrix4.identity()
                ..translate(slideX)
                ..scale(scale),

              alignment: Alignment.centerLeft,

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: GestureDetector(
                  onTap: controller.isDrawerOpen.value
                      ? controller.toggleDrawer
                      : null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      body: _buildHomeContent(controller),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHomeContent(HomeController c) {
    return SafeArea(
      child: SingleChildScrollView(
        // <-- scrollable fixes RenderFlex errors
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Location', style: TextStyle(color: Colors.grey)),
                      Row(
                        // <-- Removed Expanded
                        children: [
                          Text(
                            'Jakarta',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.notifications_outlined),
                      ),
                      const Positioned(
                        right: 8,
                        top: 8,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // SEARCH + FILTER (Drawer Button)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search),
                          SizedBox(width: 8),
                          Text(
                            "Search address, near you",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: c.toggleDrawer,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kPrimaryBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.tune, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // CATEGORY
            SizedBox(
              height: 40,
              child: Obx(
                () => ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: List.generate(c.categories.length, (i) {
                    final selected = c.selectedCategory.value == i;
                    return GestureDetector(
                      onTap: () => c.selectedCategory.value = i,
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: selected ? kPrimaryBlue : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          c.categories[i],
                          style: TextStyle(
                            color: selected ? Colors.white : Colors.grey[700],
                            fontWeight: selected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // "Near from you"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Near from you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 260,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  NearCard(
                    title: '',
                    address: '',
                    distance: '',
                    image:
                        'assets/images/dreamsville.png', // <-- fix asset name
                  ),
                  NearCard(
                    title: '',
                    address: '',
                    distance: '',
                    image: 'assets/images/dreamsville.png',
                  ),
                ],
              ),
            ),

            // "Best for you"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "Best for you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            Column(
              // <-- removed Expanded
              children: const [
                ListItem(
                  title: 'Orchard House',
                  price: 'Rp. 2.500.000.000 / Year',
                  beds: 6,
                  baths: 4,
                  image: 'assets/images/image1.png',
                ),
                ListItem(
                  title: 'The Hollies House',
                  price: 'Rp. 2.000.000.000 / Year',
                  beds: 5,
                  baths: 2,
                  image: 'assets/images/image1.png',
                ),
                ListItem(
                  title: 'The Hollies House',
                  price: 'Rp. 2.000.000.000 / Year',
                  beds: 5,
                  baths: 2,
                  image: 'assets/images/image1.png',
                ),
                ListItem(
                  title: 'The Hollies House',
                  price: 'Rp. 2.000.000.000 / Year',
                  beds: 5,
                  baths: 2,
                  image: 'assets/images/image1.png',
                ),
              ],
            ),
            const SizedBox(height: 20), // optional padding at bottom
          ],
        ),
      ),
    );
  }
}

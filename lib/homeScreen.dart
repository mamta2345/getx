// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vqcodes_assignment/screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(AchivementController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Startup-UK",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        // foregroundColor: Colors.white,
        backgroundColor: Colors.brown.shade900,
      ),
      body: Obx(
        () =>
            controller.displayedAchievements.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  itemCount: controller.displayedAchievements.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final item = controller.displayedAchievements[index];

                      return InkWell(
                        onTap: () {
                          controller.markAsSeen(item);
                          Get.dialog(
                            Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 10,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    Text(
                                      item.titleKey ?? 'Friend Level',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    // Description
                                    Text(
                                      item.descriptionKey ??
                                          'You reached a new level!',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    // Close button
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: Get.back,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Close',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5EDFD), // background color
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x1A000000),
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0x553D76F3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // NEW Badge if item is new
                              if (item.isNew == true)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'NEW',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              else
                                const SizedBox(
                                  width: 45,
                                ), // Maintain layout even if NEW is not shown
                              // Image or fallback
                              SizedBox(
                                height: 62,
                                width: 62,
                                child: Image.asset(
                                  'assets/images/google_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Title
                              Expanded(
                                child: Text(
                                  item.titleKey!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // Favorite Icon
                              IconButton(
                                icon: Icon(
                                  item.isFavorite == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      item.isFavorite == true
                                          ? Colors.pink
                                          : null,
                                ),
                                onPressed:
                                    () => controller.toggleFavorite(item),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                ),
      ),
    );
  }
}

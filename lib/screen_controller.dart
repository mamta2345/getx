// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vqcodes_assignment/api_data_model.dart';
import 'package:vqcodes_assignment/repository.dart';

class AchivementController extends GetxController {
  final AchievementsRepository _repo = AchievementsRepository();
  final allAchievements = <UKStartUp_Model>[].obs; // master list
  final displayedAchievements = <UKStartUp_Model>[].obs; // what UI shows
  bool hasRecentlyErrored = false;

  @override
  void onInit() {
    hasRecentlyErrored = false;
    fetchBookingData();
    super.onInit();
  }

  void fetchBookingData() async {
    try {
      final data = await _repo.fetchAchievementsApi();
      allAchievements.assignAll(data);

      // Initialize isNew and isFavorite if null
      for (var item in allAchievements) {
        item.isNew ??= true;
        item.isFavorite ??= false;
      }

      _updateDisplayedList();

      hasRecentlyErrored = false;
    } on SocketException {
      allAchievements.clear();
      displayedAchievements.clear();
      if (!hasRecentlyErrored) {
        Get.snackbar(
          "No Internet",
          "Please check your connection.",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
        );
        hasRecentlyErrored = true;
      }
    } catch (e) {
      if (!hasRecentlyErrored) {
        Get.snackbar(
          "Unable to Load Data",
          e.toString(),
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
        );
        hasRecentlyErrored = true;
      }
    }
  }

  // This updates the displayedAchievements list with favorites on top
  void _updateDisplayedList() {
    final favs =
        allAchievements.where((item) => item.isFavorite == true).toList();
    final nonFavs =
        allAchievements.where((item) => item.isFavorite != true).toList();

    displayedAchievements.assignAll([...favs, ...nonFavs]);
  }

  // Called when user taps to mark favorite
  void toggleFavorite(UKStartUp_Model item) {
    item.isFavorite = !(item.isFavorite ?? false);
    _updateDisplayedList();
  }

  // Called when user taps on item to remove "New" banner
  void markAsSeen(UKStartUp_Model item) {
    item.isNew = false;
    displayedAchievements.refresh();
  }
}

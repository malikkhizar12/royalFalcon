import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'explore_now_controller.dart';

class ExploreMostVisitedController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var tabBarViewHeight = 123.h.obs;
  var mainContainerHeight = 380.h.obs;

  final List<MostVisitedImageModel> images = [
    MostVisitedImageModel(imageUrl: 'images/Explore_now.png'),
    MostVisitedImageModel(imageUrl: 'images/dubai_safari.jpg'),
    MostVisitedImageModel(imageUrl: 'images/home_background.jpg'),
    MostVisitedImageModel(imageUrl: 'images/Explore_now.png'),
    MostVisitedImageModel(imageUrl: 'images/dubai_safari.jpg'),
    MostVisitedImageModel(imageUrl: 'images/home_background.jpg'),
    MostVisitedImageModel(imageUrl: 'images/Explore_now.png'),
    MostVisitedImageModel(imageUrl: 'images/dubai_safari.jpg'),
    MostVisitedImageModel(imageUrl: 'images/home_background.jpg'),
    MostVisitedImageModel(imageUrl: 'images/Explore_now.png'),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      tabBarViewHeight.value = tabController.index == 1 ? 220.h : 123.h;
      mainContainerHeight.value = tabController.index == 1 ? 460.h : 380.h;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class MostVisitedImageModel {
  final String imageUrl;
  MostVisitedImageModel({required this.imageUrl});
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracking/features/auth/presentation/screens/login/login_view.dart';
import 'package:habit_tracking/features/starting%20page/presentation/starting_view.dart';

class OnboardingController extends GetxController{
  static OnboardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  late var currentPageIndex = 0.obs;



  //update Current Index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value =index;

  // jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value= index;
    pageController.jumpTo(index);
  }

  //update current index and jump to next page.
  void nextPage() {
    if( currentPageIndex.value ==2){
      Get.to( const StartingView());
    }else{
      int page = currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }

  // update current index and jump to the last page.
  void skipPage() {
    currentPageIndex.value =2;
    pageController.jumpToPage(2);
  }


}
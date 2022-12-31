import 'package:aisthetic_task/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreenController extends GetxController {
  final List<TextSliderWidget> texts = [
    TextSliderWidget(
      'Choose your jewel box',
      'Choose a jewel box that speaks to you. Select our signature Unsaid jewel box, or customize your gift with an artwork.',
      key: UniqueKey(),
    ),
    TextSliderWidget(
      'Write your card',
      'Explore cards with custom poems commissioned from our favourite writers. Customize yours with a personal note.',
      key: UniqueKey(),
    ),
    TextSliderWidget(
      'Choose your image',
      'Select an image of your choice and add to your selected artwork. We make sure that it appears as clear as possible',
      key: UniqueKey(),
    ),
    TextSliderWidget(
      'Share and spread',
      'Tell your friends and family about us and share the word. We wish to make our customers around the world super happy.',
      key: UniqueKey(),
    ),
  ];
  var index = 0.obs;

  void newIndex(int ind) {
    index.value = ind;
  }
}

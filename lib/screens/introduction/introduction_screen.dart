import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:learning_app/widgets/app_circle_button.dart';

/// Introduction Screen: Introduction in a few sentences
class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, size: 65.0, color: Colors.amber),
              Gap(40.0),
              AutoSizeText(
                  "This is a study app. You can use it as you want. If you understand how tis works, you would be able to scale it. With this you will master firebase backend and flutter frontend."),
              Gap(40.0),
              AppCircleButton(
                child: Icon(Icons.arrow_forward, size: 35.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

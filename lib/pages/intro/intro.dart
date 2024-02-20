import 'dart:math';

import 'package:edulang/controllers/IntroController.dart';
import 'package:edulang/models/IntroModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edulang/pages/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatelessWidget {
  final IntroController controller = Get.put(IntroController());

  // This is your list of intro screens
  final List<IntroModel> screens = [
    IntroModel(
      title: "Find a Major that fits your Passion !",
      img: "assets/images/default.png",
      text:
          "Consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue",
      bg: Color.fromARGB(255, 105, 192, 255),
      button: Color.fromARGB(255, 105, 192, 255),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(253, 4, 148, 192),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(253, 4, 148, 192),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
          itemCount: screens.length,
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            controller.currentIndex.value = index;
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: -10 * (pi / 180),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Find a Major\n',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'that fits your\n',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'Passion !',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow, // Warna kuning
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width:
                        150, // Sesuaikan dengan ukuran yang diinginkan untuk lingkaran
                    height:
                        150, // Sesuaikan dengan ukuran yang diinginkan untuk lingkaran
                    child: ClipOval(
                      child: Image.asset(
                        screens[index].img,
                        width: 150,
                        height: 150,
                        fit: BoxFit
                            .cover, // Memastikan gambar memenuhi lingkaran
                      ),
                    ),
                  ),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.skipIntro(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(45)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Start started",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

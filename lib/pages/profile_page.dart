import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color: Colors.white);
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset("assets/images/bg.png", fit: BoxFit.fill),
        ),
        SafeArea(
          child: Column(
            children: [
              Row(
                spacing: 12,
                children: [
                  CircleAvatar(
                    radius: 48,
                    foregroundImage: AssetImage(
                      "assets/images/profile_steve.png",
                    ),
                  ),
                  Text(
                    "Steve",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  width: Get.width - 50,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  "assets/images/movies/tiny_rex_big_day.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/images/qr-code.png",
                                  width: 150,
                                ),
                              ),
                              Align(
                                alignment: Alignment(.8, -.8),
                                child: Image.asset("assets/images/share.png"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),

                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        height: Get.height / 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dino In Space",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("When", style: textStyle),
                                  Text("tomorrow", style: textStyle),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Time", style: textStyle),
                                  Text("5:00 PM", style: textStyle),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Tickets", style: textStyle),
                                  Text(
                                    "2 adults, 2 students",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Seats", style: textStyle),
                                  Text("IA, 2A, 2B, 2C", style: textStyle),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

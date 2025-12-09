import 'package:dino_kino/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Get.find<MovieData>();
    var textStyle = TextStyle(color: Colors.white);
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.asset("assets/images/bg.png", fit: BoxFit.fill),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 62,
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
                if (prov.overviews.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: prov.overviews.length,
                      itemBuilder: (context, index) {
                        return OverViewCard(
                          title: prov.overviews[index].title,
                          textStyle: textStyle,
                          when: prov.overviews[index].day,
                          time: prov.overviews[index].time,
                          tickets: prov.overviews[index].tickets,
                          seats: prov.overviews[index].seats,
                        );
                      },
                    ),
                  ),
                if (prov.overviews.isEmpty)
                  Center(child: Text("no movies planned")),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OverViewCard extends StatelessWidget {
  const OverViewCard({
    super.key,
    required this.textStyle,
    required this.title,
    required this.when,
    required this.time,
    required this.tickets,
    required this.seats,
  });
  final String title;
  final String when;
  final String time;
  final String tickets;
  final String seats;

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width - 50,
      height: Get.height - 200,
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
                    child: Image.asset("assets/images/qr-code.png", width: 140),
                  ),
                  Align(
                    alignment: Alignment(.9, -.9),
                    child: InkWell(
                      onTap: () {
                        SharePlus.instance.share(
                          ShareParams(
                            text:
                                "I made a reservation for $title $time with the seats $seats",
                          ),
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/share.png",
                            width: 24,
                          ),
                        ),
                      ),
                    ),
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
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("When", style: textStyle),
                      Text(when, style: textStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Time", style: textStyle),
                      Text(time, style: textStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tickets", style: textStyle),
                      Text(tickets, style: textStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Seats", style: textStyle),
                      Text(seats, style: textStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

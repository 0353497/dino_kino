import 'package:dino_kino/pages/funnal_page.dart';
import 'package:dino_kino/pages/homepage.dart';
import 'package:dino_kino/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, this.dino});
  final dynamic dino;

  @override
  Widget build(BuildContext context) {
    final int rating = dino["rating"] as int;

    return Scaffold(
      key: Key("$dino"),
      body: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  Homepage(),
                  Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            "assets/images/bg.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        spacing: 16,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            child: Stack(
                              children: [
                                Image.asset("assets/${dino["image"]}"),
                                Positioned(
                                  top: 50,
                                  right: 10,
                                  child: IconButton(
                                    onPressed: () => Get.back(),
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              spacing: 12,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${dino["title"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: rating > 1
                                          ? Color(0xffb5e200)
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: rating > 2
                                          ? Color(0xffb5e200)
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: rating > 3
                                          ? Color(0xffb5e200)
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: rating > 4
                                          ? Color(0xffb5e200)
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: rating > 5
                                          ? Color(0xffb5e200)
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                                Text(
                                  "${dino["description"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 32),
                                Center(
                                  child: SizedBox(
                                    width: Get.width - 50,
                                    height: 65,
                                    child: TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Color(0xffb5e200),
                                        ),
                                        foregroundColor: WidgetStatePropertyAll(
                                          Colors.black,
                                        ),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  16,
                                                ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.to(
                                          () =>
                                              FunnalPage(title: dino["title"]),
                                        );
                                      },
                                      child: Text(
                                        "Buy Tickets",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ProfilePage(),
                ],
              ),
            ),
            TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Color(0xffb5e200),
              unselectedLabelColor: Color(0xffb5e200).withAlpha(100),
              labelColor: Color(0xffb5e200),
              tabs: [
                Tab(icon: Icon(Icons.house)),
                Tab(icon: Icon(Icons.movie_creation)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// DefaultTabController(
//           length: 3,
//           child: Column(
//             children: [
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     Homepage(),
//                     Moviespage(),
//                     Moviespage()],
//                 ),
//               ),
//               TabBar(
//                 tabs: [
//                   Tab(icon: Icon(Icons.house)),
//                   Tab(icon: Icon(Icons.movie_creation)),
//                   Tab(icon: Icon(Icons.person)),
//                 ],
//               ),
//             ],
//           ),
//         ),
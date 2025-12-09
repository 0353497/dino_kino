import 'package:dino_kino/pages/movie_detail_page.dart';
import 'package:dino_kino/pages/moviespage.dart';
import 'package:dino_kino/utils/json_reader.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/images/logo_small.png", width: 200),
          Image.asset("assets/images/placeholder.png"),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 12.0),
                  child: Text(
                    "Now in the cinema",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: JsonReader.readJson("assets/json/movies.json"),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final movies = asyncSnapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return InkWell(
                            onTap: () {
                              Get.to(() => MovieDetailPage(dino: movie));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DinoCard(dino: movie),
                                SizedBox(width: 12),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dino_kino/pages/movie_detail_page.dart';
import 'package:dino_kino/utils/json_reader.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Moviespage extends StatefulWidget {
  const Moviespage({super.key});

  @override
  State<Moviespage> createState() => _MoviespageState();
}

class _MoviespageState extends State<Moviespage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset("assets/images/bg.png", fit: BoxFit.fill),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All movies",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              FutureBuilder(
                future: JsonReader.readJson("assets/json/movies.json"),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final movies = asyncSnapshot.data!;
                  return Expanded(
                    child: GridView.count(
                      childAspectRatio: 1 / 1.8,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      crossAxisCount: 2,
                      children: [
                        for (var movie in movies) DinoCard(dino: movie),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DinoCard extends StatelessWidget {
  const DinoCard({super.key, this.dino});
  final dynamic dino;

  @override
  Widget build(BuildContext context) {
    final int rating = dino["rating"] as int;
    return InkWell(
      onTap: () {
        print("dfa");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailPage(dino: dino)),
        );
        Get.to(() => MovieDetailPage(dino: dino));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black,
        ),
        width: Get.width / 2 - 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 12,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Image.asset(
                    "assets/${dino["image"]}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "${dino["title"]}",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: rating > 1 ? Color(0xffb5e200) : Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    color: rating > 2 ? Color(0xffb5e200) : Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    color: rating > 3 ? Color(0xffb5e200) : Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    color: rating > 4 ? Color(0xffb5e200) : Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    color: rating > 5 ? Color(0xffb5e200) : Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

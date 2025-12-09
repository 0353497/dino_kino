import 'package:get/get.dart';

class MovieData extends GetxController {
  final List<OverView> overviews = <OverView>[].obs;

  void addoverView(OverView view) {
    overviews.add(view);
  }
}

class OverView {
  final String title;
  final String day;
  final String time;
  final String tickets;
  final String seats;

  OverView({
    required this.title,
    required this.day,
    required this.time,
    required this.tickets,
    required this.seats,
  });
}

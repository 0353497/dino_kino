import 'package:dino_kino/main.dart';
import 'package:dino_kino/utils/json_reader.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FunnalPage extends StatefulWidget {
  const FunnalPage({super.key});

  @override
  State<FunnalPage> createState() => _FunnalPageState();
}

class _FunnalPageState extends State<FunnalPage> {
  int currentStep = 1;
  int adults = 2;
  int students = 0;
  int childs = 0;
  String timeSelected = "";
  String isTommorow = "";
  List<String> selectedSeats = [];
  get remaining => adults + childs + students - selectedSeats.length;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color: Colors.white);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/bg.png", fit: BoxFit.fill),
          ),

          if (currentStep <= 1) dateTimeSelectPaget(),
          if (currentStep == 2) totalSelector(),
          if (currentStep == 3) seatSelection(),
          if (currentStep > 3)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      "Step $currentStep/4",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "OverView",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: double.maxFinite,
                      height: Get.height / 2,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("When", style: textStyle),
                                Text(isTommorow, style: textStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Time", style: textStyle),
                                Text(timeSelected, style: textStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tickets", style: textStyle),
                                Text(
                                  "$adults adults, $students students",
                                  style: textStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Seats", style: textStyle),
                                Text("IA, 2A, 2B, 2C", style: textStyle),
                              ],
                            ),
                            Divider(color: Colors.grey),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("To pay at the cinama"),
                                Text(
                                  "€ 44",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      currentStep--;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(() => MainViewPage());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xffb5e200),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Confirm Tickets",
                                      textAlign: TextAlign.center,
                                    ),
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
              ),
            ),
        ],
      ),
    );
  }

  SafeArea seatSelection() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
            Text("Step $currentStep/4", style: TextStyle(color: Colors.white)),
            Text("Seats", style: TextStyle(color: Colors.white, fontSize: 32)),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("screen", style: TextStyle(color: Colors.white)),
                    Container(
                      height: 4,
                      width: Get.width - 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 5,
                        children: [
                          SizedBox(),
                          Center(
                            child: Text(
                              "A",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "B",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "D",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),

                          Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),

                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("1A") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("1A");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("1A");
                                });
                              }
                            },
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset("assets/images/seat_taken.png"),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset("assets/images/seat_taken.png"),
                          ),
                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("1D") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("1D");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("1D");
                                });
                              }
                            },
                          ),

                          Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("2A") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("2A");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("2A");
                                });
                              }
                            },
                          ),
                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("2B") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("2B");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("2B");
                                });
                              }
                            },
                          ),
                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("2C") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("2C");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("2C");
                                });
                              }
                            },
                          ),
                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("2D") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("2D");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("2D");
                                });
                              }
                            },
                          ),

                          Center(
                            child: Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("3A") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("3A");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("3A");
                                });
                              }
                            },
                          ),
                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("3B") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("3B");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("3B");
                                });
                              }
                            },
                          ),
                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("3C") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("3C");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("3C");
                                });
                              }
                            },
                          ),
                          SeatSelector(
                            onTap: () {
                              if (selectedSeats.contains("3D") &&
                                  remaining >= 1) {
                                setState(() {
                                  selectedSeats.remove("3D");
                                });
                              } else {
                                setState(() {
                                  selectedSeats.add("3D");
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: Column(
                        children: [
                          Text(
                            "${(adults + childs + students) - selectedSeats.length} seats to select",
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                          Text(
                            "Make sure the seats are connected",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              currentStep--;
                            });
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentStep++;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              "To overview",
                              textAlign: TextAlign.center,
                            ),
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
      ),
    );
  }

  SafeArea totalSelector() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
            Text("Step $currentStep/4", style: TextStyle(color: Colors.white)),
            Text(
              "Tickets",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            Text("Maximum of 4", style: TextStyle(color: Colors.white)),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Adult",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "Agus 15 and up",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (adults < 1) return;

                              setState(() {
                                adults--;
                              });
                            },
                            icon: Icon(Icons.minimize, color: Colors.white),
                          ),
                          Text(
                            "$adults",
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              if ((adults + students + childs) >= 4) return;
                              setState(() {
                                adults++;
                              });
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                          Text("€12", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Student",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "with valid student ID",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (students < 1) return;

                              setState(() {
                                students--;
                              });
                            },
                            icon: Icon(Icons.minimize, color: Colors.white),
                          ),
                          Text(
                            "$students",
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              if ((adults + students + childs) >= 4) return;

                              setState(() {
                                students++;
                              });
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                          Text("€10", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Child",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "children < 15",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (childs < 1) return;
                              setState(() {
                                childs--;
                              });
                            },
                            icon: Icon(Icons.minimize, color: Colors.white),
                          ),
                          Text(
                            "$childs",
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              if ((adults + students + childs) >= 4) return;

                              setState(() {
                                childs++;
                              });
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                          Text("€8", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                      Text(
                        "€ ${adults * 12 + students * 10 + childs * 8}",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              currentStep--;
                            });
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if ((adults + students + childs) <= 1) return;
                        setState(() {
                          currentStep++;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: (adults + students + childs) >= 1
                                ? Color(0xffb5e200)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              "Pick your seats",
                              textAlign: TextAlign.center,
                            ),
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
      ),
    );
  }

  SafeArea dateTimeSelectPaget() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
            Text("Step $currentStep/4", style: TextStyle(color: Colors.white)),
            Text(
              "Day and time",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            Expanded(
              child: FutureBuilder(
                future: JsonReader.readJson("assets/json/showtimes.json"),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final times = asyncSnapshot.data!;

                  return DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.white,
                          indicatorColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(text: "Today"),
                            Tab(text: "Tomorrow"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  for (var time in times)
                                    if (time["day"] == "today")
                                      TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                time["available"]
                                                    ? Colors.black
                                                    : Colors.black45,
                                              ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isTommorow = time["day"];
                                            timeSelected = time["time"];
                                          });
                                        },
                                        child: Text(
                                          "${time["time"]}",
                                          style: TextStyle(
                                            color: time["available"]
                                                ? Colors.white
                                                : Colors.black,
                                            decoration: time["available"]
                                                ? null
                                                : TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  for (var time in times)
                                    if (time["day"] == "tomorrow")
                                      TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                time["available"]
                                                    ? Colors.black
                                                    : Colors.black45,
                                              ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isTommorow = time["day"];
                                            timeSelected = time["time"];
                                          });
                                        },
                                        child: Text(
                                          "${time["time"]}",
                                          style: TextStyle(
                                            color: time["available"]
                                                ? Colors.white
                                                : Colors.black,
                                            decoration: time["available"]
                                                ? null
                                                : TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              currentStep--;
                            });
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (timeSelected.isEmpty) return;
                        setState(() {
                          currentStep++;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: timeSelected.isEmpty
                                ? Colors.grey
                                : Color(0xffb5e200),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              "Select Tickets",
                              textAlign: TextAlign.center,
                            ),
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
      ),
    );
  }
}

class SeatSelector extends StatefulWidget {
  const SeatSelector({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<SeatSelector> createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Image.asset(
        "assets/images/seat_open.png",
        color: isSelected ? Color(0xffb5e200) : null,
      ),
    );
  }
}

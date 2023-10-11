import 'package:flutter/material.dart';

class HairConditionEdit extends StatelessWidget {
  const HairConditionEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '모발 상태 수정',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: null,
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(children: [
          HairStatus(),
        ]),
      ),
    );
  }
}

class HairStatus extends StatelessWidget {
  const HairStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HairStatusLength(),
        ScalpStatus(),
        HairThickness(),
        HairWave(),
      ],
    );
  }
}

class HairStatusLength extends StatefulWidget {
  const HairStatusLength({Key? key}) : super(key: key);

  @override
  _HairStatusLengthState createState() => _HairStatusLengthState();
}

class _HairStatusLengthState extends State<HairStatusLength> {
  int selectedImageIndex = -1;

  void handleImageClick(int index) {
    setState(() {
      selectedImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "모발 기장",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 4; i++)
                GestureDetector(
                  onTap: () {
                    handleImageClick(i);
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == i
                                ? const Color(0xFF633581)
                                : Colors.transparent,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Image.asset(
                          "assets/image/hairLength0${i + 1}.png",
                          width: 75,
                          height: 75,
                        ),
                      ),
                      Text(
                        [
                          "턱선 위",
                          "턱선 아래",
                          "어깨선 아래",
                          "가슴선 아래",
                        ][i],
                        style: TextStyle(
                          fontSize: 16,
                          height: 2,
                          color: selectedImageIndex == i
                              ? const Color(0xFF633581)
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class ScalpStatus extends StatefulWidget {
  const ScalpStatus({Key? key}) : super(key: key);

  @override
  _ScalpStatusState createState() => _ScalpStatusState();
}

class _ScalpStatusState extends State<ScalpStatus> {
  String selectedStatus = "";

  void handleStatusClick(String status) {
    setState(() {
      selectedStatus = status;
    });
  }

  Widget buildTextWithStyle(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        handleStatusClick(text);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 5, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? const Color(0xFF633581) : Colors.grey.shade300,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "두피 상태",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Divider(),
          ),
          Wrap(
            children: [
              buildTextWithStyle("중성", selectedStatus == "중성"),
              buildTextWithStyle("지성", selectedStatus == "지성"),
              buildTextWithStyle("건성", selectedStatus == "건성"),
              buildTextWithStyle("지루성(비듬)", selectedStatus == "지루성(비듬)"),
              buildTextWithStyle("민감성", selectedStatus == "민감성"),
              buildTextWithStyle("모름", selectedStatus == "모름"),
            ],
          ),
        ],
      ),
    );
  }
}

class HairThickness extends StatefulWidget {
  const HairThickness({Key? key}) : super(key: key);

  @override
  _HairThicknessState createState() => _HairThicknessState();
}

class _HairThicknessState extends State<HairThickness> {
  int selectedImageIndex = -1;

  void handleImageClick(int index) {
    setState(() {
      selectedImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "모발 굵기",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 3; i++)
                GestureDetector(
                  onTap: () {
                    handleImageClick(i);
                  },
                  child: Container(
                    width: 120,
                    height: 90,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectedImageIndex == i
                            ? const Color(0xFF633581)
                            : Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/image/hairThickness0${i + 1}.png",
                          width: 75,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          [
                            "가는모발",
                            "중간모발",
                            "두꺼운모발",
                          ][i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            height: 2.3,
                            color: selectedImageIndex == i
                                ? const Color(0xFF633581)
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class HairWave extends StatefulWidget {
  const HairWave({Key? key}) : super(key: key);

  @override
  _HairWaveState createState() => _HairWaveState();
}

class _HairWaveState extends State<HairWave> {
  int selectedImageIndex = -1;

  void handleImageClick(int index) {
    setState(() {
      selectedImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "곱슬 정도",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 3; i++)
                GestureDetector(
                  onTap: () {
                    handleImageClick(i);
                  },
                  child: Container(
                    width: 120,
                    height: 90,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectedImageIndex == i
                            ? const Color(0xFF633581)
                            : Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/image/hairWave0${i + 1}.png",
                          width: 75,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          [
                            "직모",
                            "반곱슬",
                            "곱슬",
                          ][i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            height: 2.3,
                            color: selectedImageIndex == i
                                ? const Color(0xFF633581)
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

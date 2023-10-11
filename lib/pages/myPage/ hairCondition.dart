import 'package:beauty/pages/myPage/HairConditionEdit.dart';
import 'package:flutter/material.dart';

class HairCondition extends StatelessWidget {
  const HairCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '모발 상태',
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
          HairConditionInfo(),
          HairConditionEditBt(),
        ]),
      ),
    );
  }
}

class HairConditionInfo extends StatelessWidget {
  const HairConditionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "모발 정보",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "모발기장",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "턱선 위 기장",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "손상정도",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "손상",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "모발타입",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "생머리",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "모발두께",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "보통",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "두피상태",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "중성",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "시술사항",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "탈색 머리",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "특이사항",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "없음",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "마지막 업데이트 2023.12.12",
                  style: TextStyle(
                    color: Colors.grey,
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

class HairConditionEditBt extends StatelessWidget {
  const HairConditionEditBt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HairConditionEdit(),
            ),
          );
        },
        child: Container(
            width: 400,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF633581),
            ),
            child: const Center(
                child: Text(
              "수정",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ))),
      ),
    );
  }
}

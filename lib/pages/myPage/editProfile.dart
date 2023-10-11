import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '프로필 수정',
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
          ProfileImage(),
          ProfileInfo(),
        ]),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset(
                  "assets/image/profileUser.png",
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/image/camerapng.png",
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const Text(
              "임수진",
              style: TextStyle(
                height: 2,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key});

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  Color maleButtonColor = Colors.grey;
  Color femaleButtonColor = Colors.grey;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void selectMale() {
    setState(() {
      maleButtonColor = const Color(0xFF633581);
      femaleButtonColor = Colors.grey;
    });
  }

  void selectFemale() {
    setState(() {
      femaleButtonColor = const Color(0xFF633581);
      maleButtonColor = Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "회원 정보",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "이름",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: "이름을 등록해 주세요.",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                ))
              ],
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "연락처",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: "번호를 등록해 주세요.",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                ))
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                const SizedBox(
                  width: 80,
                  child: Text(
                    "성별",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: selectMale,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(0, 30),
                    backgroundColor: maleButtonColor,
                  ),
                  child: const Text(
                    "남성",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: selectFemale,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(0, 30),
                    backgroundColor: femaleButtonColor,
                  ),
                  child: const Text(
                    "여성",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                const SizedBox(
                  width: 80,
                  child: Text(
                    "생년월일",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Text(
                    selectedDate != null
                        ? "${selectedDate!.year}년 ${selectedDate!.month}월 ${selectedDate!.day}일"
                        : "선택",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "이메일",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: "이메일을 입력해 주세요.",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                ))
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "로그아웃",
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "탈퇴",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
                width: 400,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF633581),
                ),
                child: const Center(
                    child: Text(
                  "저장",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ))),
          ),
        ],
      ),
    );
  }
}

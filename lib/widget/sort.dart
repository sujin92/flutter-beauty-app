import 'package:flutter/material.dart';

class SortList extends StatefulWidget {
  const SortList({Key? key}) : super(key: key);

  @override
  _ListSortState createState() => _ListSortState();
}

class _ListSortState extends State<SortList> {
  String _selectedSortOption = "거리순";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButton<String>(
        value: _selectedSortOption,
        items: <String>['거리순', '찜순', '리뷰순'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedSortOption = newValue!;
          });
        },
        underline: Container(),
      ),
    );
  }
}

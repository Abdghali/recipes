import 'package:flutter/material.dart';

class CustomButtonsToggle extends StatefulWidget {
  final List<String> tags;
  final String title;
  final Function(String)? onSelected;

  CustomButtonsToggle(
      {required this.tags, required this.title, this.onSelected});

  @override
  _CustomButtonsToggleState createState() => _CustomButtonsToggleState();
}

class _CustomButtonsToggleState extends State<CustomButtonsToggle> {
  List<bool> isSelected = [];

  @override
  void initState() {
    isSelected = List.generate(widget.tags.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(widget.tags.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected =
                        List.generate(widget.tags.length, (i) => i == index);
                  });

                  if (widget.onSelected != null) {
                    widget.onSelected!(widget.tags[index]);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey),
                    color: isSelected[index] ? Colors.green : null,
                  ),
                  child: Text(
                    widget.tags[index],
                    style: TextStyle(
                      fontWeight: isSelected[index]
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected[index] ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

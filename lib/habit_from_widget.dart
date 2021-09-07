import 'package:flutter/material.dart';

class HabitFormWidget extends StatelessWidget {
  final String? name;
  final String? description;
  final int? numRepetitions;
  final int? interval;
  final Color? color;

  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<int> onChangedNumRepetitions;
  final ValueChanged<int> onChangedInterval;
  final ValueChanged<Color> onChangedColor;

  const HabitFormWidget(
      {Key? key,
      this.name = '',
      this.description = '',
      this.numRepetitions = 0,
      this.interval = 0,
      this.color = Colors.black,
      required this.onChangedName,
      required this.onChangedDescription,
      required this.onChangedNumRepetitions,
      required this.onChangedInterval,
      required this.onChangedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(height: 8),
              buildDescription(),
              SizedBox(height: 16),

              SizedBox(height: 8),

            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedName,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedDescription,
      );

  Widget buildNumRepetitions() => TextFormField(
    maxLines: 1,
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,

      hintText: 'NumRepetitions',
      hintStyle: TextStyle(color: Colors.black),
    ),
    validator: (title) =>
    title != null && title.isEmpty ? 'The title cannot be empty' : null,
    onChanged: onChangedNumRepetitions,
  );

}

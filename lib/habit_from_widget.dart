import 'package:flutter/material.dart';

class HabitFormWidget extends StatelessWidget {
  final String? name;
  final String? description;
  final String? numRepetitions;
  final String? interval;
  final Color? color;

  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedNumRepetitions;
  final ValueChanged<String> onChangedInterval;
  final ValueChanged<Color> onChangedColor;

  const HabitFormWidget(
      {Key? key,
      this.name = '',
      this.description = '',
      this.numRepetitions = '',
      this.interval = '',
      this.color = Colors.black,
      required this.onChangedName,
      required this.onChangedDescription,
      required this.onChangedNumRepetitions,
      required this.onChangedInterval,
      required this.onChangedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: ListView(children: <Widget>[
            buildTitle(),
            //   SizedBox(height: 8),
            buildNumRepetitions(),
            buildInterval(),
            buildDescription()
          ]
              //   SizedBox(height: 8),
              //   buildInterval(),
              //   SizedBox(height: 8),
              //   buildDescription(),
              //   SizedBox(height: 8)
              // ],
              ),
        ),
      );

  Widget buildTitle() => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.5)),
            bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
        ),
        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        padding: EdgeInsets.all(5),
        child: ListTile(
          title: TextFormField(
            maxLines: 1,
            initialValue: name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 0,
                bottom: 3,
                top: 3,
                right: 15,
              ),
              labelText: '習慣名稱',
              // hintStyle: TextStyle(color: Colors.black26, fontSize: 18),
            ),
            obscureText: false,
            validator: (title) =>
                title != null && title.isEmpty ? '此欄不能為空' : null,
            onChanged: onChangedName,
          ),
        ),
      );

  Widget buildNumRepetitions() => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
            bottom: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
          ),
        ),
        child: ListTile(
          title: TextFormField(
            maxLines: 1,
            initialValue: numRepetitions,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: '數量',
              // hintStyle: TextStyle(color: Colors.black26, fontSize: 18),
            ),
            obscureText: false,
            validator: (title) =>
                title != null && title.isEmpty ? '此欄不能為空' : null,
            onChanged: onChangedNumRepetitions,
          ),
        ),
      );

  Widget buildInterval() => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
            bottom: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
          ),
        ),
        child: ListTile(
          title: TextFormField(
            maxLines: 1,
            initialValue: interval,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: '週期',
              // hintStyle: TextStyle(color: Colors.black26, fontSize: 18),
            ),
            obscureText: false,
            validator: (title) =>
                title != null && title.isEmpty ? '此欄不能為空' : null,
            onChanged: onChangedInterval,
          ),
        ),
      );

  Widget buildDescription() => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
            bottom: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
          ),
        ),
        child: ListTile(
          title: TextFormField(
            maxLines: 3,
            initialValue: description,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: "Detailed Description",
              labelText: "描述這個習慣",
            ),
            obscureText: false,
            // validator: (title) => title != null && title.isEmpty ? '此欄不能為空' : null,
            onChanged: onChangedDescription,
          ),
        ),
      );
}

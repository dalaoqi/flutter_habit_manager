import 'package:flutter/material.dart';
import 'package:test_project/habit.dart';
import 'package:test_project/habits_db.dart';
import 'package:test_project/main.dart';
import 'package:test_project/habit_from_widget.dart';

class AddEditHabitPage extends StatefulWidget {
  final Habit? habit;

  const AddEditHabitPage({
    Key? key,
    this.habit,
  }) : super(key: key);

  @override
  _AddEditHabitPageState createState() => _AddEditHabitPageState();
}

class _AddEditHabitPageState extends State<AddEditHabitPage> {
  final _formKey = GlobalKey<FormState>();
  late String habitName;
  late String description;
  late int numRepetitions;
  late int interval;
  late Color color;

  @override
  void initState() {
    super.initState();

    habitName = widget.habit?.habitName ?? '';
    numRepetitions = widget.habit?.numRepetitions ?? 0;
    interval = widget.habit?.interval ?? 0;
    description = widget.habit?.description ?? '';
    color = widget.habit?.color ?? Colors.black;
  }

  // @override
  // Widget build(BuildContext context) => MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   title: '創造新習慣',
  //   theme: ThemeData(
  //       primarySwatch: Colors.lightGreen,
  //       appBarTheme: AppBarTheme(
  //           backgroundColor: Colors.white,
  //           // This will be applied to the "back" icon
  //           iconTheme: IconThemeData(color: Colors.red),
  //           // This will be applied to the action icon buttons that locates on the right side
  //           actionsIconTheme: IconThemeData(color: Colors.black),
  //           centerTitle: true,
  //           elevation: 15,
  //           titleTextStyle: TextStyle(color: Colors.black))),
  //   home: HomePage(),
  // );
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: HabitFormWidget(
            name: habitName,
            description: description,
            numRepetitions: numRepetitions,
            interval: interval,
            onChangedName: (habitName) =>
                setState(() => this.habitName = habitName),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onChangedNumRepetitions: (numRepetitions) =>
                setState(() => this.numRepetitions = numRepetitions),
            onChangedInterval: (interval) =>
                setState(() => this.interval = interval),
            onChangedColor: (color) => setState(() => this.color = color),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = habitName.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateNote,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.habit != null;

      await addHabit();

      Navigator.of(context).pop();
    }
  }

  // Future updateNote() async {
  //   final note = widget.note!.copy(
  //     isImportant: isImportant,
  //     number: number,
  //     title: title,
  //     description: description,
  //   );
  //
  //   await NotesDatabase.instance.update(note);
  // }
  //
  Future addHabit() async {
    final note = Habit(
      habitName: habitName,
      numRepetitions: numRepetitions,
      interval: interval,
      description: description,
      createdTime: DateTime.now(),
      color: color,
    );

    await HabitsDatabase.instance.create(note);
    // }
  }
}


// Home Screen
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text(
          '創造新習慣',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          )
        ],
      ),
      // body: Center(
      //   child: ElevatedButton(
      //       child: Text(
      //         'Go To About Screen',
      //       ),
      //       onPressed: () {
      //         // Navigator.push(context,
      //         //     MaterialPageRoute(builder: (context) => AboutPage()));
      //       }),
      // ),
    );
  }
}

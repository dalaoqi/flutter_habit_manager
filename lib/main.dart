import 'package:flutter/material.dart';
import 'package:test_project/details.dart';
import 'package:intl/intl.dart';
import 'package:test_project/habit.dart';
import 'package:test_project/habits_db.dart';
import 'package:test_project/edit_habit_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Home(),
      // routes: {
      //   '/details': (context) => Details(),
      // },
    );
  }
}

// List<Map<String, dynamic>> habits = [
//   {
//     'color': Colors.blue,
//     'title': 'YP',
//     'fulltext': 'Yoga Practice',
//   },
//   {
//     'color': Colors.red,
//     'title': 'GE',
//     'fulltext': 'Get Up Early',
//   },
//   {
//     'color': Colors.cyan,
//     'title': 'NS',
//     'fulltext': 'No Sugar',
//   },
// ];
List<Map<String, dynamic>> habits2 = [
  {'color': Color(0xF055BB11), 'objectif': '08:00 前起床', 'progress': '未完成'},
  {'color': Color(0xF055BB11), 'objectif': '喝水 ', 'progress': '1000 / 2000 毫升'},
  {'color': Color(0xF055BB11), 'objectif': '23:00 前睡覺', 'progress': '未完成'},
];

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  late List<Habit> habits;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshHabits();
  }

  @override
  void dispose() {
    HabitsDatabase.instance.close();

    super.dispose();
  }

  Future refreshHabits() async {
    setState(() => isLoading = true);

    this.habits = await HabitsDatabase.instance.readAllHabits();
    print(this.habits.isEmpty);
    setState(() => isLoading = false);
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          // softWrap: true,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${DateTime.now().year} 年 ${DateTime.now().month} 月 ${DateTime.now().day} 日",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Material(
                        //   color: Colors.transparent,
                        //   child: InkWell(
                        //     onTap: () {},
                        //     child: Container(
                        //       padding: EdgeInsets.all(9.0),
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         color: Color(0xF055BB11),
                        //         // boxShadow: [
                        //         //   BoxShadow(
                        //         //       color: Color(0xff6f1bff),
                        //         //       offset: Offset(0, 3),
                        //         //       blurRadius: 5.0),
                        //         // ],
                        //       ),
                        //       child: Icon(
                        //         Icons.add,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 25.0,
                        // )
                      ],
                    ))),
            SizedBox(
              height: 35.0,
            ),
            // Container(
            //   height: 150,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: habits.length,
            //     itemBuilder: (ctx, id) {
            //       return Container(
            //         width: 150,
            //         margin:
            //         EdgeInsets.only(right: 15.0, top: 9.0, bottom: 9.0),
            //         padding: EdgeInsets.all(13.0),
            //         decoration: BoxDecoration(
            //           color: habits[id]['color'],
            //           borderRadius: BorderRadius.circular(15),
            //           boxShadow: [
            //             BoxShadow(
            //               color: habits[id]['color'],
            //               blurRadius: 5.0,
            //               offset: Offset(0, 3),
            //             ),
            //           ],
            //         ),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             Text(
            //               habits[id]['title'],
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 27,
            //                   color: Colors.white),
            //             ),
            //             Text(
            //               habits[id]['fulltext'],
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white,
            //                 fontSize: 15,
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: 35.0,
            // ),
            Center(

                // decoration: BoxDecoration(
                //   // color: Color(0xff1b232e),
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(15),
                //     bottomLeft: Radius.circular(15),
                //   ),
                // ),
                // padding: EdgeInsets.all(15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  Container(
                    // alignment: Alignment.center,
                    width: 60,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0x8A55BB11),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    // padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${DateTime.now().day - 2}",
                            style: TextStyle(
                              color: Color(0x7C9E9E9E),
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            )),
                        Text(
                          DateFormat('E').format(
                            DateTime.now().add(
                              Duration(days: -2),
                            ),
                          ),
                          style: TextStyle(
                            color: Color(0x7C9E9E9E),
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    width: 60,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0x8A55BB11),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    // padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${DateTime.now().day - 1}",
                            style: TextStyle(
                              color: Color(0x7C9E9E9E),
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            )),
                        Text(
                          DateFormat('E').format(
                            DateTime.now().add(
                              Duration(days: -1),
                            ),
                          ),
                          style: TextStyle(
                            color: Color(0x7C9E9E9E),
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    width: 60,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0xF055BB11),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    // padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${DateTime.now().day}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                        Text(
                          DateFormat('E').format(
                            DateTime.now().add(
                              Duration(days: 0),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    width: 60,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0x8A55BB11),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    // padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${DateTime.now().day + 1}",
                            style: TextStyle(
                              color: Color(0xBC454444),
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            )),
                        Text(
                          DateFormat('E').format(
                            DateTime.now().add(
                              Duration(days: 1),
                            ),
                          ),
                          style:TextStyle(
                            color: Color(0xBC454444),
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    width: 60,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0x8A55BB11),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    // padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${DateTime.now().day + 2}",
                            style: TextStyle(
                              color: Color(0xBC454444),
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            )),
                        Text(
                          DateFormat('E').format(
                            DateTime.now().add(
                              Duration(days: 2),
                            ),
                          ),
                          style: TextStyle(
                            color: Color(0xBC454444),
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ])),
            SizedBox(
              height: 90.0,
            ),
            Center(
                child: Container(
              width: 230,
              alignment: Alignment.center,
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : habits.isEmpty
                      ? new AddNewHabit()
                      : buildHabits(),
            )),

            // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text: "Daily Task",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black,
            //           fontSize: 20,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // // ListItem(id: 1,)
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 3,
            //     itemBuilder: (ctx, id) {
            //       return ListItem(id: id);
            //     },
            //   ),
            // )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xF055BB11),
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditHabitPage()),
            );
            refreshHabits();
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.black),
              label: 'Business',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school, color: Colors.black),
              label: 'School',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: 'Settings',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

Widget buildHabits() {
  return SafeArea(
      child: Scaffold(backgroundColor: Colors.white, body: Container()));
}

class Calender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, f) {
              f = f - 2;
              int day = DateTime.now().day + f;
              var txtStyle;
              if (day == DateTime.now().day) {
                txtStyle = TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                );
              } else if (day < DateTime.now().day) {
                txtStyle = TextStyle(
                  color: Color(0x7C9E9E9E),
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                );
              } else {
                txtStyle = TextStyle(
                  color: Color(0xBC454444),
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                );
              }
              return Container(
                // alignment: Alignment.center,
                width: 60,
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: day == DateTime.now().day
                      ? Color(0xF055BB11)
                      : Color(0x8A55BB11),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                // padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${DateTime.now().day + f}", style: txtStyle),
                    Text(
                      DateFormat('E').format(
                        DateTime.now().add(
                          Duration(days: f),
                        ),
                      ),
                      style: txtStyle,
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}

class AddNewHabit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 66, 165, 245),
      // alignment: AlignmentDirectional(0.0, 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // if you need this
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        elevation: 20,
        child: Column(
          children: <Widget>[
            const ListTile(
              title: Text(
                '養成第一個習慣吧！',
                textAlign: TextAlign.center,
              ),
              // subtitle: Text(
              //     'Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AddEditHabitPage()),
                      );
                    },
                    child: Text(
                      '新增一個新習慣',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(170, 40),
                      primary: Color(0xF055BB11),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // <-- Radius
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget addNewHabit() {
//   return SafeArea(
//       child: Scaffold(backgroundColor: Colors.white, body: Center(
//         child: Container()
//       )));
// }

class ListItem extends StatelessWidget {
  final int id;

  const ListItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.pushNamed(context, '/details');
      // },
      child: Container(
        // height: 150,
        margin: EdgeInsets.symmetric(vertical: 21.0),
        padding: EdgeInsets.only(right: 25.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: id == 0 ? habits2[id]['color'] : Colors.transparent,
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.grey.shade500,
                    ),
                    // border: id == 0
                    //     ? Border()
                    //     : Border.all(
                    //         color: Colors.grey.shade500,
                    //       ),
                  ),
                  child: Icon(
                    Icons.check,
                    // color: id == 0 ? Colors.white : Colors.grey[500],
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      habits2[id]['objectif'],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      habits2[id]['progress'],
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )
              ],
            ),
            LinearProgressIndicator(
              value: id == 1 ? .5 : .0,
              backgroundColor: Color(0xff1c232d),
              valueColor: AlwaysStoppedAnimation(
                habits2[id]['color'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

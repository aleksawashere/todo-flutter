import 'package:flutter/material.dart';
import 'package:todo_flutter/database_helper.dart';
import 'package:todo_flutter/widgets.dart';

import '../models/task.dart';

int valueOfID = 0;//need to put value of an id to current max id value

class Taskpage extends StatefulWidget {

  int id;
  Taskpage({required this.id});

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {

  @override
  void initState() {
    print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Stack(
              children: [
                Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 12.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image(
                            width: 24.0,
                            image: AssetImage('assets/images/back_arrow_icon.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onSubmitted: (value) async{

                            if(value != ""){
                              DatabaseHelper _dbHelper = DatabaseHelper();
                              Task _newTask = Task(
                                id: valueOfID,
                                title: value,
                                description: "Undefined"
                              );

                              valueOfID++;
                              await _dbHelper.insertTask(_newTask);

                              print("New task has been created! $_newTask");
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Task Title",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD95B07)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 12.0,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Description for the task...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                      )),
                ),
                TodoWidget(
                  text: "Create your first task",
                  isDone: true,
                ),
                TodoWidget(
                  text: "Create your second task",
                  isDone: true,
                ),
                TodoWidget(),
                TodoWidget(),
                TodoWidget(),
          ],
        ),
                Positioned(
                  bottom: 24.0,
                  right: 24.0,
                  child: GestureDetector(
                    // onTap: (){
                    //   Navigator.push(context,MaterialPageRoute(
                    //       builder: (context) => Taskpage()
                    //   ),
                    //   );
                    // },
                    child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFD90757),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/delete_icon.png"
                            ),
                          ),
                        )
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

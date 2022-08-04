import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          color:Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, //everything starts from the left
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 32.0,
                    ),
                    child: Image(
                      width: 60,
                      height: 60,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  TaskCardWidget(
                    title: "Title1",
                    desc: "Description 1.",
                  ),
                  TaskCardWidget(),

                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFD95B07),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add_icon.png"
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

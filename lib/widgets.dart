// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get Started",
            style: TextStyle(
              color: Color(0xFF211551),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top:10.0,
            ),
            child: Text(
              "Subtext text. Welcome to the todo app.",
              style: TextStyle(
                color: Color(0xFF86829D),
                fontSize: 16.0,
                height: 1.5,
              ),
            ),
          ),
        ],
      )
    );
  }
}
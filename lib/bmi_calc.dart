import 'package:flutter/material.dart';

class Calc extends StatelessWidget {
  const Calc({super.key, required this.age, required this.re, this.isMale});
  final isMale;
  final age;
  final double re ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        backgroundColor:  Color.fromRGBO(251, 161, 183,1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Genger : ${isMale ? "Male" : "Female"}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),),
            Text("Result : ${re.round()}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),),
            Text("Age : ${age}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),)
          ],
        ),
      ),
    );
  }
}

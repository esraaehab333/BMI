import 'dart:math';

import 'package:flutter/material.dart';

import 'bmi_calc.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale = true;
  double hei = 120;
  int w = 40;
  int age = 15;
  Color g = Color.fromRGBO(255, 209, 218,1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 240, 245,1),
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor:  Color.fromRGBO(251, 161, 183,1),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale ? Color.fromRGBO(255, 219, 170,1): g),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/male.png"),
                            height: 90,
                            width: 90,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale ? Color.fromRGBO(255, 219, 170,1) : g),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage("assets/female.png"),
                              height: 90,
                              width: 90),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: g,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${hei.round()}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 40.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "CM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                    Slider(
                        value: hei,
                        max: 220.0,
                        min: 80.0,
                        onChanged: (value) {
                          setState(() {
                            hei = value;
                          });
                        })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: g,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${w}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 40.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    w--;
                                  });
                                },
                                heroTag: "w-",
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    w++;
                                  });
                                },
                                heroTag: "w+",
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: g,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${age}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 40.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                heroTag: "age-",
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: "age+",
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(251, 161, 183,1),
            child: MaterialButton(
              onPressed: () {
                var res = w / pow((hei / 100), 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Calc(
                              age: age,
                              re: res,
                              isMale: isMale,
                            )));
              },
              child: const Text(
                "Calculate",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          )
        ],
      ),
    );
  }
}

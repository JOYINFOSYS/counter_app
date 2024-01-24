import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Counter());
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

int count=0;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  increment() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    count++;
    setState(() {
      pref.setInt("countValue", count);
    });
  }

  decrement() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    count--;
    setState(() {
      pref.setInt("countValue", count);
    });
  }

  reset() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    count=0;
    setState(() {
      pref.setInt("countValue", count);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    action();
    super.initState();
  }

  action() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? countValue = pref.getInt('countValue');
    count = countValue!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade100,
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                flex: 75,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: CircularPercentIndicator(
                    radius: 100,
                    lineWidth: 20,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.deepPurple.shade100,
                    progressColor: Colors.deepPurple,
                    percent: (count/100),
                    center: Center(
                      child: Text(count.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700
                      ),
                      ),

                    ),
                  ),

                ),
            ),





            const SizedBox(height: 10,),
            Expanded(
              flex: 15,
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            decrement();
                          },
                          child: Container(
                            height: double.infinity,

                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade100,
                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
                                              ),
                            child: Icon(FontAwesomeIcons.minus,size: 42,),
                          ),
                        )),


                    SizedBox(width: 10,),
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            increment();
                          },
                          child: Container(
                            height: double.infinity,

                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade100,
                                //borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),) ,
                            ),
                                child: Icon(FontAwesomeIcons.plus,size: 42,),

                                          ),
                        )),

                    SizedBox(width: 10,),
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            reset();
                          },
                          child: Container(
                            height: double.infinity,

                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),) , ),
                            child: Icon(FontAwesomeIcons.recycle,size: 42,),

                          ),
                        )),


                  ],
        ),),


    ],
        ),), );
  }
}







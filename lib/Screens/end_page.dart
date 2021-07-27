import 'package:flutter/material.dart';

class Hurray extends StatelessWidget {
  final int totalscore;
  Hurray({required this.totalscore});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(
            totalsco: totalscore,
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  final int totalsco;
  LoginPage({required this.totalsco});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double windowWidth = 0;
  double windowHeight = 0;
  double _headingTop = 100;
  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);
  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(milliseconds: 1000),
                        margin: EdgeInsets.only(
                          top: _headingTop,
                        ),
                        child: Text(
                          "Hurray!!",
                          style: TextStyle(color: _headingColor, fontSize: 35),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          "Question Paper Completed.\n Total Score = ${widget.totalsco} marks.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _headingColor, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Center(
                  child: Image.asset("assets/images/splash_bg.png"),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.all(32),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFB40284A),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        "Go Home",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ))
    ]);
  }
}

// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/lucky_draw/services/lucky_draw.dart';

class MyHomePage extends StatefulWidget {
  static route() {
    return MaterialPageRoute(builder: (context) {
      return MyHomePage();
    });
  }

  String? email;
  MyHomePage({Key? key, this.email}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  late final Timer _timer;

  void _startTimer() {
    _counter = 10;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter >= 0) {
          _counter--;
        } else {
          _timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  String winner = "";
  String noWin = "";
  Future<void> getLuckyWinner() async {
    String name = widget.email!.split("@gmail.com")[0].toString();
    name = name.replaceFirst(name[0], name[0].toUpperCase());
    var response = await getWinner();
    for (var element in response) {
      if (element['winner'].toString().contains(name)) {
        setState(() {
          winner = "win";
          noWin = "";
        });
        _startTimer();
      } else {
        setState(() {
          noWin = "noWin";
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getLuckyWinner();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 200,
      child: winner == ""
          ? Center(
              child: CircularProgressIndicator(
              color: CoinColors.dialogTextColor,
            ))
          : noWin == "noWin"
              ? Image.asset(
                  "assets/prize_gif/no-prize.gif",
                  height: 400.0,
                  width: 400.0,
                )
              : Image.asset(
                  "assets/prize_gif/prize.gif",
                  height: 400.0,
                  width: 400.0,
                ),
    );
  }
}

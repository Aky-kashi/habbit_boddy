import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//どのくらいの時間あるタスクに取り組むのかを設定する。
//このクラスは、メインにはまだ入れていない。

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  Duration initialtimer = new Duration();

  @override
  Widget build(BuildContext context) {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
        });
      },
    );
  }
}

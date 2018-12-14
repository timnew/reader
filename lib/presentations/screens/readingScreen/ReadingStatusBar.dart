import 'dart:async';

import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ReadingStatusBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadingStatusBarState();
}

class _ReadingStatusBarState extends State<ReadingStatusBar> {
  Battery battery;

  DateTime now;
  int batteryLevel;
  BatteryState batteryState;

  _ReadingStatusBarState() {
    battery = Battery();

    batteryLevel = null;
    batteryState = null;

    battery.onBatteryStateChanged.listen(_onBatteryStateChanged);
    _refreshTime();
    _refreshBatteryLevel();

    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      setState(_refreshTime);
      _refreshBatteryLevel();
    });
  }

  void _refreshTime() {
    now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) => Row(
      key: Key('ReadingStatusBar'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _Clock(now),
        _Battery(batteryState, batteryLevel),
      ]);

  void _onBatteryStateChanged(BatteryState newState) {
    setState(() {
      batteryState = newState;
    });
  }

  void _refreshBatteryLevel() async {
    try {
      final newLevel = await battery.batteryLevel;

      setState(() {
        batteryLevel = newLevel;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}

class _Clock extends StatelessWidget {
  final DateTime now;

  const _Clock(this.now);

  static String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String get timeString =>
      "${_twoDigits(now.hour)}:${_twoDigits(now.minute)}:${_twoDigits(
          now.second)}";

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
      child: Text(timeString));
}

class _Battery extends StatelessWidget {
  final BatteryState batteryState;
  final int batteryLevel;

  _Battery(this.batteryState, this.batteryLevel);

  IconData _batteryIcon() {
    if (batteryLevel == null) {
      return Icons.battery_unknown;
    }

    if (batteryState == BatteryState.charging) {
      return Icons.battery_charging_full;
    }

    return Icons.battery_std;
  }

  String _batteryLevelText() {
    if (batteryLevel == null) {
      return '';
    }

    return '$batteryLevel%';
  }

  @override
  Widget build(BuildContext context) =>
      Row(children: <Widget>[
        Icon(_batteryIcon()),
        Text(_batteryLevelText())
      ]);
}

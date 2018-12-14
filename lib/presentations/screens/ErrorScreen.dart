import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reader/presentations/components/ScreenScaffold.dart';

class ErrorScreen extends StatelessWidget {
  final Object error;

  ErrorScreen({this.error});

  @override
  Widget build(BuildContext context) =>
      ScreenScaffold(
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: Center(
              child: Text(error.toString())
          )
      );
}
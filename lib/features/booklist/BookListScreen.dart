import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_bus/ProxyInteractor.dart';
 import 'package:flutter_event_bus/flutter_event_bus.dart';
import 'package:timnew_reader/features/splash/SplashScreen.dart';
import 'package:timnew_reader/models/book_models.dart';
import 'package:timnew_reader/stores/BookListStore.dart';

import 'BookIndexRepository.dart';
import 'events.dart';

part '_BookListScreenView.dart';

part '_BookListLoadingWidget.dart';

part '_BookListInteractor.dart';

class BookListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      _BookListLoadingWidget(
          childBuilder: (_) => _BookListScreenView());
}

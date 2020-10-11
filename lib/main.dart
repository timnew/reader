import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timnew_reader/features/UserException.dart';
import 'package:timnew_reader/arch/RenderMixin.dart';
import 'package:timnew_reader/presentations/ReaderApp.dart';
import 'package:timnew_reader/repositories/settings/ThemeRepository.dart';
import 'package:timnew_reader/repositories/settings/BookIndexRepository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await ThemeRepository.init();
  await BookIndexRepository.init();

  DefaultRenders.registerDefaultErrorBuilder(UserException.renderError);

  runApp(ReaderApp());
}

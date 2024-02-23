import 'dart:async';

import 'package:flutter/material.dart';

import 'di.dart';
import 'myApp.dart';
void main() async {
  runZonedGuarded<Future<void>>(() async {




  }, (error, stack) async {
    // await Sentry.captureException(error, stackTrace: stack);
    // await FirebaseCrashlytics.instance.recordError(error, stack);
  });

  await init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/core/dependency_injection/dependency_injection.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/flavor.dart';
import 'package:provider_course/my_app.dart';

void main() => runApp(
      Provider<Flavor>.value(
        child: MyApp(),
        value: Flavor.staging,
      ),
    );


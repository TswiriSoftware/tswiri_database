import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tswiri_database/functions/isar/create_functions.dart';
import 'package:tswiri_database/functions/isar/isar_functions.dart';
import 'package:tswiri_database/mobile_database.dart';
import 'package:tswiri_database/models/search/shopping_cart.dart';
import 'package:tswiri_database/models/settings/app_settings.dart';
import 'package:tswiri_database/test_functions/populate_database.dart';
import 'package:tswiri_database/tswiri_database.dart';
import 'package:tswiri_widgets/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Force portraitUp.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //Load app settings.
  await loadAppSettings();

  //Initiate Isar Storage Directories.
  await initiateIsarDirectory();
  await initiatePhotoStorage();

  //Initiate Isar.
  isar = initiateMobileIsar();

  //Populate the database for testing.
  createBasicContainerTypes();
  populateDatabase();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ShoppingCart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: tswiriTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'title',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      centerTitle: true,
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        children: [],
      ),
    );
  }
}

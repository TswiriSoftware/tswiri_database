import 'package:dekstop/views/barcodes/barcodes_view.dart';
import 'package:dekstop/views/containers/containers_view.dart';
import 'package:dekstop/views/devices/devices_view.dart';
import 'package:dekstop/views/gallery/gallery_view.dart';
import 'package:dekstop/views/grids/grids_view.dart';
import 'package:dekstop/views/qr_code/qr_code_view.dart';
import 'package:dekstop/views/search/search_view.dart';
import 'package:dekstop/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswiri_database/desktop_database.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/functions/isar/create_functions.dart';
import 'package:tswiri_database/models/search/shopping_cart.dart';
import 'package:tswiri_database/models/settings/desktop_settings.dart';
import 'package:tswiri_network/scripts/get_device_ip.dart';
import 'package:tswiri_network/server/shelf_server.dart';
import 'package:tswiri_network/server/websocket_server.dart';
import 'package:tswiri_widgets/colors/colors.dart';
import 'package:tswiri_widgets/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Load desktop settings.
  await loadDesktopSettings();

  //Initiate Isar Storage Directories.
  await initiateSpaceDirectory();
  await initiatePhotoStorage();
  await initiateThumnailStorage();

  //Initiate Isar.
  isar = initiateDesktopIsar();

  //Populate the database for testing.
  createBasicContainerTypes();

  //Get device's ip.
  String? ip = await getDeviceIP();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart()),
        ChangeNotifierProvider(create: (context) => WsManager(ip: ip ?? '')),
        ChangeNotifierProvider(create: (context) => ShelfManager(ip: ip ?? '')),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desktop Example',
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
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  @override
  void initState() {
    super.initState();
    Provider.of<WsManager>(context, listen: false).startServer();
    Provider.of<ShelfManager>(context, listen: false).startServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _navigationRail(),
        const VerticalDivider(thickness: 1, width: 1),
        pages[_selectedIndex],
      ],
    );
  }

  List<Widget> pages = [
    const SearchView(),
    const ContainersView(),
    const GalleryView(),
    const GridsView(),
    const DevicesView(),
    const BarcodesView(),
    const SettingsView(),
    const QrCodeView(),
  ];

  Widget _navigationRail() {
    return NavigationRail(
      backgroundColor: background[400],
      selectedIndex: _selectedIndex,
      groupAlignment: -1.0,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
          // log(_selectedIndex.toString());
        });
      },
      labelType: labelType,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.search),
          selectedIcon: Icon(Icons.search),
          label: Text('Search'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.account_tree_sharp),
          selectedIcon: Icon(Icons.account_tree_sharp),
          label: Text('Containers'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.photo),
          selectedIcon: Icon(Icons.photo),
          label: Text('Gallery'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.grid_on_sharp),
          selectedIcon: Icon(Icons.grid_on_sharp),
          label: Text('Grids'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.devices),
          selectedIcon: Icon(Icons.devices),
          label: Text('Devices'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.qr_code),
          selectedIcon: Icon(Icons.qr_code),
          label: Text('Barcodes'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          selectedIcon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.qr_code_2_outlined),
          selectedIcon: Icon(Icons.qr_code_2_outlined),
          label: Text('Connect'),
        ),
      ],
    );
  }
}

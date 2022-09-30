import 'dart:developer';

import 'package:desktop_example/views/settings/backup_view.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tswiri_database/models/settings/desktop_settings.dart';
import 'package:tswiri_database/models/settings/global_settings.dart';
import 'package:tswiri_widgets/colors/colors.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late SharedPreferences prefs;

  @override
  void initState() {
    loadSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _colorMode(),
                _backup(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorMode() {
    return Card(
      child: ListTile(
        title: Text(
          'Color Mode',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          '(add color to the app)',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Checkbox(
          value: colorModeEnabled,
          onChanged: (value) {
            setState(() {
              colorModeEnabled = value ?? false;
              prefs.setBool(colorModeEnabledPref, value ?? false);
            });
            log(colorModeEnabled.toString());
          },
        ),
      ),
    );
  }

  Widget _backup() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const BackupView(),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(
            'Backup',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: const Icon(
            Icons.backup,
            color: tswiriOrange,
          ),
        ),
      ),
    );
  }

  void loadSettings() async {
    log((await getApplicationSupportDirectory()).path);
    loadDesktopSettings();
    prefs = await SharedPreferences.getInstance();
  }
}

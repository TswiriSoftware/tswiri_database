import 'package:flutter/material.dart';

///This class finds what the user is looking for :D.
class Find extends ChangeNotifier {
  ///A list of enabled filters
  List<String> enabledFilters = [
    'Tags',
    'ML Labels',
    'Photo Labels',
    'Object Labels',
    'Name',
    'Description',
    'ML Text',
  ];

  ///A list of the different filters and their purpose.
  final Map<String, String> _findFilters = {
    'Tags': 'Search by container tags',
    'ML Labels': 'Search by photo labels',
    'Photo Labels': 'Search by User Photo Labels',
    'Object Labels': 'Search by User Object Labels',
    'Name': 'Search by container Name',
    'Description': 'Search by container Description',
    'ML Text': 'Search by detected text',
  };

  ///Get the filters with descriptions.
  Map<String, String> get findFilters {
    return _findFilters;
  }

  ///Get the filternames.
  List<String> get filters {
    return _findFilters.keys.toList();
  }

  ///Toggle a filters state.
  void toggleFilter(String filter) {
    if (enabledFilters.contains(filter)) {
      enabledFilters.removeWhere((element) => element == filter);
    } else {
      enabledFilters.add(filter);
    }
    notifyListeners();
  }

  ///Check if a filter is active.
  bool isFilterActive(String filter) {
    if (enabledFilters.contains(filter)) {
      return true;
    } else {
      return false;
    }
  }
}

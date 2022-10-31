import 'package:flutter/material.dart';

///This class finds what the user is looking for :D.
class Find extends ChangeNotifier {
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
}

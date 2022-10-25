import 'dart:io';

import 'package:desktop_example/views/photo/photo_labeling/ml_label_photo_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/functions/isar/get_functions.dart';
import 'package:tswiri_database/models/image_data/image_data.dart';
import 'package:tswiri_database/widgets/tag_texts_search/tag_texts_search.dart';
import 'package:tswiri_widgets/colors/colors.dart';

class PhotoEditView extends StatefulWidget {
  const PhotoEditView({
    super.key,
    required this.selectedIndex,
    required this.photos,
    required this.navigationEnabeld,
  });

  final int selectedIndex;
  final List<Photo> photos;
  final bool navigationEnabeld;

  @override
  State<PhotoEditView> createState() => PhotoEditViewState();
}

class PhotoEditViewState extends State<PhotoEditView> {
  late int selectedIndex = widget.selectedIndex;
  late List<Photo> _photos = widget.photos;
  late Photo _photo = _photos[selectedIndex];
  late ImageData _imageData = ImageData.fromPhoto(_photo);

  //For Using Tag Text Predictor.
  final GlobalKey<TagTextSearchState> _key = GlobalKey();

  bool showObjects = true;
  bool showText = false;

  bool isAddingPhotoLabel = false;
  bool isAddingObjectLabel = false;

  int? currentObjectID;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.arrowLeft):
            NavigatePhotoLeftIntent(),
        SingleActivator(LogicalKeyboardKey.arrowRight):
            NavigatePhotoRightIntent(),
        SingleActivator(LogicalKeyboardKey.escape): EscapeIntent(),
      },
      child: Actions(
        actions: {
          NavigatePhotoLeftIntent: CallbackAction(onInvoke: (intent) {
            if (selectedIndex == 0) {
              selectedIndex = _photos.length - 1;
            } else {
              selectedIndex--;
            }
            updatePhoto(selectedIndex);
            return null;
          }),
          NavigatePhotoRightIntent: CallbackAction(onInvoke: (intent) {
            if (selectedIndex == _photos.length - 1) {
              selectedIndex = 0;
            } else {
              selectedIndex++;
            }
            updatePhoto(selectedIndex);
            return null;
          }),
          EscapeIntent: EscapeAction(context: context)
        },
        child: Scaffold(
          appBar: _appBar(),
          body: _body(),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Navigate with arrows <- and ->',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _body() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _photoCard(),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _photoLabelsCard(),
              _mlObjectsCard(),
              _mlTextElementCard(),
              _tagTextPredictor(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tagTextPredictor() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Visibility(
        visible: isAddingObjectLabel || isAddingPhotoLabel,
        child: TagTextSearch(
          key: _key,
          //Spagetti monster.
          excludedTags: isAddingPhotoLabel
              ? _imageData.photoLabels.map((e) => e.tagTextID).toList()
              : isAddingObjectLabel
                  ? _imageData.objectLabels
                      .where((element) => element.objectID == currentObjectID)
                      .map((e) => e.tagTextID)
                      .toList()
                  : [],
          dismiss: () => setState(() {
            isAddingObjectLabel = false;
            isAddingPhotoLabel = false;
          }),
          onTagAdd: (tagTextID) {
            if (isAddingPhotoLabel) {
              //Create new Photo Label.
              PhotoLabel newPhotoLabel = PhotoLabel()
                ..photoID = _photo.id
                ..tagTextID = tagTextID;

              setState(() {
                _imageData.photoLabels.add(newPhotoLabel);
              });

              isar!.writeTxn(() => isar!.photoLabels.put(newPhotoLabel));
            } else if (isAddingObjectLabel) {
              //Create new Object Label.
              ObjectLabel newObjectLabel = ObjectLabel()
                ..objectID = currentObjectID!
                ..tagTextID = tagTextID;

              setState(() {
                _imageData.objectLabels.add(newObjectLabel);
              });

              isar!.writeTxn(() => isar!.objectLabels.put(newObjectLabel));
            }
          },
        ),
      ),
    );
  }

  Widget _photoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              width: (MediaQuery.of(context).size.height - 100) *
                  (_imageData.size.width / _imageData.size.height),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(_photo.getPhotoPath()),
                      fit: BoxFit.contain,
                    ),
                  ),
                  CustomPaint(
                    painter: MLLabelPhotoPainter(
                        imageData: _imageData,
                        showObjects: showObjects,
                        showText: showText,
                        fontSize: 12),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _controlBar(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _controlBar() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FilterChip(
              label: Text(
                'Objects',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onSelected: (value) {
                setState(() {
                  showObjects = value;
                });
              },
              selected: showObjects,
            ),
            FilterChip(
              label: Text(
                'Text',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onSelected: (value) {
                setState(() {
                  showText = value;
                });
              },
              selected: showText,
            ),
          ],
        ),
      ),
    );
  }

  Widget _photoLabelsCard() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Visibility(
        visible: !isAddingObjectLabel,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    'Photo Labels',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Wrap(
                  spacing: 4,
                  children: [
                    for (MLPhotoLabel e in _imageData.mlPhotoLabels)
                      _mlPhotoLabelChip(e),
                    for (PhotoLabel e in _imageData.photoLabels)
                      _photoLabelChip(e),
                    Visibility(
                      visible: !isAddingPhotoLabel,
                      child: ActionChip(
                        label: Text(
                          '+',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        onPressed: () {
                          setState(() {
                            isAddingPhotoLabel = true;
                          });
                          _key.currentState?.resetExcludedTags(_imageData
                              .photoLabels
                              .map((e) => e.tagTextID)
                              .toList());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mlPhotoLabelChip(MLPhotoLabel photoLabel) {
    return Builder(builder: (context) {
      if (photoLabel.userFeedback == null) {
        return FilterChip(
          label: Text(getMLDetectedLabelText(photoLabel.detectedLabelTextID)),
          onSelected: (value) {
            setState(() {
              photoLabel.userFeedback = true;
            });
            //Write to isar.
            isar!.writeTxnSync(() {
              MLPhotoLabel label = isar!.mLPhotoLabels.getSync(photoLabel.id)!;
              label.userFeedback = true;
              isar!.mLPhotoLabels.putSync(label);
            });
          },
          selected: false,
          avatar: const Icon(Icons.smart_toy),
        );
      } else if (photoLabel.userFeedback == true) {
        return FilterChip(
          label: Text(getMLDetectedLabelText(photoLabel.detectedLabelTextID)),
          onSelected: (value) {
            setState(() {
              photoLabel.userFeedback = false;
            });
            //Write to isar.
            isar!.writeTxnSync(() {
              MLPhotoLabel label = isar!.mLPhotoLabels.getSync(photoLabel.id)!;
              label.userFeedback = false;
              isar!.mLPhotoLabels.putSync(label);
            });
          },
          backgroundColor: Colors.green,
          selectedColor: Colors.green,
          showCheckmark: true,
          selected: true,
        );
      } else {
        return FilterChip(
          label: Text(
            getMLDetectedLabelText(photoLabel.detectedLabelTextID),
            style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w300),
          ),
          onSelected: (value) {
            setState(() {
              photoLabel.userFeedback = null;
            });
            //Write to isar.
            isar!.writeTxnSync(() {
              MLPhotoLabel label = isar!.mLPhotoLabels.getSync(photoLabel.id)!;
              label.userFeedback = null;
              isar!.mLPhotoLabels.putSync(label);
            });
          },
          avatar: const Icon(Icons.close_sharp),
          backgroundColor: background[300],
          selectedColor: background[300],
          showCheckmark: false,
          selected: false,
        );
      }
    });
  }

  Widget _photoLabelChip(PhotoLabel photoLabel) {
    return Chip(
      label: Text(
        isar!.tagTexts.getSync(photoLabel.tagTextID)?.text ?? 'err',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      avatar: const Icon(Icons.verified_user),
      backgroundColor: background[200],
      deleteIcon: const Icon(
        Icons.close_sharp,
        size: 20,
      ),
      onDeleted: () {
        setState(() {
          _imageData.photoLabels.remove(photoLabel);
        });
        //Write to isar.
        isar!.writeTxnSync(() {
          isar!.photoLabels.deleteSync(photoLabel.id);
        });

        ///Let the TagTextPredictor know this tag has been removed.
        _key.currentState?.updateAssignedTags(photoLabel.tagTextID);
      },
      // backgroundColor: sunbirdOrange,
    );
  }

  Widget _mlObjectsCard() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Visibility(
        visible: !isAddingPhotoLabel,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Objects',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Wrap(spacing: 4, children: [
                  for (var e in _imageData.mlObjects) _mlObjectCard(e)
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mlObjectCard(MLObject mlObject) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Card(
        key: UniqueKey(),
        color: background[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'ID: ${mlObject.id}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const Divider(),
              Wrap(
                spacing: 4,
                children: [
                  for (MLObjectLabel e in _imageData.mlObjectLabels
                      .where((element) => element.objectID == mlObject.id))
                    _mlObjectLabelChip(e),
                  for (ObjectLabel e in _imageData.objectLabels
                      .where((element) => element.objectID == mlObject.id))
                    _objectLabelChip(e),
                  Visibility(
                    key: UniqueKey(),
                    visible: !isAddingObjectLabel,
                    child: ActionChip(
                      label: Text(
                        '+',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      // backgroundColor: sunbirdOrange,
                      onPressed: () {
                        setState(() {
                          isAddingObjectLabel = true;
                          currentObjectID = mlObject.id;
                        });

                        List<int> excludedLabels = _imageData.objectLabels
                            .where((element) => element.objectID == mlObject.id)
                            .map((e) => e.tagTextID)
                            .toList();

                        setState(() {
                          _key.currentState?.resetExcludedTags(excludedLabels);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mlObjectLabelChip(MLObjectLabel mlObjectLabel) {
    return Builder(builder: (context) {
      if (mlObjectLabel.userFeedback == null) {
        return FilterChip(
          label:
              Text(getMLDetectedLabelText(mlObjectLabel.detectedLabelTextID)),
          onSelected: (value) {
            setState(() {
              mlObjectLabel.userFeedback = true;
            });
          },
          selected: false,
          // backgroundColor: background[200],
        );
      } else if (mlObjectLabel.userFeedback == true) {
        return FilterChip(
          label:
              Text(getMLDetectedLabelText(mlObjectLabel.detectedLabelTextID)),
          onSelected: (value) {
            setState(() {
              mlObjectLabel.userFeedback = false;
            });
          },
          backgroundColor: Colors.green,
          selectedColor: Colors.green,
          showCheckmark: true,
          selected: true,
        );
      } else {
        return FilterChip(
          label: Text(
            getMLDetectedLabelText(mlObjectLabel.detectedLabelTextID),
            style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w300),
          ),
          onSelected: (value) {
            setState(() {
              mlObjectLabel.userFeedback = null;
            });
          },
          backgroundColor: background[300],
          showCheckmark: false,
          selected: false,
        );
      }
    });
  }

  Widget _objectLabelChip(ObjectLabel objectLabel) {
    return Chip(
      label: Text(
        isar!.tagTexts.getSync(objectLabel.tagTextID)?.text ?? 'err',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      avatar: const Icon(Icons.verified_user),
      backgroundColor: background[200],
      deleteIcon: const Icon(
        Icons.close_sharp,
        size: 20,
      ),
      onDeleted: () {
        setState(() {
          _imageData.objectLabels.remove(objectLabel);
        });

        ///Let the TagTextPredictor know this tag has been removed.
        _key.currentState?.updateAssignedTags(objectLabel.tagTextID);
      },
      // backgroundColor: sunbirdOrange,
    );
  }

  Widget _mlTextElementCard() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Visibility(
        visible: !isAddingObjectLabel && !isAddingPhotoLabel,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Recognized Text',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                _imageData.mlTextElements.isEmpty
                    ? Text(
                        'No Text Detected',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : const SizedBox.shrink(),
                Wrap(
                  spacing: 4,
                  runSpacing: 8,
                  children: _imageData.mlTextElements
                      .map((e) => _mlTextElementChip(e))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mlTextElementChip(MLTextElement mlTextElement) {
    return Builder(builder: (context) {
      if (mlTextElement.userFeedback == null) {
        return FilterChip(
          label: Text(
              getMLDetectedElementText(mlTextElement.detectedElementTextID)),
          onSelected: (value) {
            setState(() {
              mlTextElement.userFeedback = true;
            });
          },
          selected: false,
          // backgroundColor: background[200],
        );
      } else if (mlTextElement.userFeedback == true) {
        return FilterChip(
          label: Text(
              getMLDetectedElementText(mlTextElement.detectedElementTextID)),
          onSelected: (value) {
            setState(() {
              mlTextElement.userFeedback = false;
            });
          },
          backgroundColor: Colors.green,
          selectedColor: Colors.green,
          showCheckmark: true,
          selected: true,
        );
      } else {
        return FilterChip(
          label: Text(
            getMLDetectedElementText(mlTextElement.detectedElementTextID),
            style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w300),
          ),
          onSelected: (value) {
            setState(() {
              mlTextElement.userFeedback = null;
            });
          },
          backgroundColor: background[300],
          showCheckmark: false,
          selected: false,
        );
      }
    });
  }

  void updatePhoto(int index) {
    setState(() {
      _photo = _photos[index];
      _imageData = ImageData.fromPhoto(_photo);
    });
  }
}

class NavigatePhotoLeftIntent extends Intent {
  const NavigatePhotoLeftIntent();
}

class NavigatePhotoRightIntent extends Intent {
  const NavigatePhotoRightIntent();
}

class EscapeIntent extends Intent {
  const EscapeIntent();
}

class EscapeAction extends Action<EscapeIntent> {
  EscapeAction({required this.context});

  final BuildContext context;

  @override
  void invoke(covariant EscapeIntent intent) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}

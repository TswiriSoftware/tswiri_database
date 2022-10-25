import 'dart:io';

import 'package:desktop_example/views/containers/select_container/select_container_view.dart';
import 'package:flutter/material.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/widgets/tag_texts_search/tag_texts_search.dart';
import 'package:tswiri_widgets/colors/colors.dart';
import 'package:tswiri_widgets/widgets/general/custom_text_field.dart';

class ContainerView extends StatefulWidget {
  const ContainerView({
    Key? key,
    required this.catalogedContainer,
  }) : super(key: key);
  final CatalogedContainer catalogedContainer;

  @override
  State<ContainerView> createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  late final CatalogedContainer _catalogedContainer = widget.catalogedContainer;

  late final ContainerRelationship? _parentRelationship = isar!
      .containerRelationships
      .filter()
      .containerUIDMatches(_catalogedContainer.containerUID)
      .findFirstSync();

  late CatalogedContainer? _parentContainer = _parentRelationship != null
      ? isar!.catalogedContainers
          .filter()
          .containerUIDMatches(_parentRelationship!.parentUID!)
          .findFirstSync()
      : null;

  late List<ContainerTag> assignedTags = isar!.containerTags
      .filter()
      .containerUIDMatches(_catalogedContainer.containerUID)
      .findAllSync();

  late List<ContainerRelationship> containerRelationships = isar!
      .containerRelationships
      .filter()
      .parentUIDMatches(_catalogedContainer.containerUID)
      .findAllSync();

  late final ContainerType _containerType =
      isar!.containerTypes.getSync(_catalogedContainer.containerTypeID)!;

  late Color containerColor = _containerType.containerColor.color;

  late List<Photo> _photos = isar!.photos
      .filter()
      .containerUIDMatches(_catalogedContainer.containerUID)
      .findAllSync();

  bool isAddingTag = false;
  bool isEditingPhoto = false;
  Photo? _photo;

  final GlobalKey<TagTextSearchState> _tagTextPredictorKey = GlobalKey();

  late bool? childrenExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      body: _body(),
      bottomSheet: isAddingTag ? _tagTextSearch() : const SizedBox.shrink(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: background[400],
      title: Text(
        _catalogedContainer.name ?? _catalogedContainer.containerUID,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
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
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: [
          _nameTextField(),
          _descriptionTextField(),
          _parentCard(),
          _tagsCard(),
          _photosCard(),
          _containerChildren(),
          // _gridCard(),
        ],
      ),
    );
  }

  Widget _tagTextSearch() {
    return TagTextSearch(
      key: _tagTextPredictorKey,
      excludedTags: assignedTags.map((e) => e.tagTextID).toList(),
      dismiss: () => setState(() {
        isAddingTag = false;
      }),
      onTagAdd: (tagTextID) {
        //Create New ContainerTag.
        ContainerTag newContainerTag = ContainerTag()
          ..containerUID = _catalogedContainer.containerUID
          ..tagTextID = tagTextID;

        //Write to isar.
        isar!.writeTxnSync(() => isar!.containerTags.putSync(newContainerTag));

        _updateAssignedTags();
      },
    );
  }

  Widget _nameTextField() {
    return CustomTextField(
      label: 'name',
      initialValue: _catalogedContainer.name,
      onSubmitted: (value) {
        isar!.writeTxnSync(() {
          _catalogedContainer.name = value;
          isar!.catalogedContainers.putSync(_catalogedContainer);
        });

        setState(() {
          _catalogedContainer.name = value;
        });
      },
      backgroundColor: background[300]!,
      borderColor: tswiriOrange,
    );
  }

  Widget _descriptionTextField() {
    return CustomTextField(
      label: 'Description',
      initialValue: _catalogedContainer.description,
      onSubmitted: (value) {
        isar!.writeTxnSync(() {
          _catalogedContainer.description = value;
          isar!.catalogedContainers.putSync(_catalogedContainer);
        });

        setState(() {
          _catalogedContainer.description = value;
        });
      },
      backgroundColor: background[300]!,
      borderColor: tswiriOrange,
    );
  }

  Widget _parentCard() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.panorama_fisheye_outlined),
        title: Text(
          _parentContainer?.name ??
              _parentContainer?.containerUID ??
              'no parent',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          '(parent)',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: IconButton(
          onPressed: () async {
            CatalogedContainer? selectedParent =
                await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelectContainerView(
                  currentContainer: _catalogedContainer,
                  parentContainer: _parentContainer,
                ),
              ),
            );

            if (selectedParent != null) {
              isar!.writeTxnSync(() {
                isar!.containerRelationships
                    .filter()
                    .containerUIDMatches(_catalogedContainer.containerUID)
                    .deleteFirstSync();

                isar!.containerRelationships.putSync(ContainerRelationship()
                  ..containerUID = _catalogedContainer.containerUID
                  ..parentUID = selectedParent.containerUID);
              });

              setState(() {
                _parentContainer = selectedParent;
              });
            }
          },
          icon: const Icon(Icons.change_circle),
        ),
      ),
    );
  }

  Widget _tagsCard() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.tag_sharp),
            title: Text(
              'Tags',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  isAddingTag = !isAddingTag;
                });
              },
              icon: isAddingTag
                  ? const Icon(
                      Icons.cancel,
                      color: tswiriOrange,
                    )
                  : const Icon(Icons.add),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 4,
              children: [
                for (var e in assignedTags) _containerTagChip(e),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _containerTagChip(ContainerTag containerTag) {
    return Chip(
      label: Text(
        isar!.tagTexts.getSync(containerTag.tagTextID)?.text ?? 'err',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      deleteIcon: const Icon(
        Icons.close_sharp,
        size: 20,
      ),
      onDeleted: () {
        isar!.writeTxnSync(
            () => isar!.containerTags.deleteSync(containerTag.id));

        _updateAssignedTags();

        ///Let the TagTextPredictor know this tag has been removed.
        _tagTextPredictorKey.currentState
            ?.updateAssignedTags(containerTag.tagTextID);
      },
    );
  }

  Widget _containerChildren() {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: childrenExpanded ?? false,
        onExpansionChanged: (value) {
          setState(() {
            childrenExpanded = value;
          });
        },
        leading: const Icon(Icons.account_tree_sharp),
        title: Text(
          'Children',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: background[300],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_catalogedContainer.name ??
                      _catalogedContainer.containerUID),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    const VerticalDivider(),
                    Column(
                      children: [
                        for (ContainerRelationship e in containerRelationships)
                          _childContainerCard(e),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _childContainerCard(ContainerRelationship relationship) {
    //Container Entry
    CatalogedContainer catalogedContainer = isar!.catalogedContainers
        .filter()
        .containerUIDMatches(relationship.containerUID)
        .findFirstSync()!;

    return Row(
      children: [
        Container(
          width: 50,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: background[200]!,
              ),
            ),
          ),
        ),
        Card(
          color: background[300],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  catalogedContainer.name ?? catalogedContainer.containerUID,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ContainerView(
                          catalogedContainer: catalogedContainer,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit_sharp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _photosCard() {
    return Card(
      child: ExpansionTile(
        leading: const Icon(Icons.photo),
        title: Text(
          'Photos',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: [
          Wrap(
            children: [
              for (var photo in _photos) _photoCard(photo),
            ],
          ),
        ],
      ),

      //  Column(
      //   children: [
      //     ListTile(
      //       leading: const Icon(Icons.photo),
      //       title: Text(
      //         'Photos',
      //         style: Theme.of(context).textTheme.titleMedium,
      //       ),
      //     ),
      // Wrap(
      //   children: [
      //     for (var photo in _photos) _photoCard(photo),
      //   ],
      // ),
      //   ],
      // ),

      // ExpansionTile(
      //   initiallyExpanded: false,
      //   backgroundColor: null,
      //   title: Text(
      //     'Photos',
      //     style: Theme.of(context).textTheme.titleSmall,
      //   ),
      //   children: [
      //     const Divider(),
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Wrap(
      //     children: [
      //       for (var photo in _photos) _photoCard(photo),
      //     ],
      //   ),
      // ),
      //   ],
      // ),
    );
  }

  Widget _photoCard(Photo photo) {
    return InkWell(
      onTap: () {
        setState(() {
          _photo = photo;
          isEditingPhoto = true;
        });
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.file(
                width: 150,
                height: 250,
                File(photo.getPhotoPath()),
                fit: BoxFit.cover,
              ),
              Card(
                color: background[300]!.withAlpha(150),
                child: IconButton(
                  onPressed: () {
                    // deletePhoto(photo);
                    // _updatePhotosDisplay();
                  },
                  icon: const Icon(Icons.delete),
                  color: tswiriOrange,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///Updates children.
  void _updateChildrenContainers() {
    setState(() {
      containerRelationships = isar!.containerRelationships
          .filter()
          .parentUIDMatches(_catalogedContainer.containerUID)
          .findAllSync();
    });
  }

  ///Update the list of tags displayed.
  void _updateAssignedTags() {
    setState(() {
      assignedTags = isar!.containerTags
          .filter()
          .containerUIDMatches(_catalogedContainer.containerUID)
          .findAllSync();
    });
  }
}

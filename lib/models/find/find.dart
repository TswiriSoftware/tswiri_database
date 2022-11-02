import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:tswiri_database/collections/tag_text/tag_text.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/models/search/search_result_models.dart';

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

  List<Result> searchResults = [];

  search({String? enteredKeyword}) {
    if (enteredKeyword != null && enteredKeyword.isNotEmpty) {
      //Normilize the enteredKeyword.
      String normilizedEnteredKeyword = enteredKeyword.trim().toLowerCase();

      //Clear the search results.
      searchResults.clear();

      if (filters.contains('Name')) {
        //Search on CatalogedContainer Name.
        searchResults.addAll(nameSearch(normilizedEnteredKeyword));
      }

      if (filters.contains('Description')) {
        //Search on CatalogedContainer Description.
        searchResults.addAll(descriptionSearch(enteredKeyword));
      }

      //Check if the TagText table search should be conducted.
      if (filters.contains('Tags') ||
          filters.contains('Photo Labels') ||
          filters.contains('Object Labels')) {
        //Search TagText Table.
        List<TagText> tagTexts = isar!.tagTexts
            .filter()
            .textContains(enteredKeyword, caseSensitive: false)
            .findAllSync();

        if (filters.contains('Tags')) {
          //Add Tag Results.
          searchResults.addAll(containerTagSearch(enteredKeyword, tagTexts));
        }
        if (filters.contains('Photo Labels')) {
          //Add Photo Label Results.
          searchResults.addAll(photoLabelSearch(enteredKeyword, tagTexts));
        }
        if (filters.contains('Object Labels')) {
          //Add Object Label Results.
          searchResults.addAll(objectLabelSearch(enteredKeyword, tagTexts));
        }
      }

      if (filters.contains('ML Labels')) {
        //Search on MLDetectedLabelText.
        List<MLDetectedLabelText> mlDetectedLabelTexts = isar!
            .mLDetectedLabelTexts
            .filter()
            .detectedLabelTextContains(enteredKeyword, caseSensitive: false)
            .findAllSync();

        //Add mlPhotoLabel results.
        searchResults
            .addAll(mlPhotoLabelSearch(enteredKeyword, mlDetectedLabelTexts));

        //Add mlObjectLabel results.
        searchResults
            .addAll(mlObjectLabelSearch(enteredKeyword, mlDetectedLabelTexts));
      }

      if (filters.contains('ML Text')) {
        List<MLDetectedElementText> mlDetectedElementTexts = isar!
            .mLDetectedElementTexts
            .filter()
            .detectedTextContains(enteredKeyword, caseSensitive: false)
            .findAllSync();

        //Add mlText results.
        searchResults
            .addAll(mlTextSearch(enteredKeyword, mlDetectedElementTexts));
      }

      //Sort results in decending order on TextSimilarity.
      searchResults
          .sort((a, b) => b.textSimilarity.compareTo(a.textSimilarity));
    } else {
      //Defaults.
      //Clear the search results.
      searchResults.clear();

      searchResults.addAll(nameSearch(''));
    }
    notifyListeners();
  }

  //Search on containerNames.
  List<NameResult> nameSearch(String enteredKeyword) {
    //List of containers where name contains enteredKeyword.
    List<CatalogedContainer> containers = isar!.catalogedContainers
        .filter()
        .nameContains(enteredKeyword, caseSensitive: false)
        .findAllSync();

    return containers.map(
      (e) {
        return NameResult(
          uid: 'nr_${e.id}',
          containerUID: e.containerUID,
          textSimilarity: enteredKeyword.similarityTo(e.name),
          name: e.name ?? 'err',
          containerTypeID: e.containerTypeID,
        );
      },
    ).toList();
  }

  //Search on containerDescriptions.
  List<DescriptionResult> descriptionSearch(String enteredKeyword) {
    //List of containers where name contains enteredKeyword.
    List<CatalogedContainer> containers = isar!.catalogedContainers
        .filter()
        .descriptionContains(enteredKeyword, caseSensitive: false)
        .findAllSync();

    return containers.map(
      (e) {
        return DescriptionResult(
            uid: '${e.id}_${e.barcodeUID}',
            containerUID: e.containerUID,
            textSimilarity: enteredKeyword.similarityTo(e.description),
            description: e.description ?? 'err');
      },
    ).toList();
  }

  //Search on containerTags.
  List<ContainerTagResult> containerTagSearch(
      String enteredKeyword, List<TagText> tagTexts) {
    List<ContainerTagResult> results = [];

    for (TagText tagText in tagTexts) {
      //Find relevant containerTags.
      List<ContainerTag> containerTags = isar!.containerTags
          .filter()
          .tagTextIDEqualTo(tagText.id)
          .findAllSync();

      for (ContainerTag containerTag in containerTags) {
        //Find relevant CatalogedContainer.
        CatalogedContainer? catalogedContainer = isar!.catalogedContainers
            .filter()
            .containerUIDMatches(containerTag.containerUID)
            .findFirstSync();

        if (catalogedContainer != null) {
          //Create ContainerTag Result.
          results.add(
            ContainerTagResult(
              uid: 'ct_${catalogedContainer.id}',
              containerUID: catalogedContainer.containerUID,
              textSimilarity: enteredKeyword.similarityTo(tagText.text),
              tag: tagText.text,
            ),
          );
        }
      }
    }
    return results;
  }

  //Search on photoLabels.
  List<PhotoLabelResult> photoLabelSearch(
      String enteredKeyword, List<TagText> tagTexts) {
    List<PhotoLabelResult> results = [];

    for (TagText tagText in tagTexts) {
      //Find relevant photoLabels.
      List<PhotoLabel> photoLabels =
          isar!.photoLabels.filter().tagTextIDEqualTo(tagText.id).findAllSync();

      for (PhotoLabel photoLabel in photoLabels) {
        Photo? photo = isar!.photos.getSync(photoLabel.photoID);
        if (photo != null) {
          results.add(PhotoLabelResult(
            uid: 'plr_${photoLabel.id}',
            containerUID: photo.containerUID!,
            textSimilarity: enteredKeyword.similarityTo(tagText.text),
            photoLabel: tagText.text,
            photo: photo,
          ));
        }
      }
    }

    return results;
  }

  //Search on objectLabels
  List<ObjectLabelResult> objectLabelSearch(
      String enteredKeyword, List<TagText> tagTexts) {
    //List of results.
    List<ObjectLabelResult> results = [];

    for (TagText tagText in tagTexts) {
      //Find relevant objectLabels.
      List<ObjectLabel> objectLabels = isar!.objectLabels
          .filter()
          .tagTextIDEqualTo(tagText.id)
          .findAllSync();

      for (ObjectLabel objectLabel in objectLabels) {
        //Find relevant mlObject.
        MLObject? mlObject = isar!.mLObjects.getSync(objectLabel.objectID);
        if (mlObject != null) {
          //Find relevant photo.
          Photo? photo = isar!.photos.getSync(mlObject.photoID);
          if (photo != null) {
            //Create ObjectLabelResult.
            results.add(
              ObjectLabelResult(
                uid: '${photo.containerUID!}_${objectLabel.id}',
                containerUID: photo.containerUID!,
                textSimilarity: enteredKeyword.similarityTo(tagText.text),
                objectLabel: tagText.text,
                mlObject: mlObject,
                photo: photo,
              ),
            );
          }
        }
      }
    }

    return results;
  }

  List<MLPhotoLabelResult> mlPhotoLabelSearch(
      String enteredKeyword, List<MLDetectedLabelText> mlDetectedLabelTexts) {
    //List of results.
    List<MLPhotoLabelResult> results = [];

    for (MLDetectedLabelText mlDetectedLabel in mlDetectedLabelTexts) {
      //Find relevant mlPhotoLabels.
      List<MLPhotoLabel> mlPhotoLabels = isar!.mLPhotoLabels
          .filter()
          .detectedLabelTextIDEqualTo(mlDetectedLabel.id)
          .findAllSync();

      for (MLPhotoLabel mlPhotoLabel in mlPhotoLabels) {
        //Find relevant photo.
        Photo? photo = isar!.photos.getSync(mlPhotoLabel.photoID!);

        if (photo != null &&
            mlDetectedLabel.hidden == false &&
            mlPhotoLabel.userFeedback != false) {
          //Create MLPhotoLabelResult.
          results.add(
            MLPhotoLabelResult(
              uid: 'mlplr_${photo.id}_${mlPhotoLabel.id}',
              containerUID: photo.containerUID!,
              textSimilarity: enteredKeyword
                  .similarityTo(mlDetectedLabel.detectedLabelText),
              mlPhotoLabel: mlDetectedLabel.detectedLabelText,
              photo: photo,
            ),
          );
        }
      }
    }
    return results;
  }

  List<MLObjectLabelResult> mlObjectLabelSearch(
      String enteredKeyword, List<MLDetectedLabelText> mlDetectedLabelTexts) {
    //List of results.
    List<MLObjectLabelResult> results = [];
    for (MLDetectedLabelText mlDetectedLabel in mlDetectedLabelTexts) {
      //Find relevant mlObjectLabels.
      List<MLObjectLabel> mlObjectLabels = isar!.mLObjectLabels
          .filter()
          .detectedLabelTextIDEqualTo(mlDetectedLabel.id)
          .findAllSync();

      for (MLObjectLabel mlObjectLabel in mlObjectLabels) {
        //Find relevant MLObject.
        MLObject? mlObject = isar!.mLObjects.getSync(mlObjectLabel.objectID);
        if (mlObject != null) {
          //Find relevant photo.
          Photo? photo = isar!.photos.getSync(mlObject.photoID);
          if (photo != null && mlObjectLabel.userFeedback != false) {
            //Create MLObjectLabelResult.
            results.add(
              MLObjectLabelResult(
                uid: 'mlolr_${mlObjectLabel.id}',
                containerUID: photo.containerUID!,
                textSimilarity: enteredKeyword
                    .similarityTo(mlDetectedLabel.detectedLabelText),
                mlObjectLabel: mlDetectedLabel.detectedLabelText,
                mlObject: mlObject,
                photo: photo,
              ),
            );
          }
        }
      }
    }
    return results;
  }

  List<MLTextResult> mlTextSearch(String enteredKeyword,
      List<MLDetectedElementText> mlDetectedElementTexts) {
    List<MLTextResult> results = [];

    for (MLDetectedElementText mlDetectedElementText
        in mlDetectedElementTexts) {
      //Find relevant mlTextElements.
      List<MLTextElement> mlTextElements = isar!.mLTextElements
          .filter()
          .detectedElementTextIDEqualTo(mlDetectedElementText.id)
          .findAllSync();

      for (MLTextElement mlTextElement in mlTextElements) {
        //Find relevent photo.
        Photo? photo = isar!.photos.getSync(mlTextElement.photoID);
        if (photo != null) {
          results.add(
            MLTextResult(
              uid: 'mlter_${mlTextElement.id}',
              containerUID: photo.containerUID!,
              textSimilarity: enteredKeyword
                  .similarityTo(mlDetectedElementText.detectedText),
              mlText: mlDetectedElementText.detectedText,
              mlTextElement: mlTextElement,
              photo: photo,
            ),
          );
        }
      }
    }

    return results;
  }
}

import 'package:app_example/views/containers/container/container_view.dart';
import 'package:app_example/views/search/shopping_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/models/search/search_controller.dart';
import 'package:tswiri_database/models/search/search_result_models.dart';
import 'package:tswiri_database/models/search/shopping_cart.dart';
import 'package:tswiri_database/models/settings/global_settings.dart';
import 'package:tswiri_database/widgets/search/search_widgets.dart';
import 'package:tswiri_widgets/colors/colors.dart';
import 'package:tswiri_widgets/widgets/general/sunbird_search_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key, required this.isSearching}) : super(key: key);
  final void Function(bool) isSearching;
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final SearchController _searchController =
      SearchController(filters: searchFilters);
  bool isSearching = false;

  @override
  void initState() {
    _searchController.search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching ? _searchBar() : _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'Search',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShoppingCartView(),
            ),
          );
        },
        icon: Provider.of<ShoppingCart>(context).itemList.isNotEmpty
            ? const Icon(Icons.shopping_cart_checkout_sharp)
            : const Icon(Icons.shopping_cart),
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isSearching = true;
              widget.isSearching(isSearching);
            });
          },
          icon: const Icon(
            Icons.search_sharp,
          ),
        ),
      ],
    );
  }

  PreferredSize _searchBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 50),
      child: SearchBar(
          filters: searchFilters,
          filterTypes: filterTypes.entries.map((e) => e.key).toList(),
          onFilterChange: (enteredKeyWord) {
            setState(() {
              _searchController.search(enteredKeyword: enteredKeyWord);
            });
          },
          onCancel: () {
            setState(() {
              isSearching = false;
              widget.isSearching(isSearching);
            });
          },
          onChanged: (value) {
            setState(() {
              _searchController.search(enteredKeyword: value);
            });
          },
          onSubmitted: (value) {
            setState(() {
              _searchController.search(enteredKeyword: value);
            });
          },
          defaultFilterColor: tswiriOrange,
          filterChipColorMap: null),
    );
  }

  Widget _body() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
      itemCount: _searchController.searchResults.length,
      itemBuilder: (context, index) {
        return _searchResultCard(_searchController.searchResults[index]);
      },
    );
  }

  Widget _searchResultCard(Result result) {
    CatalogedContainer catalogedContainer = isar!.catalogedContainers
        .filter()
        .containerUIDMatches(result.containerUID)
        .findFirstSync()!;

    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContainerView(
              catalogedContainer: catalogedContainer,
              tagsExpanded: true,
              photosExpaned: true,
            ),
          ),
        );
        // setState(() {
        //   shoppingCartEmpty = shoppingList.isEmpty;
        // });
      },
      child: Builder(builder: (context) {
        switch (result.runtimeType) {
          case NameResult: //Name Result.
            return NameResultCard(
              nameResult: result as NameResult,
              backgroundColor: background[300]!,
              chipColor: colorModeEnabled
                  ? isar!.containerTypes
                      .getSync(result.containerTypeID)!
                      .containerColor
                  : tswiriOrange,
            );

          case DescriptionResult: //Description Result.
            return DescriptionResultCard(
              descriptionResult: result as DescriptionResult,
              backgroundColor: background[300]!,
              chipColor: tswiriOrange,
            );

          case ContainerTagResult: //ContainerTag Result.

            return ContainerTagResultCard(
              containerTagResult: result as ContainerTagResult,
              backgroundColor: background[300]!,
              chipColor: tswiriOrange,
            );

          case PhotoLabelResult:
            return PhotoLabelResultCard(
              photoLabelResult: result as PhotoLabelResult,
              backgroundColor: background[300]!,
              chipColor: tswiriOrange,
            );

          case ObjectLabelResult:
            return ObjectLabelResultCard(
              result: result as ObjectLabelResult,
              backgroundColor: background[300]!,
              chipColor: tswiriOrange,
            );

          case MLPhotoLabelResult:
            return MLPhotoLabelResultCard(
              mlphotoLabelResult: result as MLPhotoLabelResult,
              backgroundColor: background[300]!,
              chipColor: tswiriOrange,
            );

          case MLObjectLabelResult:
            return MLObjectLabelResultCard(
              result: result as MLObjectLabelResult,
              backgroundColor: background[300]!,
              chipColor: tswiriOrange,
            );

          case MLTextResult:
            return MLTextElementResultCard(
              result: result as MLTextResult,
              backgroundColor: background[300]!,
              chipColor: tswiriOrange,
            );

          default:
            return const SizedBox.shrink();
        }
      }),
    );
  }
}

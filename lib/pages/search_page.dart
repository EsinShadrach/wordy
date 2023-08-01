import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';
import 'package:wordy/utilities/delete_modal.dart';
import 'package:wordy/utilities/word_and_phonetics.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
  late List<Map<String, dynamic>> filteredList;
  bool searchActive = false;

  @override
  void initState() {
    AppState appState = context.read<AppState>();
    filteredList = [...appState.history];
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void submitWord() {
    if (_searchController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Enter a Word."),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.horizontal,
        ),
      );
    } else {
      AppState appState = context.read<AppState>();
      appState.addToHistory({
        "name": _searchController.text,
        "inHistory": true,
        "inFavourite": false,
      });
      setState(() {
        filteredList = [...appState.history]
            .where(
              (item) => item['name']
                  .toString()
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()),
            )
            .toList();
      });
      Navigator.of(context).pushNamed(
        '/detailed',
        arguments: _searchController.text,
      );
    }
  }

  IconData search = Icons.search_rounded;

  IconData returnNeededIcon({required int filterIndex}) {
    IconData returnIcon = search;
    var neededData = filteredList[filterIndex];
    if (neededData["inFavourite"]) {
      returnIcon = Icons.favorite_rounded;
    } else if (neededData["inHistory"]) {
      returnIcon = Icons.history_rounded;
    }
    return returnIcon;
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          color: context.colorscheme.primary,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.03),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: searchActive ? 0 : 100),
            color: context.colorscheme.primary.withOpacity(
              searchActive ? 1 : 0,
            ),
            height: 4.0,
          ),
        ),
        title: Form(
          key: _formKey,
          child: TextFormField(
            controller: _searchController,
            onFieldSubmitted: (value) {
              submitWord();
            },
            onTap: () {
              setState(() {
                searchActive = true;
              });
            },
            onTapOutside: (event) {
              setState(() {
                searchActive = false;
              });
            },
            onChanged: (value) {
              setState(() {
                filteredList = [...appState.history]
                    .where(
                      (item) =>
                          item['name']
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase()) ||
                          value == '',
                    )
                    .toList();
              });
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  search,
                  color: context.colorscheme.primary,
                ),
                onPressed: () {
                  submitWord();
                },
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(returnNeededIcon(filterIndex: index)),
            iconColor: context.colorscheme.primary,
            title: Row(
              children: [
                Expanded(
                  child: Text(filteredList[index]["name"]),
                ),
                const Icon(Icons.arrow_forward_rounded),
              ],
            ),
            splashColor: context.colorscheme.secondary.withOpacity(0.3),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/detailed',
                arguments: filteredList[index]["name"],
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DeleteModal(
                    objectName: filteredList[index]["name"],
                    fromWhere: "history",
                    deleteAction: () {
                      appState.deleteFromHistory(index);
                      setState(() {
                        filteredList = [...appState.history];
                      });
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

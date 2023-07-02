import 'package:flutter/material.dart';
import 'package:wordy/utilities/word_and_phonetics.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
  bool searchActive = false;
  late List<Map<String, dynamic>> filteredList = [...sample];
  @override
  void initState() {
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
        const SnackBar(content: Text("Please Enter a Word.")),
      );
    } else {
      setState(() {
        filteredList = sample
            .where(
              (item) => item['name']
                  .toString()
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()),
            )
            .toList();
      });
    }
  }

  List<Map<String, dynamic>> sample = [
    {
      "name": "apple",
      "inHistory": true,
      "inFavourite": false,
    },
    {
      "name": "rice",
      "inHistory": false,
      "inFavourite": true,
    },
    {
      "name": "banana",
      "inHistory": true,
      "inFavourite": true,
    },
    {
      "name": "orange",
      "inHistory": false,
      "inFavourite": false,
    },
    {
      "name": "butter",
      "inHistory": true,
      "inFavourite": true,
    },
    {
      "name": "bacon",
      "inHistory": true,
      "inFavourite": true,
    },
    {
      "name": "cheese",
      "inHistory": true,
      "inFavourite": true,
    },
  ];

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
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          color: context.colorscheme.primary,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.03),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
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
                filteredList = sample
                    .where((item) =>
                        item['name']
                            .toString()
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        value == '')
                    .toList();
              });
            },
            decoration: InputDecoration(
              hintText: 'Search!!',
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
                  child: Text("${filteredList[index]["name"]}"),
                ),
                const Icon(Icons.arrow_forward_rounded),
              ],
            ),
            splashColor: context.colorscheme.secondary.withOpacity(0.3),
            onTap: () {
              print(sample[index]);
            },
          );
        },
      ),
    );
  }
}

// * SO WE'LL BASICALLY RENDER ALL ITEMS, HAVE A DICTIONARY WHICH CHECKS IF THE  WORD IS IN OUR HISTORY OR FAVOURITE
// * THEN AN X ICON BY THE SIDE TO REMOVE IT FROM HISTORY OR MAYBE A SLIDE TO DELETE..?

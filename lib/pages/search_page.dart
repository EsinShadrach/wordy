import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;
  bool searchActive = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.03),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: searchActive ? 0 : 100),
            color: Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(searchActive ? 1 : 0),
            height: 4.0,
          ),
        ),
        title: TextField(
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
          decoration: InputDecoration(
            hintText: 'Search!!',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: context.colorScheme.error,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
      // body: const Placeholder(),
    );
  }
}

extension ColorThemes on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

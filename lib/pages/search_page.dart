import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
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

  void submitWord() {
    if (_searchController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Enter a Word.")),
      );
    } else {
      // DO SOMETHING
      () {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          color: context.colorScheme.primary,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.03),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: searchActive ? 0 : 100),
            color: context.colorScheme.primary.withOpacity(
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
            decoration: InputDecoration(
              hintText: 'Search!!',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: context.colorScheme.primary,
                ),
                onPressed: () {
                  submitWord();
                },
              ),
            ),
          ),
        ),
      ),
      // body: const Placeholder(),
    );
  }
}

extension ThemesExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

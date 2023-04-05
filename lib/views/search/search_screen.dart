import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Create a controller for the text field
  final TextEditingController _searchController = TextEditingController();

  List<String> tags = [
    'Italian',
    'Mexican',
    'Indian',
    'Chinese',
    'Thai',
    'Italian',
    'Mexican',
    'Indian',
    'Chinese',
    'Thai',
  ];

  List<bool> isSelected = [];
  bool isTyping = false;
  bool isSearching = false;

  List<String> suggestedList = [];
  void _updateSuggestions(String searchText) {
    setState(() {
      suggestedList = tags
          .where(
              (tag) => tag.toLowerCase().startsWith(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    isSelected = List.generate(tags.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: TextField(
          controller: _searchController,
          onChanged: (text) {
            setState(() {
              isTyping = text.isNotEmpty;
              if (isTyping) {
                _updateSuggestions(text);
              }
              isSearching = false;
            });
          },
          onSubmitted: (value) {
            isSearching = true;
            setState(() {});
          },
          decoration: InputDecoration(
            hintText: 'Search recipes',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: isTyping
          ? isSearching
              ? SearchResult()
              : ListView.builder(
                  itemCount: suggestedList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(suggestedList[index]),
                      onTap: () {
                        // TODO: Implement search functionality
                        _searchController.text = suggestedList[index];
                        isSearching = true;
                        setState(() {});
                      },
                    );
                  },
                )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomButtonsToggle(
                    tags: tags,
                    title: "Previous Search",
                    onSelected: (v) {
                      print(v);
                    },
                  ),
                  CustomButtonsToggle(
                    tags: tags,
                    title: "Discover more",
                    onSelected: (v) {
                      print(v);
                    },
                  )
                ],
              ),
            ),
    );
  }
}

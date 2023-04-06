import 'package:flutter/material.dart';
import 'package:recipes/views/search/search_filter.dart';

import '../../services/data.dart';
import '../home/recipes_grid_view.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  String? selectedHealthValue;
  String? selectedDietValue;

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Divider(
              thickness: 6,
              indent: 120,
              endIndent: 120,
            ),
            SearchFilters(),
          ],
        );
        // return SearchFilters();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.tune),
                onPressed: () {
                  _showFilterDialog();
                },
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: RecipesGridView(
              isSearchView: true,
            ),
          ),
        ],
      ),
    );
  }
}

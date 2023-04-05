import 'package:flutter/material.dart';

class SearchFilters extends StatefulWidget {
  @override
  _SearchFiltersState createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {
  String _selectedDiet = 'None';
  String _selectedHealth = 'None';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter Search',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xFF6A994E), // green color
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            'Diet',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF9E6D39), // brown color
            ),
          ),
          const SizedBox(height: 12.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey[400]!),
            ),
            child: DropdownButton<String>(
              value: _selectedDiet,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDiet = newValue!;
                });
              },
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF9E6D39), // brown color
              ),
              underline: SizedBox.shrink(),
              items: <String>[
                'None',
                'Vegetarian',
                'Vegan',
                'Paleo',
                'Ketogenic'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            'Health',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFFCD6133), // orange color
            ),
          ),
          const SizedBox(height: 12.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey[400]!),
            ),
            child: DropdownButton<String>(
              value: _selectedHealth,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedHealth = newValue!;
                });
              },
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFFCD6133), // orange color
              ),
              underline: SizedBox.shrink(),
              items: <String>[
                'None',
                'Gluten Free',
                'Dairy Free',
                'Low Sugar',
                'Low Carb'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedDiet = 'None';
                    _selectedHealth = 'None';
                  });
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Code to apply filters and close bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange[400],
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

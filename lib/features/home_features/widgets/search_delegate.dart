import 'package:flutter/material.dart';

class SearchData extends SearchDelegate {
  List data = ['khaled', 'abdo', 'naser', 'abed', 'ehab'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filter = data.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
        itemCount: query == "" ? data.length : filter.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              query = query == "" ? data[index] : filter[index];
              showResults(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: query == "" ? Text(data[index]) : Text(filter[index]),
            ),
          );
        });
  }
}

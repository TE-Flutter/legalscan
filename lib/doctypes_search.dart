import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DoctypesSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
                items: [
                      "Rent Apartment",
                      "Hiring Document",
                      "Sales contract",
                ],
              );
  }
}




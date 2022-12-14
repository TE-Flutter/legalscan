import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');
  final myKey = GlobalKey<DropdownSearchState<String>>();
  final List<String> myItems = [
    "Brazil",
    "Italia",
  ];
  bool? _popupBuilderSelection = false;

  @override
  Widget build(BuildContext context) {
    void _handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      var isAllSelected =
          _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
      _popupBuilderSelection =
          selectedItem.isEmpty ? false : (isAllSelected ? true : null);

      if (updateState) setState(() {});
    }

    _handleCheckBoxState(updateState: false);

    return DropdownSearch<String>(
                key: myKey,
                items: myItems,
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  interceptCallBacks: true, //important line
                  itemBuilder: (ctx, item, isSelected) {
                    return ListTile(
                      selected: isSelected,
                      title: Text(item),
                      onTap: () => myKey.currentState?.popupValidate([item]),
                    );
                  },
                ),
              );;
  }
}




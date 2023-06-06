import 'package:flutter/material.dart';
import 'coin_data.dart';

class CurrencyList {
  List<Text> getCurrencyTextList() {
    List<Text> items = [];
    for (String currentCurrency in currenciesList) {
      items.add(Text(currentCurrency));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getCurrencyItemList() {
    List<DropdownMenuItem<String>> items = [];
    for (String currentCurrency in currenciesList) {
      items.add(
        DropdownMenuItem(
          value: currentCurrency,
          child: Text(currentCurrency),
        ),
      );
    }
    return items;
  }
}

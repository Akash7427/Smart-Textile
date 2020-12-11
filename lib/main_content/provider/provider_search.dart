import 'package:flutter/cupertino.dart';

class ProviderSearch with ChangeNotifier {
  List _list;
  List _filterlist;
  ProviderSearch() {
    _list = [];
    _filterlist = [];
  }

  List get list => _list;
  List get filterList => _filterlist;

  setList(List ilist) {
    _list.clear();
    if (ilist != null && ilist.length != 0) {
      _list.addAll(ilist);
    }

    notifyListeners();
  }

  setFilterList(List iFilterList) {
    _filterlist.clear();
    if (iFilterList != null && iFilterList.length != 0) {
      _filterlist.addAll(iFilterList);
    }

    notifyListeners();
  }
}

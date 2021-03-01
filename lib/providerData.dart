import 'package:flutter/cupertino.dart';

class NewDataByShipper extends ChangeNotifier {
  String loadingPoint;
  String unloadingPoint;
  String productType;
  String truckPreference;
  String noOfTrucks = '1';
  String weight;
  bool isPending = true;
  String comments;
  bool isCommentsEmpty = true;

  void updateLoadingPoint({String newValue}) {
    loadingPoint = newValue;
    print(loadingPoint);
    notifyListeners();
  }

  void updateUnloadingPoint({String newValue}) {
    unloadingPoint = newValue;
    print(unloadingPoint);
    notifyListeners();
  }

  void updateProductType({String newValue}) {
    productType = newValue;
    print(productType);
    notifyListeners();
  }

  void updateTruckPreference({String newValue}) {
    truckPreference = newValue;
    print(truckPreference);
    notifyListeners();
  }
  void updateNoOfTrucks({String newValue}) {
    noOfTrucks = newValue;
    print(noOfTrucks);
    notifyListeners();
  }
  void updateWeight({String newValue}) {
    weight = newValue;
    print(weight);
    notifyListeners();
  }
  void updateComments({String newValue}) {
    comments = newValue;
    print(comments);
    notifyListeners();
  }
  void updateIsCommentsEmpty({bool newValue}) {
    isCommentsEmpty = newValue;
    print(isCommentsEmpty);
    notifyListeners();
  }

}

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  var _selectedIndex = 0.obs;

  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;

  // changeIndex(index) {
  //   _selectedIndex.value = index;
  //   // update();
  // }
}
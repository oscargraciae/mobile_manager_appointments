import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/models/Place.dart';
import 'package:reserly_manager/models/category.dart';
import 'package:reserly_manager/models/geocode.dart';
import 'package:reserly_manager/provider/search_api.dart';
import 'package:reserly_manager/routes/app_routes.dart';
import 'package:reserly_manager/services/business_service.dart';
import 'package:reserly_manager/services/categories_service.dart';

class OnBoardingController extends GetxController {
  final SearchAPI _searchRepository = Get.put(SearchAPI(new Dio()));

  //Observable
  var step = 0.obs;
  var pageController = PageController().obs;
  var name = ''.obs;
  var categoryId = 0.obs;
  var addressMap = ''.obs;
  var isOpenAddressList = false.obs;

  RxList<Category> categories = RxList<Category>([]);
  RxList<Prediction> predictions = RxList<Prediction>([]);

  //General
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController addressCtrl = new TextEditingController();

  Result? geocodeResult;

  double lat = 0.0;
  double lng = 0.0;

  @override
  void onReady() {
    super.onReady();
    loadCategories();
  }

  void goBackStep() {
    if (step.value >= 1) {
      int nextStep = step.value - 1;
      pageController.value.jumpToPage(nextStep);
      step.value = nextStep;
    }
  }

  void goNext() {
    int nextStep = step.value + 1;
    pageController.value.jumpToPage(nextStep);
    step.value = nextStep;
  }

  void loadCategories() async {
    List<Category> response = await new CategoryService().getAll();
    categories = response.obs;
  }

  void onChangeAddress(String text) async {
    isOpenAddressList.value = true;
    List<Prediction> s = await _searchRepository.search(text);
    predictions.value = s.obs;
    update();
  }

  void onSelectedAddress(String placeId, String address) async {
    addressMap.value = address;
    addressCtrl.text = address;
    isOpenAddressList.value = false;
    Geocode g = await _searchRepository.getGeocoderById((placeId));
    final location = g.results[0].geometry.location;
    lat = location.lat;
    lng = location.lng;

    geocodeResult = g.results[0];
    goNext();
  }

  void onCleanAddress() {
    addressMap.value = '';
    addressCtrl.text = '';
    lat = 0.0;
    lng = 0.0;
    isOpenAddressList.value = false;
    geocodeResult = null;
  }

  void createBusiness() async {
    Location l = geocodeResult!.geometry.location;
    bool isCreated = await new BusinessService().create(
      name: name.value,
      categoryId: categoryId.value,
      addressMap: addressMap.value,
      lat: l.lat,
      lng: l.lng
    );

    if (isCreated) {
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.snackbar('Error', 'Ha ocurrido un error, intente de nuevo.');
    }

  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddlewareAuth extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    if (true) {
      return RouteSettings();
    } else {
      return null;
    }
  }
  //
  // @override
  // Future<GetNavConfig> redirectDelegate(GetNavConfig route) {
  //
  // }
  //
  // @override
  // void onPageDispose() {
  //
  // }
  //
  // @override
  // Widget onPageBuilt(Widget page) {
  //
  // }
  //
  // @override
  // GetPageBuilder onPageBuildStart(GetPageBuilder page) {
  //
  // }
  //
  // @override
  // List<Bindings> onBindingsStart(List<Bindings> bindings) {
  //
  // }
  //
  // @override
  // GetPage onPageCalled(GetPage page) {
  //
  // }
}
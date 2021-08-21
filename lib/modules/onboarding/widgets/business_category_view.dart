import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/models/category.dart';
import 'package:reserly_manager/modules/onboarding/onboarding_controller.dart';
import 'package:reserly_manager/widgets/Button.dart';

class BusinessCategoryView extends StatelessWidget {
  BusinessCategoryView({Key? key}) : super(key: key);

  final controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '¿Cual es la categoría de tu negocio?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                Category category = controller.categories[index];
                return ListTile(
                  selected: category.id == controller.categoryId.value ? true : false,
                  title: Text(category.name),
                  trailing: Icon(Icons.arrow_right_alt_sharp),
                  onTap: () {
                    print(category.id);
                    controller.categoryId.value = category.id;
                    controller.goNext();
                  },
                );
              }, separatorBuilder: (BuildContext context, int index) {
                return Divider();
            },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (controller.categoryId.value != 0) {
                controller.goNext();
              }
            },
            child: Text('Siguiente'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16.0),
              primary: controller.categoryId.value != 0 ? kPrimaryColor : Colors.grey.shade200,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}

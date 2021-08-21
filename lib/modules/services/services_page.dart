import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:reserly_manager/models/service.dart';
import 'package:reserly_manager/modules/services/services_controller.dart';
import 'package:reserly_manager/modules/services/widgets/service_tile.dart';
import 'package:reserly_manager/routes/app_routes.dart';
import 'package:reserly_manager/widgets/button_app_bar.dart';

class ServicesPage extends StatelessWidget {
  ServicesPage({Key? key}) : super(key: key);

  final controller = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          // title: Text('Mis servicios', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          centerTitle: false,
          floating: true,
          pinned: true,
          expandedHeight: 120.0,
          stretch: true,
          foregroundColor: Colors.red,
          forceElevated: true,
          snap: true,
          // backgroundColor: kPrimaryLight,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.NEW_SERVICE);
                  print('REcargar pagina');
                },
                icon: Icon(Icons.add))
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Mis servicios', style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: false,
            titlePadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            stretchModes: [StretchMode.fadeTitle],
          ),
        ),
        Obx(() {
          if (controller.isLoading.value)
              return SliverFillRemaining(child: Center(child: CircularProgressIndicator()), );
          return SliverList(
            delegate: SliverChildListDelegate([
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.services.length,
                itemBuilder: (context, index) {
                  Service service = controller.services[index];
                  return ServiceTile(service: service);
                },
                // separatorBuilder: (context, index) => Divider(),
              )
            ]),
          );
        })
      ],
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/models/service.dart';
import 'package:reserly_manager/modules/services/services_controller.dart';
import 'package:reserly_manager/routes/app_routes.dart';

class ServiceTile extends StatelessWidget {
  Service service;

  ServiceTile({Key? key, required this.service}) : super(key: key);

  final controller = Get.find<ServicesController>();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        print('Eliminar servicio');
        Get.dialog(
          Container(
            child: AlertDialog(
              title: Text('Eliminar'),
              content: Text('¿Estás seguro que quieres eliminar este servicio?'),
              actions: [
                TextButton(onPressed: () {
                  Navigator.of(context).pop(false);
                  // Get.back();
                  // controller.loadService();
                }, child: Text('Cancelar', style: TextStyle(color: Colors.grey))),
                TextButton(onPressed: () {
                  Navigator.of(context).pop(true);
                  controller.delete(service.id);
                }, child: Text('Elimnar', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
              ],
            ),
          )
        );
        // controller.delete(service.id);
      },
      background: Container(
        color: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 20),
        // child: Text('Eliminar'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit, color: Colors.white),
            Text('Editar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
      secondaryBackground: Container(
        color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 20),
        // child: Text('Eliminar'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cancel_outlined, color: Colors.white),
            Text('Eliminar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
        alignment: Alignment.centerRight,
      ),

      child: ListTile(
        onTap: () => Get.toNamed(AppRoutes.NEW_SERVICE, arguments: service),
        title: Text(service.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${service.time.toString()} min.'),
        trailing: Text('\$${service.price}', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}

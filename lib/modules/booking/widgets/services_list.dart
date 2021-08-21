import 'package:flutter/material.dart';
import 'package:reserly_manager/models/booking_service.dart';

class ServicesList extends StatelessWidget {
  final List<BookingService> bookingServices;

  const ServicesList({ Key? key, required this.bookingServices }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(bookingServices);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Servicios',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemCount: bookingServices.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text('${bookingServices[index].businessService.name}', softWrap: true)
                  ),
                  Spacer(),
                  Text(
                      '${'${bookingServices[index].businessService.time}'}min /'),
                  Text(
                      '\$${'${bookingServices[index].businessService.price}'} MNX')
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
        ),
      ],
    );
  }
}

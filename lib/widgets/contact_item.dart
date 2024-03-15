import 'package:address_24/models/person.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,//passa questa chiave al componente base
    required this.p,
  });

  final Person p;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(p.picture!.thumbnail!),
              radius: 40
            ),
            const SizedBox(//container vuoti per generare un po di spazio
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,//perche sia sposta verso sinistra
              children: [Text(p.firstName!), Text(p.cell!)],
            )
          ],
        ),
      ),
    );
  }
}
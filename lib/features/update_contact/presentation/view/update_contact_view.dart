import 'package:contacts/features/update_contact/presentation/view/widgets/update_contact_view_body.dart';
import 'package:flutter/material.dart';

class UpdateContactView extends StatelessWidget {
  const UpdateContactView({super.key, required this.name, required this.number, required this.image, required this.index});
  final String name;
  final String number;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text('Contact Details'),
     ),
     body:  UpdateContactViewBody(
       index: index,
       image: image,
       name: name,
       number: number,
     ),
    );
  }
}

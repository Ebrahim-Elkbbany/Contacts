import 'package:contacts/features/home/presentation/view/widgets/floating_action_button.dart';
import 'package:contacts/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import '../data/sqldb.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});


  static final GlobalKey<_HomeViewState> homeViewStateKey = GlobalKey();

  void refreshHomeViewBody() {
    HomeView.homeViewStateKey.currentState?.widget.refreshHomeViewBody();
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? name;
  String? number;
  String? image;
  SqlDb dB = SqlDb();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
      ),
      body:  HomeViewBody(key: HomeView.homeViewStateKey),
      floatingActionButton: HomeFloatingActionButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            int r = await dB.insert(name: name!, number: number!,image: image!);
            Navigator.pop(context);
            widget.refreshHomeViewBody();
            setState(() {

            });
          } else {
            autoValidateMode = AutovalidateMode.always;
            setState(() {});
          }
        },
        nameOnSaved: (value) {
          name = value;
        },
        numberOnSaved: (value) {
          number = value;
        },
        imageOnSaved: (value) {
          image = value;
        },
        formKey: formKey,
        autoValidateMode: autoValidateMode,
      ),
    );
  }
}

import 'package:contacts/core/utils/functions/navigate.dart';
import 'package:contacts/core/utils/resposive_size_config.dart';
import 'package:contacts/core/widgets/custom_button.dart';
import 'package:contacts/core/widgets/custom_cached_network_image.dart';
import 'package:contacts/features/home/presentation/data/sqldb.dart';
import 'package:contacts/features/home/presentation/view/home_view.dart';
import 'package:contacts/features/update_contact/presentation/view/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class UpdateContactViewBody extends StatefulWidget {
  const UpdateContactViewBody(
      {super.key,
      required this.name,
      required this.number,
      required this.image,
      required this.index});

  final String name;
  final String number;
  final String image;
  final int index;

  @override
  State<UpdateContactViewBody> createState() => _UpdateContactViewBodyState();
}

class _UpdateContactViewBodyState extends State<UpdateContactViewBody> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  var imageController = TextEditingController();
  var emailController = TextEditingController();
  SqlDb dB = SqlDb();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.name;
    numberController.text = widget.number;
    imageController.text = widget.image;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 20.w),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.w),
            child: CustomCashedImage(
              height: 150.w,
              width: 150.w,
              imageUrl: widget.image,
            ),
          ),
          SizedBox(
            height: SizeConfig.height(context, 0.05),
          ),
          CustomTextField(
            controller: nameController,
          ),
          SizedBox(
            height: SizeConfig.height(context, 0.02),
          ),
          CustomTextField(
            controller: numberController,
          ),
          SizedBox(
            height: SizeConfig.height(context, 0.02),
          ),
          CustomTextField(
            controller: imageController,
            maxLine: 3,
          ),
          SizedBox(
            height: SizeConfig.height(context, 0.03),
          ),
          CustomButton(
            onPressed: () {
              dB.update(id: widget.index,
                name: nameController.text,
                number: numberController.text,
                image: imageController.text,);
              navigateTo(context, const HomeView());

            },
            buttonName: 'Save',
          ),
          CustomButton(
            onPressed: () {
              customDialog(
                index: widget.index,
                context: context,
                cancelOnPressed: () {
                  Navigator.pop(context);
                },
                acceptOnPressed: () {
                  dB.delete(widget.index);
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeView();
                      },

                    ),
                  );
                  setState(
                    () {},
                  );
                },
              );
            },
            backColor: Colors.white,
            buttonName: 'Delete',
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

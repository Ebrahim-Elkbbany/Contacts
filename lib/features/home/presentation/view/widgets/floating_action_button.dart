import 'package:contacts/core/utils/resposive_size_config.dart';
import 'package:contacts/core/widgets/custom_button.dart';
import 'package:contacts/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({
    super.key,
    required this.nameOnSaved,
    required this.numberOnSaved,
    required this.imageOnSaved,
    required this.onPressed,
    required this.autoValidateMode,
    required this.formKey,
  });

  final void Function(String?) nameOnSaved;
  final void Function(String?) numberOnSaved;
  final void Function(String?) imageOnSaved;
  final void Function() onPressed;
  final AutovalidateMode autoValidateMode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.w),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                right: 16.w,
                left: 16.w,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: autoValidateMode,
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.height(context, 0.05),
                      ),
                      CustomTextField(
                        hint: 'Contact Name',
                        onSaved: nameOnSaved,
                      ),
                      SizedBox(
                        height: SizeConfig.height(context, 0.02),
                      ),
                      CustomTextField(
                        hint: 'Contact Number',
                        onSaved: numberOnSaved,
                      ),
                      SizedBox(
                        height: SizeConfig.height(context, 0.02),
                      ),
                      CustomTextField(
                          hint: 'Contact Image Url',
                          maxLine: 5,
                          onSaved: imageOnSaved),
                      SizedBox(
                        height: SizeConfig.height(context, 0.04),
                      ),
                      CustomButton(
                        onPressed: onPressed,
                        buttonName: 'Add',
                      ),
                      SizedBox(
                        height: SizeConfig.height(context, 0.013),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      elevation: 0,
      child: Icon(
        Icons.add,
        size: 25.w,
      ),
    );
  }
}

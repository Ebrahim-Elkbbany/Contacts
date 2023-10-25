import 'package:contacts/core/utils/resposive_size_config.dart';
import 'package:contacts/core/utils/styles.dart';
import 'package:contacts/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.name, required this.number, required this.image, required this.onDoubleTap});
  final String name;
  final String number;
  final String image;
  final void Function() onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150.w),
            child: CustomCashedImage(
              imageUrl: image,
            ),
          ),
          SizedBox(
            height: SizeConfig.height(context, 0.01),
          ),
          Text(
            name,
            style: Styles.textStyle20.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: SizeConfig.height(context, 0.001),
          ),
          Text(
           number,
            style:
            Styles.textStyle16.copyWith(color: Colors.black45,),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

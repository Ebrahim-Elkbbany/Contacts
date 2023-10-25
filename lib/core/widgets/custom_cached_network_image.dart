import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCashedImage extends StatelessWidget {
  const CustomCashedImage(
      {Key? key, required this.imageUrl, this.borderRadius , this.height, this.width})
      : super(key: key);
  final String imageUrl;
  final double ?borderRadius;
  final double ?height;
  final double ? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100.w,
      width: width ?? 100.w,
      decoration: BoxDecoration(
        borderRadius:   BorderRadius.circular(borderRadius ??70).w,
       color: Colors.blue,
      ),
      child: CachedNetworkImage(
        errorWidget: (context, url, error) {
          return  Icon(Icons.person,size: 70.w,color: Colors.white,);
        },
        imageUrl: imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}

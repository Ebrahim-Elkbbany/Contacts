import 'package:contacts/core/utils/functions/navigate.dart';
import 'package:contacts/core/widgets/custom_circular_indicator.dart';
import 'package:contacts/features/home/presentation/data/sqldb.dart';
import 'package:contacts/features/home/presentation/view/widgets/grid_view_item.dart';
import 'package:contacts/features/update_contact/presentation/view/update_contact_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  SqlDb dB = SqlDb();

  void refreshHomeViewBody() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dB.read(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            padding: EdgeInsets.all(5.w),
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 10.w,
            children: List.generate(
              snapshot.data!.length,
              (index) {
                return GridViewItem(
                  onDoubleTap: () {
                    navigateTo(
                      context,
                      UpdateContactView(
                        index: snapshot.data![index]['id'],
                        name: snapshot.data![index]['name'],
                        number: snapshot.data![index]['number'],
                        image: snapshot.data![index]['image'],
                      ),
                    );
                  },
                  name: snapshot.data![index]['name'],
                  number: snapshot.data![index]['number'],
                  image: snapshot.data![index]['image'],
                );
              },
            ),
          );
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}

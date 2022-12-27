import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_playground/core/data/model/menu.dart';
import 'package:flutter_playground/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class MenuWidget extends StatelessWidget {
  final HomePageMenu menuItem;
  const MenuWidget({
    super.key,
    required this.menuItem,
  });

  // Widget _bottomSheet() {
  //   return SizedBox(
  //     height: 100,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         MenuWidget(
  //           menuItem: menuItem,
  //         ),
  //         MenuWidget(
  //           menuItem: menuItem,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /* modal bottom sheet
   showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          context: context,
          builder: (context) {
            return _bottomSheet();
          },
        ),
  */

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(menuItem.page),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: menuItem.icon.image),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            menuItem.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

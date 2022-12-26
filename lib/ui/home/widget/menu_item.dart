import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_playground/core/data/model/menu.dart';

class MenuWidget extends StatelessWidget {
  final HomePageMenu menuItem;
  const MenuWidget({
    super.key,
    required this.menuItem,
  });

  Widget _bottomSheet() {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MenuWidget(
            menuItem: menuItem,
          ),
          MenuWidget(
            menuItem: menuItem,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(width: 0.5, color: Colors.grey)),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(menuItem.icon)),
            ),
            Text(
              menuItem.label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

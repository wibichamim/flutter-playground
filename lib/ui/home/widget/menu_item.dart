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

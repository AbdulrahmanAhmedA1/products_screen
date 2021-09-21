import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';

class ActionButton extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? iconPath;
  final bool? active;

  const ActionButton({
    Key? key,
    this.title,
    this.iconPath,
    this.onTap,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10.0,
        children: [
          SvgPicture.asset(
            iconPath!,
            color: active! ? theme : Colors.black87,
          ),
          Stack(
            //overflow: Overflow.visible,
            children: [
              Text(
                title!,
                style: TextStyle(
                    color: active! ? theme : Colors.black87, fontSize: 16.0),
              ),
              if (active!)
                Positioned(
                  top: -3,
                  right: -12,
                  child: Container(
                    width: 14,
                    height: 14,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/tick.svg',
                      height: 5,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}

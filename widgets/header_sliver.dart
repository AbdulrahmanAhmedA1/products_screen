/* import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kppani_furniture/pages/Products/widgets/filter_modal_bottom_sheet.dart';
import 'action_button.dart';

class HeaderSliver implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  String? title;

  HeaderSliver({
    required this.minExtent,
    required this.maxExtent,
    required this.title,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0.0, 10.0),
              blurRadius: 10.0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      //child: SvgPicture.asset('assets/icons/back.svg'),
                      child: Icon(
                        Icons.arrow_back,
                        size: 22,
                      ),
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                  Text(
                    title.toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Container(
                    width: 60.0,
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10.0,
                      children: [
                        /* Cart(
                          numberOfItemsInCart: Fake.numberOfItemsInCart,
                        ), */
                        Badge(
                          badgeContent: Text("0"),
                          padding: EdgeInsets.all(2),
                          child: SvgPicture.asset('assets/icons/cart.svg'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ActionButton(
                    title: 'Filter',
                    iconPath: 'assets/icons/controls.svg',
                    onTap: () {
                      _settingModalBottomSheet(context);
                    },
                    active: true,
                  ),
                  Container(
                    color: Colors.black12,
                    width: 1,
                    height: 20,
                  ),
                  ActionButton(
                    title: 'Sort',
                    iconPath: 'assets/icons/sort.svg',
                    onTap: () {},
                  ),
                  Container(
                    color: Colors.black12,
                    width: 1,
                    height: 20,
                  ),
                  ActionButton(
                    title: 'List',
                    iconPath: 'assets/icons/list.svg',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return FilterModalBottomSheet();
      });
}
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kppani_furniture/pages/Products/widgets/filter_modal_bottom_sheet.dart';
import 'action_button.dart';

class HeaderSliver implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  String? title;

  HeaderSliver({
    required this.minExtent,
    required this.maxExtent,
    required this.title,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: true,
        title: Text(
          title.toString(),
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButton(
              title: 'Filter',
              iconPath: 'assets/icons/controls.svg',
              onTap: () {
                _settingModalBottomSheet(context);
              },
              active: true,
            ),
            Container(
              color: Colors.black12,
              width: 1,
              height: 20,
            ),
            ActionButton(
              title: 'Sort',
              iconPath: 'assets/icons/sort.svg',
              onTap: () {},
            ),
            Container(
              color: Colors.black12,
              width: 1,
              height: 20,
            ),
            ActionButton(
              title: 'List',
              iconPath: 'assets/icons/list.svg',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return FilterModalBottomSheet();
      });
}

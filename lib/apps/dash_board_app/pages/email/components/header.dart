import 'package:draft/apps/dash_board_app/constants/dash_board_constant.dart';
import 'package:draft/apps/dash_board_app/constants/dash_board_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DashBoardConstant.dPadding),
      child: Row(
        children: [
          if (Responsive.isMobile(context)) BackButton(),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/Trash.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/Reply.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/Reply all.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/Transfer.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          Spacer(),
          if (Responsive.isDesktop(context))
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Printer.svg",
                width: 24,
              ),
              onPressed: () {},
            ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/Markup.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/More vertical.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

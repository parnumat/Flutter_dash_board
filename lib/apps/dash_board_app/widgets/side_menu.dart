import 'package:draft/apps/dash_board_app/constants/dash_board_constant.dart';
import 'package:draft/apps/dash_board_app/constants/dash_board_extension.dart';
import 'package:draft/apps/dash_board_app/constants/dash_board_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'side_menu_item.dart';
import 'tags.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding:
          const EdgeInsets.only(top: kIsWeb ? DashBoardConstant.dPadding : 0),
      color: DashBoardConstant.dBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: DashBoardConstant.dPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/Logo Outlook.png",
                    width: 46,
                  ),
                  Spacer(),
                  if (!Responsive.isDesktop(context)) CloseButton()
                ],
              ),
              SizedBox(height: DashBoardConstant.dPadding),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: DashBoardConstant.dPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: DashBoardConstant.dPrimaryColor,
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/Edit.svg", width: 16),
                label: Text(
                  "New message",
                  style: TextStyle(color: Colors.white),
                ),
              ).addNeumorphism(
                topShadowColor: Colors.white,
                bottomShadowColor: Color(0xFF234395).withOpacity(0.2),
              ),
              SizedBox(height: DashBoardConstant.dPadding),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: DashBoardConstant.dPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: DashBoardConstant.dBgDarkColor,
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/Download.svg", width: 16),
                label: Text(
                  "Get messages",
                  style: TextStyle(color: DashBoardConstant.dTextColor),
                ),
              ).addNeumorphism(),
              SizedBox(height: DashBoardConstant.dPadding * 2),
              // Menu Items
              SideMenuItem(
                press: () {},
                title: "Inbox",
                iconSrc: "assets/icons/Inbox.svg",
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Sent",
                iconSrc: "assets/icons/Send.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: "assets/icons/File.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: "assets/icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),

              SizedBox(height: DashBoardConstant.dPadding * 2),
              // Tags
              Tags(),
            ],
          ),
        ),
      ),
    );
  }
}

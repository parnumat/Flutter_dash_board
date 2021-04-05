import 'package:draft/apps/dash_board_app/constants/dash_board_constant.dart';
import 'package:draft/apps/dash_board_app/constants/dash_board_responsive.dart';
import 'package:draft/apps/dash_board_app/models/Email.dart';
import 'package:draft/apps/dash_board_app/pages/email/email_screen.dart';
import 'package:draft/apps/dash_board_app/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'email_card.dart';

class ListOfEmails extends StatefulWidget {
  const ListOfEmails({
    Key key,
  }) : super(key: key);

  @override
  _ListOfEmailsState createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250), child: SideMenu()),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? DashBoardConstant.dPadding : 0),
        color: DashBoardConstant.dBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: DashBoardConstant.dPadding),
                child: Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
                          }),
                    if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: DashBoardConstant.dBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(
                                DashBoardConstant.dPadding * 0.75),
                            child: SvgPicture.asset(
                              "assets/icons/Search.svg",
                              width: 24,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: DashBoardConstant.dPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: DashBoardConstant.dPadding),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Angle down.svg",
                      width: 16,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Sort by date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: SvgPicture.asset(
                        "assets/icons/Sort.svg",
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: DashBoardConstant.dPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: emails.length,
                  itemBuilder: (context, index) => EmailCard(
                    isActive: Responsive.isMobile(context) ? false : index == 0,
                    email: emails[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailScreen(
                            email: emails[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

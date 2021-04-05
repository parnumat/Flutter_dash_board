import 'package:draft/apps/dash_board_app/constants/dash_board_constant.dart';
import 'package:draft/apps/dash_board_app/constants/dash_board_responsive.dart';
import 'package:draft/apps/dash_board_app/pages/email/email_screen.dart';
import 'package:draft/apps/dash_board_app/pages/main/components/list_of_emails.dart';
import 'package:draft/apps/dash_board_app/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: ListOfEmails(),
        tablet: Container(
          child: Row(
            children: [
              Expanded(flex: 6, child: ListOfEmails()),
              Expanded(flex: 9, child: EmailScreen())
            ],
          ),
        ),
        desktop: Row(
          children: [
            Expanded(flex: _size.width > 1340 ? 2 : 4, child: SideMenu()),
            Expanded(flex: _size.width > 1340 ? 3 : 5, child: ListOfEmails()),
            Expanded(flex: _size.width > 1340 ? 8 : 10, child: EmailScreen())
          ],
        ),
      ),
    );
  }
}

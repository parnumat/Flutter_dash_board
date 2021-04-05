import 'package:draft/apps/dash_board_app/pages/email/email_screen.dart';
import 'package:draft/apps/dash_board_app/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'components/list_of_emails.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: SideMenu(),
          ),
          Expanded(
            flex: 3,
            child: ListOfEmails(),
          ),
          Expanded(
            flex: 8,
            child: EmailScreen(),
          ),
        ],
      ),
    );
  }
}

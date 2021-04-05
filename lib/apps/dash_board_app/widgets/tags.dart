import 'package:draft/apps/dash_board_app/constants/dash_board_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/Angle down.svg", width: 16),
            SizedBox(width: DashBoardConstant.dPadding / 4),
            SvgPicture.asset("assets/icons/Markup.svg", width: 20),
            SizedBox(width: DashBoardConstant.dPadding / 2),
            Text(
              "Tags",
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: DashBoardConstant.dGrayColor),
            ),
            Spacer(),
            MaterialButton(
              padding: EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: DashBoardConstant.dGrayColor,
                size: 20,
              ),
            )
          ],
        ),
        SizedBox(height: DashBoardConstant.dPadding / 2),
        buildTag(context, color: Color(0xFF23CF91), title: "Design"),
        buildTag(context, color: Color(0xFF3A6FF7), title: "Work"),
        buildTag(context, color: Color(0xFFF3CF50), title: "Friends"),
        buildTag(context, color: Color(0xFF8338E1), title: "Family"),
      ],
    );
  }

  InkWell buildTag(BuildContext context,
      {@required Color color, @required String title}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            DashBoardConstant.dPadding * 1.5, 10, 0, 10),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/Markup filled.svg",
              height: 18,
              color: color,
            ),
            SizedBox(width: DashBoardConstant.dPadding / 2),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: DashBoardConstant.dGrayColor),
            ),
          ],
        ),
      ),
    );
  }
}

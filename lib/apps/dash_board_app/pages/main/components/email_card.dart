import 'package:draft/apps/dash_board_app/constants/dash_board_constant.dart';
import 'package:draft/apps/dash_board_app/constants/dash_board_extension.dart';
import 'package:draft/apps/dash_board_app/models/Email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:websafe_svg/websafe_svg.dart';

class EmailCard extends StatelessWidget {
  const EmailCard({
    Key key,
    this.isActive = true,
    this.email,
    this.press,
  }) : super(key: key);

  final bool isActive;
  final Email email;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: DashBoardConstant.dPadding,
          vertical: DashBoardConstant.dPadding / 2),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(DashBoardConstant.dPadding),
              decoration: BoxDecoration(
                color: isActive
                    ? DashBoardConstant.dPrimaryColor
                    : DashBoardConstant.dBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(email.image),
                        ),
                      ),
                      SizedBox(width: DashBoardConstant.dPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${email.name} \n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive
                                  ? Colors.white
                                  : DashBoardConstant.dTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: email.subject,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      color: isActive
                                          ? Colors.white
                                          : DashBoardConstant.dTextColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            email.time,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: isActive ? Colors.white70 : null,
                                ),
                          ),
                          SizedBox(height: 5),
                          if (email.isAttachmentAvailable)
                            SvgPicture.asset(
                              "assets/icons/Paperclip.svg",
                              color: isActive
                                  ? Colors.white70
                                  : DashBoardConstant.dGrayColor,
                            )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: DashBoardConstant.dPadding / 2),
                  Text(
                    email.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          height: 1.5,
                          color: isActive ? Colors.white70 : null,
                        ),
                  )
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
            ),
            if (!email.isChecked)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: DashBoardConstant.dBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: Offset(2, 2),
                ),
              ),
            if (email.tagColor != null)
              Positioned(
                left: 8,
                top: 0,
                child: SvgPicture.asset(
                  "assets/icons/Markup filled.svg",
                  height: 18,
                  color: email.tagColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}

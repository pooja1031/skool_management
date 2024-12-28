import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';
import 'package:skool_management/widgets/themes/typography/text_styles.dart';
import '../models/role.dart';

class RoleAvatar extends StatelessWidget {
  final Role role;
  final VoidCallback onTap;

  const RoleAvatar({
    super.key,
    required this.role,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              role.iconPath,
              width: 35,
              height: 35,
              color: kcPrimary,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(role.name, style: bodyTextStyle),
      ],
    );
  }
}
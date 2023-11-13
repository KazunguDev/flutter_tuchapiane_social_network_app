import 'package:flutter/material.dart';
import 'package:flutter_tuchapiane_social_network_app/components/user_avatar.dart';
import 'package:flutter_tuchapiane_social_network_app/data/model/user.dart';
import 'package:flutter_tuchapiane_social_network_app/styles/app_colors.dart';
import 'package:flutter_tuchapiane_social_network_app/styles/app_text.dart';

class UserPageItem extends StatelessWidget {
  final User user;
  const UserPageItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Column(
        children: [
          Row(
            children: [
              const UserAvatar(
                size: 50,
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstname} ${user.lastname}',
                    style: AppText.subtitle1.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    user.location?.name ?? '',
                    style: AppText.body2.copyWith(
                      color: AppColors.black,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

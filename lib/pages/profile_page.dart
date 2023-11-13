import 'package:flutter/material.dart';
import 'package:flutter_tuchapiane_social_network_app/components/toolbar.dart';
import 'package:flutter_tuchapiane_social_network_app/components/user_avatar.dart';
import 'package:flutter_tuchapiane_social_network_app/config/app_routes.dart';
import 'package:flutter_tuchapiane_social_network_app/config/app_strings.dart';
import 'package:flutter_tuchapiane_social_network_app/provider/app_repo.dart';
import 'package:flutter_tuchapiane_social_network_app/styles/app_text.dart';
import 'package:provider/provider.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppRepo>().user;
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.profile,
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.editProfile);
                  break;
                case ProfileMenu.logout:
                  print('log out');
                  break;
                default:
              }
            },
            icon: const Icon(Icons.more_vert_rounded),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: ProfileMenu.edit,
                  child: Text(AppStrings.edit),
                ),
                const PopupMenuItem(
                  value: ProfileMenu.logout,
                  child: Text(AppStrings.logout),
                ),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          const UserAvatar(
            size: 90,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            '${user?.id} ${user?.firstname} ${user?.lastname}',
            style: AppText.header2,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Madahascar',
            style: AppText.subtitle3,
          ),
          const SizedBox(
            height: 24,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '472',
                    style: AppText.header2,
                  ),
                  Text(AppStrings.followers),
                ],
              ),
              Column(
                children: [
                  Text(
                    '119',
                    style: AppText.header2,
                  ),
                  Text(AppStrings.posts),
                ],
              ),
              Column(
                children: [
                  Text(
                    '860',
                    style: AppText.header2,
                  ),
                  Text(AppStrings.following),
                ],
              )
            ],
          ),
          const Divider(thickness: 1, height: 24),
        ],
      ),
    );
  }
}

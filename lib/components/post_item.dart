import 'package:flutter/material.dart';
import 'package:flutter_tuchapiane_social_network_app/config/app_config.dart';
import 'package:flutter_tuchapiane_social_network_app/config/app_routes.dart';
import 'package:flutter_tuchapiane_social_network_app/data/model/post.dart';

import '../styles/app_text.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.user);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/temp/user1.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '${post.owner?.firstname} ${post.owner?.lastname}',
                  style: AppText.subtitle3,
                ),
              ],
            ),
            if (post.image != null) ...[
              const SizedBox(
                height: 12,
              ),
              Image.network('${AppConfig.baseUrl}${post.image}'),
            ],
            const SizedBox(
              height: 12,
            ),
            Text(
              post.message ?? '',
              style: AppText.subtitle3,
            )
          ],
        ),
      ),
    );
  }
}

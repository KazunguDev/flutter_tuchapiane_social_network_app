import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tuchapiane_social_network_app/components/app_text_field.dart';
import 'package:flutter_tuchapiane_social_network_app/provider/app_repo.dart';
import 'package:flutter_tuchapiane_social_network_app/provider/post_provider.dart';
import 'package:flutter_tuchapiane_social_network_app/styles/app_colors.dart';
import 'package:flutter_tuchapiane_social_network_app/styles/app_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewPostModal extends StatelessWidget {
  const NewPostModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Insert Message',
            style: AppText.header1,
          ),
          const SizedBox(
            height: 16,
          ),
          AppTextField(
            hint: 'Message...',
            onChange: (value) {
              context.read<PostProvider>().message = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Add Image',
            style: AppText.header1,
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer<PostProvider>(
            builder: (context, value, child) => GestureDetector(
              onTap: () {
                context.read<PostProvider>().pickImage(ImageSource.gallery);
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: value.imagePath == null
                    ? const Center(
                        child: Text('Upload from gallery'),
                      )
                    : ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        child: Stack(
                          children: [
                            Image.file(File(value.imagePath!)),
                            IconButton(
                                onPressed: () {
                                  value.deleteImage();
                                },
                                icon: const Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                ))
                          ],
                        )),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text("OR"),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(onPressed: () {}, child: const Text('Camera')),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<PostProvider>()
                    .createPost(context.read<AppRepo>().token!)
                    .then((value) {
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Create post'))
        ],
      ),
    );
  }
}

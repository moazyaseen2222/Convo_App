import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/theming/app_colors.dart';

class ImageSelectore extends StatelessWidget {
  const ImageSelectore({
    Key? key,
    required this.imageUrl,
    required this.onUpload,
  }) : super(key: key);

  final String? imageUrl;
  final void Function(String imageUrl) onUpload;

  @override
  Widget build(BuildContext context) {
    final supabse = Supabase.instance.client;
    return Stack(
      children: [
        CircleAvatar(
          radius: 100.r,
          backgroundImage:
              imageUrl != null
                  ? NetworkImage(imageUrl!)
                  : AssetImage('images/man.png'),
        ),
        Positioned(
          top: 150.h,
          left: 150.w,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainBlue,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: IconButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image == null) {
                  return;
                }

                final imageExtension = image.path.split('.').last.toLowerCase();
                final imageByte = await image.readAsBytes();

                final userId =
                    supabse.auth.currentUser?.id; // get current userId
                final imagePath = '/$userId/profile'; // image path

                await supabse.storage
                    .from('usersimages')
                    .uploadBinary(
                      imagePath,
                      imageByte,
                      fileOptions: FileOptions(
                        upsert: true,
                        contentType: 'image/$imageExtension',
                      ),
                    );

                String imageUrl = supabse.storage
                    .from('usersimages')
                    .getPublicUrl(imagePath);
                imageUrl =
                    Uri.parse(imageUrl)
                        .replace(
                          queryParameters: {
                            't':
                                DateTime.now().millisecondsSinceEpoch
                                    .toString(),
                          },
                        )
                        .toString();
                onUpload(imageUrl);
              },
              icon: const Icon(Icons.edit, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

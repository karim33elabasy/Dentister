import 'package:dentister/core/utils/app_colors.dart';
import 'package:dentister/core/widgets/patient_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PatientAvatarAddScreen extends StatelessWidget {
  const PatientAvatarAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const PatientCircleAvatar(),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(useSafeArea: true,context: context, builder: (context)=>const GetPhotoBottomSheet());
              },
              splashColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(MediaQuery.sizeOf(context).width*0.025),
                decoration: const BoxDecoration(
                  color: AppColors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.camera_alt, color: Colors.white, size: MediaQuery.sizeOf(context).width*0.04),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GetPhotoBottomSheet extends StatelessWidget {
  const GetPhotoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePicker image = ImagePicker();
    late XFile? selectedImage;
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).width*0.02,
          horizontal: MediaQuery.sizeOf(context).width*0.05
        ),
        child: Column(
          children: [
            InkWell(
              onTap: ()async{
                selectedImage = await image.pickImage(source: ImageSource.gallery);
              },
              child: const ListTile(
                leading: Icon(Icons.photo_camera_front_outlined),
                title: Text("Get photo from gallery"),
              ),
            ),
            InkWell(
              onTap: ()async{
                selectedImage = await image.pickImage(source: ImageSource.camera);
              },
              child: const ListTile(
                leading: Icon(Icons.linked_camera_outlined),
                title: Text("Take a photo"),
              ),
            ),
          ],
        ),
      )
    );

  }
}

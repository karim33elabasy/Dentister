import 'package:dentister/core/utils/app_colors.dart';
import 'package:dentister/core/widgets/patient_circle_avatar.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PatientAvatarAddScreen extends StatelessWidget {
  const PatientAvatarAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PatientCubit cubit = BlocProvider.of<PatientCubit>(context);
    return Center(
      child: Stack(
        children: [
          BlocBuilder<PatientCubit,PatientStates>(
            builder: (context,state) {
              return PatientCircleAvatar(color: cubit.color,);
            }
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(useSafeArea: true,context: context, builder: (context)=> GetPhotoBottomSheet(cubit: cubit));
              },
              splashColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(MediaQuery.sizeOf(context).width*0.025),
                decoration: const BoxDecoration(
                  color: AppColors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.color_lens_outlined, color: Colors.white, size: MediaQuery.sizeOf(context).width*0.04),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GetPhotoBottomSheet extends StatelessWidget {
  final PatientCubit cubit;
  const GetPhotoBottomSheet({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).width*0.02,
          horizontal: MediaQuery.sizeOf(context).width*0.05
        ),
        child: BlockPicker(
          onColorChanged: (selectedColor){
            cubit.setColor(selectedColor);
            },
          pickerColor: cubit.color,

        ),
      )
    )
    ;

  }
}

// Column(
// children: [
// InkWell(
// onTap: ()async{
// selectedImage = await image.pickImage(source: ImageSource.gallery);
// },
// child: const ListTile(
// leading: Icon(Icons.photo_camera_front_outlined),
// title: Text("Get photo from gallery"),
// ),
// ),
// InkWell(
// onTap: ()async{
// selectedImage = await image.pickImage(source: ImageSource.camera);
// },
// child: const ListTile(
// leading: Icon(Icons.linked_camera_outlined),
// title: Text("Take a photo"),
// ),
// ),
// ],
// )

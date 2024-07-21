import 'dart:io';
import 'package:dentister/core/widgets/my_tff.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/patient_avatar_add_screen.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPatientBody extends StatelessWidget {
  const AddPatientBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.045,
        vertical: MediaQuery.sizeOf(context).width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PatientAvatarAddScreen(),
          const SectionTitle(title: "Personal Information"),
          MyTff(
            obscureText: false,
            label: "Patient ID",
            controller: TextEditingController(),
            minLines: 1,
            maxLines: 1,
            enabled: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Current Patient ?",style: TextStyle(fontSize: width*0.04),),
              Switch(value: true, onChanged: (value){})
            ],
          ),
          SizedBox(height: width*0.05,),
          TabBarView(
              children: [
            Container(height: 60,width: 60,color: Colors.yellow,),
            Container(height: 60,width: 60,color: Colors.red,),
            Container(height: 60,width: 60,color: Colors.green,),
          ])
        ],
      ),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () async {
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      _imageFile = image;
                    });
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                onTap: () async {
                  final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() {
                      _imageFile = image;
                    });
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: _imageFile != null
              ? FileImage(File(_imageFile!.path))
              : AssetImage('assets/default_profile_picture.png'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              _showBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}

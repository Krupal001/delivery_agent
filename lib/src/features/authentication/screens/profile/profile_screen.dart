import "dart:io";

import "package:delivery_agent/src/features/authentication/screens/profile/update_profile_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:line_awesome_flutter/line_awesome_flutter.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../../../constants/image_strings.dart";
import "../../../../constants/strings.dart";
import "../../../../repository/authentication_repository.dart";
import "../../../../utils/theme/colors/colors.dart";
import "../../controllers/signup_controller.dart";
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;

  @override
  void initState() {
    super.initState();
    _loadImageFromPreferences();
  }


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile, style: Theme
            .of(context)
            .textTheme
            .headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [

              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: selectedImage != null
                          ? Image.file(
                        File(selectedImage!.path),
                        fit: BoxFit.cover,
                      )
                          : const Image(image: AssetImage(tProfileImage)),),

                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: tThemeMain),
                      child: IconButton(
                        color: Colors.white,
                        icon: const Icon(LineAwesomeIcons.alternate_pencil,),
                        onPressed: () {
                          _pickImage();
                        },
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 10),
              Text(controller.name.text, style: Theme
                  .of(context)
                  .textTheme
                  .headline4),
              Text(controller.email.text, style: Theme
                  .of(context)
                  .textTheme
                  .bodyText2),
              const SizedBox(height: 40),

              /// -- BUTTON
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tThemeMain,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                      tEditProfile, style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              SizedBox(
                height: 40,
                width: 190,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tThemeMain,

                  ),
                  onPressed: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () =>
                              AuthenticationRepository.instance.logout(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(
                          onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }, child: const Text('Logout', style: TextStyle(
                  color: Colors.white,
                ),),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
      _saveImageToPreferences(pickedImage.path);
    }
  }

  Future<void> _saveImageToPreferences(String imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selected_image', imagePath);
  }

  Future<void> _loadImageFromPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? imagePath = prefs.getString('selected_image');
    if (imagePath != null) {
      setState(() {
        selectedImage = XFile(imagePath);
      });
    }
  }
}
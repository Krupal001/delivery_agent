import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/strings.dart';
import '../../../../utils/theme/colors/colors.dart';
import '../../controllers/profile_controller.dart';
import '../../models/users_models.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tEditProfile, style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
            builder: (context,snapshot){
              if(snapshot.connectionState== ConnectionState.done){
                  if(snapshot.hasData){
                    UserModel userdata=snapshot.data as UserModel;
                    return  Column(
                      children: [
                        // -- IMAGE with ICON
                        const SizedBox(height: 50),

                        // -- Form Fields
                        Form(
                          child: Column(
                            children: [
                              TextFormField(

                                initialValue: userdata.name,
                                decoration: const InputDecoration(
                                    border:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15),)),
                                    label: Text("Name"), prefixIcon: Icon(LineAwesomeIcons.user)),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                initialValue: userdata.email,
                                decoration: const InputDecoration(
                                    border:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15),)),

                                    label: Text(tEmail), prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                initialValue: userdata.phone,
                                decoration: const InputDecoration(
                                    border:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15),)),

                                    label: Text("Phone no"), prefixIcon: Icon(LineAwesomeIcons.phone)),
                              ),
                              const SizedBox(height:  20),
                              TextFormField(
                                initialValue: userdata.password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)),

                                  label: const Text("Password"),
                                  prefixIcon: const Icon(Icons.fingerprint),
                                  suffixIcon:
                                  IconButton(icon: const Icon(LineAwesomeIcons.eye_slash), onPressed: () {}),
                                ),
                              ),
                              const SizedBox(height: 30),

                              // -- Form Submit Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: tThemeMain,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  child: const Text(tEditProfile, style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              const SizedBox(height: 30),

                              // -- Created Date and Delete Button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                                        elevation: 0,
                                        foregroundColor: Colors.red,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none),
                                    child: const Text("Delete"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),);
                  }
                  else{
                    return const Center(child: Text("Something went Wrong"),);
                  }
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            }, future: controller.getUserData(),
          ),
        ),
      ),
    );
  }
}


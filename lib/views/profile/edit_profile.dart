import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:order_food/controller/auth_controller.dart';
import 'package:order_food/models/profile.model.dart';
import 'package:order_food/views/profile/profile_page.dart';
import 'package:order_food/views/tabview/main_tabview.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../common/color.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  
  TextEditingController phoneController = TextEditingController();
  // bool isLoading = false;
  // final ImagePicker _picker = ImagePicker();
  // File? selectedImage;
  // Future getImage(ImageSource source) async {
  //   final XFile? image = await _picker.pickImage(source: source);
  //   if (image != null) {
  //     selectedImage = File(image.path);
  //     setState(() {});
  //   } else {
  //     print('No Image');
  //   }
  // }
  String uid = FirebaseAuth.instance.currentUser!.uid;
  final AuthController _authController = AuthController();
  XFile? file;
  Uint8List? _image;
   
  Country selectedCountry = Country(
      phoneCode: "7",
      countryCode: "RU",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Russia",
      example: "Russia",
      displayName: "Russia",
      displayNameNoCountryCode: "RU",
      e164Key: "");

  
  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  selectGalleryImage()async{
    Uint8List imgGal = await _authController.pickProfileImage(ImageSource.gallery);
    setState(() {
      _image = imgGal;
    });
  }

  selectCameraImage()async{
    Uint8List imgGal = await _authController.pickProfileImage(ImageSource.camera);
    setState(() {
      _image = imgGal;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: (){
                            selectCameraImage();
                          }, 
                          child: const Icon(Icons.camera)
                        ),
                        TextButton(
                          onPressed: (){
                            selectGalleryImage();
                          }, 
                          child: const Icon(Icons.browse_gallery)
                        )
                      ],
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Name!!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Name',
                                labelStyle:
                                    TextStyle(color: ExtensionColor.primary),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            
                            TextFormField(
                              controller: phoneController,
                              autocorrect: false,
                              obscureText: false,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              onChanged: (value) {
                                setState(() {
                                  phoneController.text = value;
                                });
                              },
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Phone!!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Phone',
                                labelStyle:
                                    TextStyle(color: ExtensionColor.primary),
                                prefixIcon: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 5),
                                  child: InkWell(
                                    onTap: () {
                                      showCountryPicker(
                                          context: context,
                                          countryListTheme:
                                              const CountryListThemeData(
                                                  bottomSheetHeight: 500),
                                          onSelect: (val) {
                                            setState(() {
                                              selectedCountry = val;
                                            });
                                          });
                                    },
                                    child: Text(
                                      "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                suffixIcon: phoneController.text.length > 9
                                    ? Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        height: 10,
                                        width: 10,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green),
                                        child: const Icon(
                                          Icons.done,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        if (_formKey.currentState!.validate()) {
                          final String name = nameController.text;
                          final String phone = phoneController.text;
                          FirebaseFirestore.instance.collection("users").doc(uid).update({
                            'name': name,
                            'phone': phone,
                          }).then((value) { 
                            Get.to(() => MainTabView());
                          });
                          Get.snackbar('Success', 'Profile is saved');
                        } else {
                          print('invalid');
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

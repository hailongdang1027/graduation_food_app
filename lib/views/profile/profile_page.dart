import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/views/login_pass/login_page.dart';
import 'package:order_food/views/profile/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  void initState(){
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: ExtensionColor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                    //   Navigator.push(context, 
                    //   MaterialPageRoute(builder: (context) => CartPage(),)
                    // );
                    }, 
                    icon: Image.asset("assets/img/shopping_cart.png",
                    width: 25,
                    height: 25,
                  ))
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image:const DecorationImage(
                    image: AssetImage('assets/img/user_profile.png'),
                    fit: BoxFit.fill
                  ),
                  color: ExtensionColor.placeholder,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 5,),
              Text(user.email!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
              const SizedBox(height: 5,),
              TextButton.icon(
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) {
                      return const EditProfile();
                    },)
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: ExtensionColor.primary,
                  size: 12,
                ),
                label: Text(
                  "Edit",
                  style: TextStyle(color: ExtensionColor.primary, fontSize: 12),
                ),
              ),

              StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasData) {
                      var profileData = snapshot.data!.data() as Map<String, dynamic>;
                        return Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Text(profileData['name']??'', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Text(profileData['phone']??'', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      }else if(!snapshot.hasData){
                        return Center(
                          child: Text('Error${snapshot.error}')
                        );
                      }
                    return const Center(
                      child: CircularProgressIndicator(),
                    ); 
                  },
                  
                ),
              
              TextButton(
                onPressed: ()async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, 
                    MaterialPageRoute(builder: (context) => LoginPage())
              );
                }, 
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    color: ExtensionColor.secondaryText, fontSize: 11, fontWeight: FontWeight.w500
                  ),
                )
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
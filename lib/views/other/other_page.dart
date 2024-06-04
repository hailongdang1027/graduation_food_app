import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/views/chat/chat_view.dart';
import 'package:order_food/views/other/address_info.dart';
import 'package:order_food/views/other/address_view.dart';
import 'package:order_food/views/other/payment_page.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  List moreInfo = [
    {
      "index": "1",
      "name": "Payment",
      "image": "assets/img/more_payment.png"
    },
    {
      "index": "2",
      "name": "Notifications",
      "image": "assets/img/more_notification.png"
    },
    {
      "index": "3",
      "name": "Chat",
      "image": "assets/img/more_inbox.png"
    },
    {
      "index": "4",
      "name": "Map",
      "image": "assets/img/address.png"
    },
    {
      "index": "5",
      "name": "Address",
      "image": "assets/img/address.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Other",
                  style: TextStyle(
                    color: ExtensionColor.primaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.w800
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: moreInfo.length,
                itemBuilder: (_, index){
                  var mObj = moreInfo[index] as Map? ?? {};
                  return InkWell(
                    onTap: (){
                      switch (mObj["index"].toString()){
                        case "1":
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) {
                                return const PaymentPage();
                              }
                            )
                          );
                          break;
                        case "2":
                          const message = RemoteMessage();
                          Navigator.pushReplacement(
                            
                            context, 
                            MaterialPageRoute(
                              builder: (context) {
                                return Container();
                              }
                            )
                          );
                          break;
                        case "3":
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) {
                                return const ChatView();
                              }
                            )
                          );
                          break;
                        case "4": 
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) {
                                return const AddressView();
                              }
                            )
                          );

                        case "5": 
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) {
                                return const AddressInfo();
                              }
                            )
                          );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                            decoration: BoxDecoration(
                              color: ExtensionColor.textfield,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: ExtensionColor.textfield,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    mObj["image"].toString(),
                                    width: 40,
                                    height: 40,
                                    color: ExtensionColor.primaryText,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    mObj["name"].toString(),
                                    style: TextStyle(
                                      color: ExtensionColor.primaryText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800
                                    ),
                                  ),
                                )
                                
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ExtensionColor.textfield,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.asset(
                              "assets/img/btn_next.png",
                              width: 10,
                              height: 10,
                              color: ExtensionColor.primaryText,
                            )
                          ),
                        ],
                      ),
                    )
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
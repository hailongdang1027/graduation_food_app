import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/controller/auth_controller.dart';
import 'package:order_food/views/common_widget/round_icon_btn.dart';
import 'package:order_food/views/other/card_detail_view.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthController authController = Get.find<AuthController>();
  var _currentValuePage = 0.0;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  

  

  @override
  void initState() {
    authController.getUserCards(); 
    pageController.addListener(() {
      setState(() {
        _currentValuePage = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/img/btn_back.png",
                          width: 20,
                          height: 20,
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "Payment Methods",
                        style: TextStyle(
                            color: ExtensionColor.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CartPage()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text(
                  "Choose your payment method",
                  style: TextStyle(
                      color: ExtensionColor.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(
                  color: ExtensionColor.secondaryText.withOpacity(0.4),
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => Container(
                  height: 180,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: authController.userCard.length,
                      itemBuilder: (context, index) {
                        try {
                          cardNumber = authController.userCard.value[index].get('number');
                        } catch (e) {
                          cardNumber = '';
                        }

                        try {
                          cardHolderName = authController.userCard.value[index].get('name');
                        } catch (e) {
                          cardHolderName = '';
                        }

                        try {
                          expiryDate = authController.userCard.value[index].get('expiry');
                        } catch (e) {
                          expiryDate = '';
                        }

                        try {
                          cvvCode = authController.userCard.value[index].get('cvv');
                        } catch (e) {
                          cvvCode = '';
                        }
                        return pagePaymentItem(index);
                      }),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ExtensionColor.textfield,
                    ),
                    child: TextButton(onPressed: () {}, child: const Text("Google Pay")),
                  ),
                  Container(
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ExtensionColor.textfield,
                    ),
                    child: TextButton(onPressed: () {}, child: const Text("Paypal")),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundIconBtn(
                    title: "Add other card",
                    icon: "assets/img/add.png",
                    color: ExtensionColor.primary,
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return const CardDetailView();
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pagePaymentItem(int index) {
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      isHolderNameVisible: true,
      cvvCode: cvvCode,
      showBackView: isCvvFocused,
      onCreditCardWidgetChange: (p0) {},
    );
  }
}

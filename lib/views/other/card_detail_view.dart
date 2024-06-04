import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:order_food/controller/auth_controller.dart';

class CardDetailView extends StatefulWidget {
  const CardDetailView({super.key});

  @override
  State<CardDetailView> createState() => _CardDetailViewState();
}

class _CardDetailViewState extends State<CardDetailView> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? isChecked = false;
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              isHolderNameVisible: true,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),
            const SizedBox(
              height: 5,
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              obscureCvv: true,
              obscureNumber: true,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: _formKey),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: ()async {
                    if (_formKey.currentState!.validate()) {
                      print('valid!');
                      await authController.storeUserCard(cardNumber, expiryDate, cvvCode, cardHolderName);
                      Get.snackbar('Success', 'Card is saved');
                    }else{
                      print('invalid');
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// packages
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:fooddeliveryapp/components/custom_material_button.dart';
import 'package:fooddeliveryapp/pages/bill_page.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPage();
}

class _PaymentPage extends State<PaymentPage> {
  final cardNumber = TextEditingController();
  final expiryDate = TextEditingController();
  final cardHolderName = TextEditingController();
  final cvvCode = TextEditingController();

  bool isCvvFocused = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cardNumber.dispose();
    expiryDate.dispose();
    cardHolderName.dispose();
    cvvCode.dispose();
    super.dispose();
  }

  final _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CreditCardWidget(
              enableFloatingCard: true,

              cardNumber: cardNumber.text,
              expiryDate: expiryDate.text,
              cardHolderName: cardHolderName.text,
              isHolderNameVisible: true,
              cvvCode: cvvCode.text,

              showBackView:
                  isCvvFocused, //true when you want to show cvv(back) view

              onCreditCardWidgetChange:
                  (
                    CreditCardBrand brand,
                  ) {}, // Callback for anytime credit card brand is changed
            ),

            CreditCardForm(
              cardNumber: cardNumber.text,
              expiryDate: expiryDate.text,
              cardHolderName: cardHolderName.text,
              isCardHolderNameUpperCase: true,
              isHolderNameVisible: true,
              cvvCode: cvvCode.text,
              inputConfiguration: const InputConfiguration(
                cardNumberDecoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                ),
                expiryDateDecoration: InputDecoration(
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: InputDecoration(
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: InputDecoration(labelText: 'Card Holder'),
              ),
              onCreditCardModelChange: onCreditCardModelChange,
              formKey: _FormKey,
            ),

            Container(
              margin: EdgeInsets.only(top: 40, bottom: 25, left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: CustomMaterialButton(
                      onPressed: _onValidate,
                      btnTitle: "Pay Now",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onValidate() {
    if (_FormKey.currentState?.validate() ?? false) {
      print('valid!');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text('Confirm Payment'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Card Number: ${cardNumber.text}'),
                Text('Expiry Date: ${expiryDate.text}'),
                Text('Card Holder Name: ${cardHolderName.text}'),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => BillPage()));
                },
                child: Text("Confirm Payment"),
              ),
            ],
          );
        },
      );
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber.text = creditCardModel.cardNumber;
      expiryDate.text = creditCardModel.expiryDate;
      cardHolderName.text = creditCardModel.cardHolderName;
      cvvCode.text = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

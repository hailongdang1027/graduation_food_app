import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/config/config.dart';
import 'package:order_food/models/address.dart';
import 'package:order_food/models/cart.dart';
import 'package:order_food/provider/provider.dart';
import 'package:order_food/views/other/address_info.dart';

class OrderDetail extends ConsumerStatefulWidget {
  const OrderDetail({super.key});

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends ConsumerState<OrderDetail> {
  String? selectedValue;
  List<String> listOptions = [
    'Cash on delivery',
    'Card',
    'Google Pay',
    'Stripe'
  ];
  Address? selectedAddress;

  void handleOrder() {
    if (selectedValue == null ||  selectedAddress == null) {
      ref.read(cartItemsProvider.notifier).cleanCart();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a payment method and an address")),
      );
      return;
    }
    switch (selectedValue) {
      case 'Cash on delivery':
        Navigator.of(context).pushNamed("/success");
        break;
      case 'Card':
        // Xử lý khi chọn thanh toán bằng thẻ
        break;
      case 'Google Pay':
        // Xử lý khi chọn thanh toán bằng Google Pay
        break;
      case 'Stripe':
        // Xử lý khi chọn thanh toán bằng Stripe
        break;
      default:
        // Xử lý khi không chọn phương thức thanh toán
        break;
    }
  }

  TextEditingController textAddressClient = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Infomation",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          width: media.width,
          height: media.height,
          decoration: BoxDecoration(
              color: ExtensionColor.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: _detailUI(ref),
        ),
      ),
    );
  }

  Widget? _detailUI(WidgetRef ref) {
    
    final cartProvider = ref.watch(cartItemsProvider);
    if (cartProvider.cartModel != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Total ",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "${cartProvider.cartModel!.grandTotal.toString()} ${Config.currency}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.green),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Choose method paying",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          DropdownButtonFormField<String>(
            value: selectedValue,
            hint: const Text("Select payment method"),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            items: listOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(selectedAddress?.city ?? 'Select an address'),
            subtitle: Text(selectedAddress != null ? '${selectedAddress!.house}, ${selectedAddress!.street}' : 'Tap to select'),
            onTap: () async {
              final Address? address = await Navigator.push<Address>(
                context,
                MaterialPageRoute(builder: (context) => const AddressInfo())
              );
              if (address != null) {
                setState(() {
                  selectedAddress = address;
                });
              }
            },
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: handleOrder, child: const Text("Order")),
              )
            ],
          )
        ],
      );
    }
    return null;
  }
}

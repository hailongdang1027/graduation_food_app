import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/models/address.dart';
import 'package:order_food/provider/provider.dart';

class AddressInfo extends ConsumerWidget {
  const AddressInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAddr = ref.watch(addressNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address Infomations"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: stateAddr.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : stateAddr.addressModel == null || stateAddr.addressModel!.isEmpty
              ? Text("No address found")
              : ListView.builder(
                  itemCount: stateAddr.addressModel!.length,
                  itemBuilder: (context, index) {
                    final addressInfo = stateAddr.addressModel![index];
                    return Card(
                      child: ListTile(
                        title: Text(addressInfo.city),
                        subtitle:
                            Text('${addressInfo.house}, ${addressInfo.street}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () =>
                                    _editAddress(context, addressInfo, addressInfo.addressId, ref),
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () =>
                                    _removeAddress(context, addressInfo.addressId, ref),
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                        onTap: () => _selectAddress(context, addressInfo),
                      ),
                    );
                  }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addAddress(context, ref),
        tooltip: 'Add address',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addAddress(BuildContext context, WidgetRef ref) {
    TextEditingController cityController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController houseController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Address"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: cityController,
                decoration: const InputDecoration(labelText: "City"),
              ),
              TextField(
                controller: streetController,
                decoration: const InputDecoration(labelText: "Street"),
                  ),
              TextField(
                controller: houseController,
                decoration: const InputDecoration(labelText: "House Number"),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                // Gọi API thêm địa chỉ
                final addressViewModel = await ref.read(addressNotifierProvider.notifier);
                addressViewModel.addAddress(
                  cityController.text,
                  houseController.text,
                  streetController.text,
                );
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _editAddress(BuildContext context, Address addressInfo, String id, WidgetRef ref) {
    TextEditingController cityController = TextEditingController(text: addressInfo.city);
    TextEditingController streetController = TextEditingController(text: addressInfo.street);
    TextEditingController houseController = TextEditingController(text: addressInfo.house);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Address"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: cityController,
                decoration: const InputDecoration(labelText: "City"),
              ),
              TextField(
                controller: streetController,
                decoration: const InputDecoration(labelText: "Street"),
              ),
              TextField(
                controller: houseController,
                decoration: const InputDecoration(labelText: "House Number"),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                final addressViewModel = await ref.read(addressNotifierProvider.notifier);
                addressViewModel.updateAddress(
                  id,
                  cityController.text,
                  houseController.text,
                  streetController.text
                );
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void _removeAddress(BuildContext context, String addressId, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete this address?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              final addressViewModel = await ref.read(addressNotifierProvider.notifier);
              addressViewModel.removeAddress(addressId);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _selectAddress(BuildContext context, Address addressInfo) {
    
    Navigator.of(context).pop(addressInfo);
    print("Selected Address: ${addressInfo.city}");
  }
}

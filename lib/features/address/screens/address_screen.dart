import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/Provider.dart';
import '../../../common/widgets/Custom_buton.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = "/address";

  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  List<PaymentItem> paymentItems = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pinCodeController.dispose();
    cityController.dispose();
  }

  void onApplePayResult(res) {}

  void onGooglePayResult(res) {}

  @override
  Widget build(BuildContext context) {
    // var address = context.watch<UserProvider>().user.address;
    var address = 'Damak, Jhapa Nepal';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: "Flat, House no, Building",
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: areaController,
                      hintText: "Area, Street",
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: pinCodeController,
                      hintText: "Pin Code",
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: cityController,
                      hintText: "Town/city",
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              ApplePayButton(
                width: double.infinity,
                style: ApplePayButtonStyle.whiteOutline,
                type: ApplePayButtonType.buy,
                paymentConfigurationAsset: 'applepay.json',
                onPaymentResult: onApplePayResult,
                paymentItems: paymentItems,
                margin: const EdgeInsets.only(top: 15),
                height: 50,
              ),

              const SizedBox(height: 15),
              GooglePayButton(
                style: GooglePayButtonStyle.black,
                type: GooglePayButtonType.buy,
                  paymentConfigurationAsset: 'gpay.json',
                  onPaymentResult: onGooglePayResult,
                  paymentItems: paymentItems,
                margin: const EdgeInsets.only(top: 15),
                height: 50,
              loadingIndicator: const Center(
                child: CircularProgressIndicator(),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//9:20:31

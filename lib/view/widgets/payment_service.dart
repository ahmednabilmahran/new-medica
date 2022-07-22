import 'dart:convert';
import 'dart:ffi';

import 'package:medica/providers/auth_provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  final int amount;
  final String url;
  PaymentService({
    this.amount = 10,
    this.url = '',
  });
  static init() {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey:
            'pk_test_51LNyfUBGTJnHZtyZWikWllqrNLMN23oltsvjoCon0pA1fmxyLZuAlg3DPO7FStnWJCp5jXhWVfTexlM4oepMPLho00DojWK5X8',
        androidPayMode: 'test',
        merchantId: 'test',
      ),
    );
  }

  Future<PaymentMethod?> createPaymentMethod() async {
    print('The transaction amount to be charged is: $amount');
    PaymentMethod paymentMethod =
        await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );
    return paymentMethod;
  }

  Future<void> processPayment(PaymentMethod paymentMethod) async {
    final http.Response response = await http.post(
        Uri.parse('$url?amount=$amount&currency=EGP&paym=${paymentMethod.id}'));
    if (response.body != 'error') {
      final paymentIntent = jsonDecode(response.body);
      final status = paymentIntent['paymentIntent']['status'];
      if (status == 'succeeded') {
        print(
            'Payment complete. ${paymentIntent['paymentIntent']['amount'].toString()}');
      } else {
        print('Payment failed.');
      }
    }
  }
}

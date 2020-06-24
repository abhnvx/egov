import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class carousel extends StatefulWidget {
  @override
  _Paymentstate createState() =>  _Paymentstate();
}

class _Paymentstate extends State<carousel> {
  int totalAmount = 0;
  Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay= Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async{
      var options = {
        'key': 'rzp_test_tmQrb3JGfhKOqP',
        'amount': totalAmount*100,
        'name' : 'PM Cares Fund',
        'description' : 'Donation',
        'prefill' : {'contact': '', 'email' : ''},
        'external' : {
          'wallets' : ['paytm']
        }
      };

      try{
        _razorpay.open(options);
      }
      catch(e){
        debugPrint(e);
      }
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "Success" + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "Failure" + response.code.toString() + '.' + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet" + response.walletName);
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Donate for PM Cares Funds"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LimitedBox(
             maxWidth: 150.0,
              child: TextField(
                keyboardType:TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter an Amount to Donate."
                ),
                onChanged: (value){
                  setState(() {
                    totalAmount = num.parse(value);
                     });
                },
              ),
            ),

            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              color: Color(0xff3090C7),
              child: Text(
                "Make Payment",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: (){
                openCheckout();
              },
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CustomRegisterNow extends StatelessWidget {
  const CustomRegisterNow({super.key,required this.haveAccount,required this.loginNow,required this.onTap});
final String haveAccount;
final String loginNow;
final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text(
          haveAccount,
          style:Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ) ,
        ),
        TextButton(
            onPressed:onTap,
            child: Text(
              loginNow,
              style:Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ) ,
            ),
        ),

      ],
    );
  }
}

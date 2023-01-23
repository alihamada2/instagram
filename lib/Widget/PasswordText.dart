import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
class Passwordfield extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String?hintText;

  Passwordfield({
    this.controller,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Container(
        width: 290,
        child: TextFormField(
            validator: (value) {return value!.length < 8 ? "Enter at least 6 characters": null;},
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              hintText: hintText,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(66),

              ),

            )
        ),
      ),
    );
  }
}

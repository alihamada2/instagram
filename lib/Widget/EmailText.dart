import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
class Emailfield extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String?hintText;

Emailfield({
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
            validator: (value) {
              return value != null && !EmailValidator.validate(value) ? "Enter a valid email" : null;},
            autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
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

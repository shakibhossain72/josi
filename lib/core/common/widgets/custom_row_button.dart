import 'package:flutter/cupertino.dart';

import 'custom_outline_button.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: CustomOutlineButton(
              onPressed: () {

              },))
      ],
    );
  }
}

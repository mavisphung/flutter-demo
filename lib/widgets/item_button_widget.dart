import 'package:flutter/material.dart';

class ItemButtonWidget extends StatefulWidget {
  final Future Function()? onPressed;
  final bool isDisable;
  const ItemButtonWidget({Key? key, this.onPressed, this.isDisable = false})
      : super(key: key);

  @override
  State<ItemButtonWidget> createState() => _ItemButtonWidgetState();
}

class _ItemButtonWidgetState extends State<ItemButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        alignment: Alignment.center,
        elevation: MaterialStateProperty.all(12.5),
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
      ),
      onPressed: widget.isDisable ? () {} : widget.onPressed,
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: camel_case_types
class leadingButtons {
  Color secondaryColor;

  leadingButtons({
    this.secondaryColor = Colors.white,
  }) {}

  // ignore: non_constant_identifier_names
  Widget Empty() {
    return null;
  }

  // ignore: non_constant_identifier_names
  Widget Back() {
    return BackButton(
      color: secondaryColor,
    );
  }

  // ignore: non_constant_identifier_names
  Widget Space({secondaryColor}) {
    return Opacity(
      opacity: 0.0,
      child: Icon(Icons.no_food),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Refresh(Function onPressed,) {
    return IconButton(
      onPressed: () => {onPressed()},
      icon: Icon(
        Icons.refresh,
        color: secondaryColor,
      ),
    );
  }
}



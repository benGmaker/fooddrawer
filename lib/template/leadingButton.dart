import 'package:flutter/material.dart';

class leadingButtons {
  Color secondaryColor;

  leadingButtons({
    this.secondaryColor = Colors.white,
  }) {}

  Widget Empty() {
    return null;
  }

  Widget Back() {
    return BackButton(
      color: secondaryColor,
    );
  }

  Widget Space({secondaryColor}) {
    return Opacity(
      opacity: 0.0,
      child: Icon(Icons.no_food),
    );
  }

  Widget Refresh(
    Function onPressed,
  ) {
    return IconButton(
      onPressed: () => {onPressed()},
      icon: Icon(
        Icons.refresh,
        color: secondaryColor,
      ),
    );
  }



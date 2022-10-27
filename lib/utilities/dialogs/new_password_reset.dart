import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

import 'generic_dialog.dart';

Future<bool> showNewPasswordResetDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.updated,
    title: "Code has been sent to reset a new password!",
    content:
        "You'll shorthly receive an email with a code to setup a new password.",
    optionsBuilder: () => {
      "Done": true,
    },
  ).then(
    (value) => value ?? false,
  );
}

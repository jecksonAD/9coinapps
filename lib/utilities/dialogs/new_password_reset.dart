import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

import 'generic_dialog.dart';

Future<bool> showNewPasswordResetDialog(BuildContext context,bool isChangePassword) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.updated,
    title: isChangePassword ? "Successfully updated your password" : "Code has been sent to reset a new password!",
    content: isChangePassword ? "" : "You'll shorthly receive an email with a code to setup a new password.",
    optionsBuilder: () => {
      "Done": true,
    },
  ).then(
    (value) => value ?? false,
  );
}

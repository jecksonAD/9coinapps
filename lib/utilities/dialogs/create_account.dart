import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

import 'generic_dialog.dart';

Future<bool> showCreateAccountDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.updatedDetails,
    title: "Create your your Account?",
    content: "Lorem Ipsum is simply dummy text of the printing and types.",
    optionsBuilder: () => {
      "Cancel": false,
      "Confirm": true,
    },
  ).then(
    (value) => value ?? false,
  );
}

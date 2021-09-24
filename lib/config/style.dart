import 'package:flutter/material.dart';

ButtonStyle primaryButton = ElevatedButton.styleFrom(
    primary: Colors.red, // background
    onPrimary: Colors.white, // foreground
    padding: const EdgeInsets.all(8));

ButtonStyle primaryOutlineButton = OutlinedButton.styleFrom(
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4))),
  side: const BorderSide(width: 1, color: Colors.black54),
  padding: const EdgeInsets.all(15),
);

TextStyle textBold(BuildContext context) => Theme.of(context)
    .textTheme
    .bodyText2!
    .copyWith(fontWeight: FontWeight.bold);

TextStyle textLight(BuildContext context) =>
    Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white);

TextStyle textBoldLight(BuildContext context) => Theme.of(context)
    .textTheme
    .bodyText2!
    .copyWith(fontWeight: FontWeight.bold, color: Colors.white);

TextStyle textPageTitle(BuildContext context) => Theme.of(context)
    .textTheme
    .headline5!
    .copyWith(fontWeight: FontWeight.bold);

TextStyle textCardTitle(BuildContext context) => Theme.of(context)
    .textTheme
    .bodyText1!
    .copyWith(fontWeight: FontWeight.bold, fontSize: 18);

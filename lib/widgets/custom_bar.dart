import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar buildAppBar(BuildContext context,
    {List<Widget>? actions, Widget? leading}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: leading,
    actions: actions,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}

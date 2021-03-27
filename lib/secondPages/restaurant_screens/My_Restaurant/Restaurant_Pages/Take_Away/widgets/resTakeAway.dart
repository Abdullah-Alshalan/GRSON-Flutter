import 'package:GRSON/secondPages/theme/Theme.dart';
import 'package:flutter/material.dart';

class ResTakeAway extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
        child: InkWell(
            child: Row(
          children: [
            Expanded(child: Text("double burger ")),
            Expanded(
                child: TextButton(
                    child: Text("Delete ".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(ArgonColors.error),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () => null)),
          ],
        )));
  }
}

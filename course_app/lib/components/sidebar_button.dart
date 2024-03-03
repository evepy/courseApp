import 'package:flutter/material.dart';
import '../constants.dart';
class SidebarButton extends StatelessWidget {
  const SidebarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print("Sidebar button pressed");
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: const BoxConstraints(
        maxHeight: 40.0,
        maxWidth: 40.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: [
              const BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16.0,
              )
            ]),
        child: Image.asset(
          'asset/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
      ),
    );
  }
}
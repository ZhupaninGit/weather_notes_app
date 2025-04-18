import 'package:flutter/material.dart';

class CustomSnackBar {
  void showCustomSnackBar(BuildContext context,String message,bool isError) {
    if (!context.mounted) {
      return; 
    }
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? const Color(0xFFFF6E4E) : Theme.of(context).colorScheme.primary,
        content: Row(
          children: [
            Icon(isError ?  Icons.error_rounded : Icons.done_rounded),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Color.fromARGB(115, 255, 255, 255)),
                softWrap: true, 
                overflow: TextOverflow.fade, 
              ),
            ),
          ],
        ),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(14),
        ),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}


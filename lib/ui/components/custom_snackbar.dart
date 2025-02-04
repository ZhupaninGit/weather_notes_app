import 'package:flutter/material.dart';

class CustomSnackBar {
  void showCustomSnackBar(BuildContext context,String message,bool isError) {
    if (!context.mounted) {
      return; 
    }
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Color(0xFFFF6E4E) : Color.fromARGB(255, 78, 255, 161),
        content: Row(
          children: [
            Icon(isError ? Icons.error_rounded : Icons.done_rounded),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.black45),
                softWrap: true, 
                overflow: TextOverflow.fade, 
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}


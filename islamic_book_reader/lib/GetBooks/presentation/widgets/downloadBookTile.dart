import 'package:flutter/material.dart';

class DownloadBookTile extends StatelessWidget{
  final String bookName;
  final VoidCallback onTap;
  const DownloadBookTile({Key? key, required this.bookName, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Border color
                  width: 1.0, // Border width
                ),
              ),
            ),
      child: Row(
        children: [
          Text(bookName),
          Spacer(),
          InkWell(
            child: IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.download),
            ),
          )
        ],
      )
    );
  }
}
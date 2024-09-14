import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {  
  const BookCard({
    required this.callback,
    required this.text,
    required this.path
  });

  final String text;
  final VoidCallback callback;
  final String path;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    double height = MediaQuery.of(context).size.height * 0.4;
    return Container(
      width: width,
      height: height,
      
      decoration: BoxDecoration(borderRadius: BorderRadius.all(
        Radius.circular(10)
    
      ),
      boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.3), // Shadow color with opacity
      spreadRadius: -1, // Spread radius
      blurRadius: 10, // Blur radius
      offset: Offset(0, 5), // changes position of shadow
    ),
  ],
      ),
      child: GestureDetector(
        onTap: callback,
        child: Card(
          elevation: 2.0,
          shadowColor: Colors.grey,
          color: Theme.of(context).colorScheme.inversePrimary,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(flex: 2),
                Image.asset(path, scale: 4),
                const Spacer(flex: 1),
                Text(style: const TextStyle(fontSize: 32 , fontFamily: 'AlviNastaleeq'),text),
                const Spacer(flex: 2),
              ],),
          )
        ),
        
      ),
    );
  }
}

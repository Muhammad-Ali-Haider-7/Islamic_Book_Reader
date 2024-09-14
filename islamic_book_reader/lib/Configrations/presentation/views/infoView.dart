import 'package:flutter/material.dart';

class InfoView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("ترتیبات", style: TextStyle(color: Colors.white,fontFamily: 'AlviNastaleeq')),
        actions: [
          IconButton(onPressed: (){
            
          }, icon: const Icon(Icons.info_outline))
        ]
      ),
    );
  }}
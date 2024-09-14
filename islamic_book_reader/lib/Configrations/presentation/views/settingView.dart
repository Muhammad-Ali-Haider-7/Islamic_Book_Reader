import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_book_reader/Configrations/presentation/bloc/settings_bloc.dart';
import 'package:islamic_book_reader/Configrations/presentation/widgets/slider.dart';
import 'package:islamic_book_reader/essentials/fontSizeManager/fontSizeManager.dart';

class SettingView extends StatefulWidget{
  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView>{
  final double min = 16;
  final double max = 40;
  double localHeadingSize = FontSizeManager.heading.toDouble();
  double localContentSize = FontSizeManager.content.toDouble();
  double localArabicSize = FontSizeManager.arabic.toDouble();
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
      body: BlocConsumer<SettingsBloc,SettingsStates>(
        
        listener: (context, state) {
          if(state is SettingsSuccessUpdate){
            FontSizeManager.setArabic(value: localArabicSize.toInt());
            FontSizeManager.setContent(value: localContentSize.toInt());
            FontSizeManager.setHeading(value: localHeadingSize.toInt());
            Navigator.pop(context);
          }
        }, 
        builder: (context, state) {
          
          return Column(
            children: [
              CustomSlider(
                value: localHeadingSize,
                onChanged: (value){
                  setState(() {
                    localHeadingSize = value;
                  });
                },
                min: min,
                max: max,
                label: "Heading",),

              CustomSlider(
                value: localContentSize, 
                onChanged: (value){
                  setState(() {
                    localContentSize = value;
                  });
                }, 
                min: min, 
                max: max, 
                label: "Content",),

              CustomSlider(
                value: localArabicSize, 
                onChanged: (value){
                  setState(() {
                    localArabicSize = value;
                  });
                }, 
                min: min, 
                max: max, 
                label: "Arabic",),
              const Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
          
                ),
                onPressed: (){
                  context.read<SettingsBloc>().add(ChangeFontSizeEvent(
                    heading: localHeadingSize.toInt(),
                    content: localContentSize.toInt(),
                    arabic: localArabicSize.toInt()
                  ));
                }, 
                child: const Text("محفوظ کریں", style: TextStyle(color: Colors.white , fontSize: 24, fontFamily: 'AlviNastaleeq'))),
                const Spacer(),
            ],);
         },
        ));
  }
}
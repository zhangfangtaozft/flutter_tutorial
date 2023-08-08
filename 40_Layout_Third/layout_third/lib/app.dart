import 'package:flutter/material.dart';
 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: const Text('Layout Third!'),
         ),
         body: Center(
           child: Container(
             color: Colors.green[200],

             child:  Column(
               mainAxisSize: MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 const FlutterLogo(size: 50,),
                 Expanded(
                   child: ListView(
                     children: [
                       for (int i = 0; i < 1000; i++)
                         Text('ListView item $i')
                     ],
                   ),
                 ),
                 const FlutterLogo(size: 50,),
               ],
             ),
           ),
         ),
       ),
     );
   }
 }
 
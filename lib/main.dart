import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_dictionary/view_models/meaning_list_view_model.dart';
import 'package:turkish_dictionary/views/mean_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Colors.deepPurple,
       useMaterial3: true
      ),
      home: ChangeNotifierProvider(create: (context) => MeaningListViewModel(),
      child: const MeanListView(),
      )
    );
  }
}


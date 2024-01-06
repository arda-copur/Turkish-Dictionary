import 'package:flutter/material.dart';
import 'package:turkish_dictionary/service/dictionary_service.dart';
import 'package:turkish_dictionary/view_models/meaning_view_model.dart';


class MeaningListViewModel extends ChangeNotifier {
  MeaningViewModel meaningViewModel = MeaningViewModel('', []);
  Status status = Status.initial;

  Future<void> getMeaning(String word) async{
    status = Status.loading;
    List<String> meanings = await DictionaryService().searchWord(word);
    meaningViewModel = MeaningViewModel(word,meanings);
    status = meanings.isNotEmpty ? Status.success : Status.notFound;
    notifyListeners(); 
   }
}

enum Status{initial,loading,notFound,success}
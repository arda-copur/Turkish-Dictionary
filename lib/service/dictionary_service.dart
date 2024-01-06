import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turkish_dictionary/model/kelimeler.dart';
class DictionaryService {
    Future<List<String>> searchWord(String word) async{
       Uri url = Uri.parse('https://sozluk.gov.tr/gts?ara=$word');
       final response = await http.get(url);

       if(response.statusCode == 200) {
             final result = json.decode(response.body);
              List<String> anlamlar = [];
             if (result[0] != null) {
              Kelimeler kelimelerResponse = Kelimeler.fromJson(result[0]);
             
              for (AnlamlarList anlam in kelimelerResponse.anlamlarList!) {
                    anlamlar.add(anlam.anlam!);
              }
             
             }
              return anlamlar;
       }

       throw Exception("Request Error");
    }
}
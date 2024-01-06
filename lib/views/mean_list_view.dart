import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_dictionary/view_models/meaning_list_view_model.dart';
import 'package:turkish_dictionary/widgets/mean_list.dart';
import 'package:turkish_dictionary/widgets/sign_language.dart';

class MeanListView extends StatefulWidget {
  const MeanListView({super.key});

  @override
  State<MeanListView> createState() => _MeanListViewState();
}

class _MeanListViewState extends State<MeanListView> {
  final myHintText = "Merak ettiğiniz kelimeyi aratın";
  final errorText = "Maalesef bir sonuç bulamadık";
  final myNetworkImage = "assets/dictionary_icon.png";
  final myPngLogo = "assets/dictionary_icon.png";
  final TextEditingController _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MeaningListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Image.asset(
            myNetworkImage,
            fit: BoxFit.contain,
            height: 50,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.deepPurple[50]),
                child: TextField(
                  controller: _myController,
                  decoration: InputDecoration(
                      hintText: myHintText,
                      suffixIcon: InkWell(
                        child: const Icon(Icons.search),
                        onTap: () {
                          if(_myController.text.isNotEmpty) {
                            vm.getMeaning(_myController.text);
                          }
                        },
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16)),
                ),
              ),
            ),
            getWidgetByStatus(vm)
          ],
        ),
      ),
    );
  }

  getWidgetByStatus(MeaningListViewModel vm) {
    switch (vm.status.index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(50.0),
          child: Opacity(
              opacity: 0.1, child: Image.asset(myPngLogo)),
        );

      case 1:
        return const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
        );

      case 2:
        return  Text(
          errorText,
          style: const TextStyle(fontSize: 18),
        );
      default:
        return MeanList(
            meaningViewModel: vm.meaningViewModel,
            signLanguage: SignLanguage(word: vm.meaningViewModel.word));
    }
  }
}

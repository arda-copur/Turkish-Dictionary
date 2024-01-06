import 'package:flutter/material.dart';
import 'package:turkish_dictionary/view_models/meaning_view_model.dart';
import 'package:turkish_dictionary/widgets/sign_language.dart';

class MeanList extends StatelessWidget {
  final MeaningViewModel meaningViewModel;
  final SignLanguage signLanguage;
  const MeanList({
    Key? key,
    required this.meaningViewModel,
    required this.signLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          meaningViewModel.word,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        ListView.builder(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: meaningViewModel.meanings.length,
          itemBuilder: (context, index) {
          return SizedBox(
            height: 50,
            child: Text("${index + 1}. ${meaningViewModel.meanings[index]}",
            style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
            ));
        },),
          signLanguage
      ],
    );
  }
}

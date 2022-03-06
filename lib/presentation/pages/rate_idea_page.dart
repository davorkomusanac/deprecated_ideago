import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/ideas/ideas_cubit.dart';
import '../../constants.dart';

class RateIdeaPage extends StatelessWidget {
  const RateIdeaPage({
    Key? key,
    required this.ideaUid,
  }) : super(key: key);

  final String ideaUid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate idea'),
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<IdeasCubit, IdeasState>(
        builder: (context, state) {
          var idea = state.ideas.firstWhere((element) => element.uid == ideaUid);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: idea.questionRatings.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return RichText(
                        text: TextSpan(text: questionRatingIntro),
                      );
                    } else {
                      var questionTitle = idea.questionRatings[index - 1].questionTitle;
                      var questionDescription = idea.questionRatings[index - 1].questionDescription;
                      var questionRating = idea.questionRatings[index - 1].rating;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: RichText(
                              text: TextSpan(
                                text: questionTitle,
                                style: TextStyle(fontWeight: FontWeight.w600),
                                children: [
                                  TextSpan(
                                    text: ' - ${questionDescription}',
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              //TODO Add idea button here, and skip filling?
            ],
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Text(''),
      //
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text('1'),
      //           Text(firstQuestion.round().toString()),
      //           Text('10'),
      //         ],
      //       ),
      //       Slider.adaptive(
      //           value: firstQuestion,
      //           min: 1,
      //           max: 10,
      //           divisions: 9,
      //           //label: 'Test',
      //           activeColor: Colors.teal,
      //           onChanged: (newRating) {
      //             setState(() {
      //               firstQuestion = newRating;
      //             });
      //           }),
      //     ],
      //   ),
      // ),
    );
  }
}

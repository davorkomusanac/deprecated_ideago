import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideago/presentation/pages/rate_idea_page/widgets/rate_idea_intro.dart';
import 'package:ideago/presentation/pages/rate_idea_page/widgets/rate_idea_outro.dart';
import 'package:ideago/presentation/pages/rate_idea_page/widgets/idea_rating_slider_header.dart';

import '../../../application/ideas/ideas_cubit.dart';
import '../../../constants.dart';

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
                  physics: const BouncingScrollPhysics(),
                  itemCount: idea.questionRatings.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const RateIdeaIntro();
                    } else if (index == idea.questionRatings.length + 1) {
                      return const RateIdeaOutro();
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
                                text: '$index. $questionTitle',
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: ' - $questionDescription',
                                    style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                          IdeaRatingSliderHeader(currentSliderValue: questionRating),
                          Slider.adaptive(
                              value: questionRating.toDouble(),
                              min: 0,
                              max: 10,
                              divisions: 10,
                              //label: 'Test',
                              activeColor: Colors.teal,
                              onChanged: (newRating) {
                                print(newRating);
                                //   questionRating = newRating;
                              }),
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

      //     ],
      //   ),
      // ),
    );
  }
}

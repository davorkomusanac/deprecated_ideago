import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideago/application/ratings/ratings_cubit.dart';
import 'package:ideago/presentation/pages/rate_idea_page/widgets/confirm_rating_button.dart';
import 'package:ideago/presentation/pages/rate_idea_page/widgets/idea_rating_slider_header.dart';
import 'package:ideago/presentation/pages/rate_idea_page/widgets/rate_idea_intro.dart';
import 'package:ideago/presentation/pages/rate_idea_page/widgets/rate_idea_outro.dart';

import '../../../application/ideas/ideas_cubit.dart';

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
          return BlocBuilder<RatingsCubit, RatingsState>(
            builder: (context, state) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.questions.length + 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const RateIdeaIntro();
                  } else if (index == state.questions.length + 1) {
                    return const RateIdeaOutro();
                  } else if (index == state.questions.length + 2) {
                    return const ConfirmRatingButton();
                  } else {
                    var questionTitle = state.questions[index - 1].title;
                    var questionDescription = state.questions[index - 1].description;
                    var questionRating = state.questions[index - 1].rating;
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
                          min: 1,
                          max: 10,
                          divisions: 9,
                          activeColor: Colors.teal,
                          onChanged: (newRating) {
                            context.read<RatingsCubit>().updateRating(
                                  index: index - 1,
                                  rating: newRating.round(),
                                  questionTitle: questionTitle,
                                  questionDescription: questionDescription,
                                );
                          },
                        ),
                      ],
                    );
                  }
                },
              );
            },
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

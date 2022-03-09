import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideago/presentation/pages/update_idea_page/update_idea_page.dart';
import 'package:ideago/presentation/widgets/idea_rating_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../application/ideas/ideas_cubit.dart';
import '../../application/ratings/ratings_cubit.dart';
import '../pages/rate_idea_page/rate_idea_page.dart';

class BuildIdeas extends StatelessWidget {
  const BuildIdeas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: BlocBuilder<IdeasCubit, IdeasState>(
          builder: (context, state) {
            if (state.status == IdeasStatus.initial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == IdeasStatus.error) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return ReorderableListView.builder(
                onReorder: (oldIndex, newIndex) {
                  context.read<IdeasCubit>().reorderIdeas(oldIndex: oldIndex, newIndex: newIndex);
                },
                itemCount: state.ideas.length,
                itemBuilder: (context, index) {
                  var idea = state.ideas[index];
                  return Padding(
                    key: Key(idea.uid),
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: IdeaRatingCard(
                              ideaRating: idea.ideaRating,
                              onTap: () {
                                context.read<RatingsCubit>().getRatings(questions: idea.questionRatings);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RateIdeaPage(ideaUid: idea.uid),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: ExpandableNotifier(
                              child: ExpandableButton(
                                child: Expandable(
                                  collapsed: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.85,
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          idea.title,
                                          style: const TextStyle(fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                  expanded: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.85,
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(
                                          text: TextSpan(
                                            text: idea.title,
                                            style: const TextStyle(fontWeight: FontWeight.w600),
                                            children: [
                                              TextSpan(
                                                text: '\n\n${idea.description}',
                                                style: const TextStyle(fontWeight: FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    animationDuration: Duration(milliseconds: 500),
                                    scrollAnimationDuration: Duration(milliseconds: 500),
                                    crossFadePoint: 0.1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateIdeaPage(idea: idea),
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(MdiIcons.pencil),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

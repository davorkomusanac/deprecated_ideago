import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../application/ideas/ideas_cubit.dart';

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
              return ListView.builder(
                itemCount: state.ideas.length,
                itemBuilder: (context, index) {
                  var idea = state.ideas[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(
                            child: Center(
                              child: Card(
                                color: Colors.green,
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  //TODO
                                  child: Text("90"),
                                ),
                              ),
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
                                    animationDuration: Duration(milliseconds: 700),
                                    scrollAnimationDuration: Duration(milliseconds: 1000),
                                    crossFadePoint: 0.1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                //TODO
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
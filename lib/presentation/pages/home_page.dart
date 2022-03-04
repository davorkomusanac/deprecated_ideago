import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideago/presentation/pages/add_idea_page.dart';

import '../../application/ideas/ideas_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IdeaGo"),
      ),
      body: Column(
        children: const [
          //_SearchIdeas(),
          Expanded(
            child: _BuildIdeas(),
          ),
          _AddIdea(),
        ],
      ),
    );
  }
}

class _BuildIdeas extends StatefulWidget {
  const _BuildIdeas({Key? key}) : super(key: key);

  @override
  _BuildIdeasState createState() => _BuildIdeasState();
}

class _BuildIdeasState extends State<_BuildIdeas> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdeasCubit, IdeasState>(builder: (context, state) {
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
          itemBuilder: (context, index) {
            var idea = state.ideas[index];
            return Padding(
              padding: const EdgeInsets.all(48.0),
              child: Center(
                child: ExpandablePanel(
                  header: Text('GO F'),
                  collapsed: Text("Test"),
                  expanded: Text("RESULTTT HEHEHE"),
                ),
              ),
            );
            // return Padding(
            //   padding: const EdgeInsets.all(28.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Text(idea.title),
            //       ),
            //       Expanded(
            //         child: Text(idea.description),
            //       ),
            //       IconButton(
            //         onPressed: () => context.read<IdeasCubit>().deleteIdea(idea),
            //         icon: const Icon(Icons.delete),
            //       ),
            //     ],
            //   ),
            // );
          },
          itemCount: state.ideas.length,
        );
      }
    });
    //TODO Listen to state changes here, and show all ideas from storage
    // return Consumer<IdeasRepository>(
    //   builder: (context, ideaController, child) {
    //     return Expanded(
    //       child: ListView.builder(
    //         itemCount: ideaController.ideas.length,
    //         itemBuilder: (context, index) {
    //           Idea idea = ideaController.ideas[index];
    //           return ListTile(
    //             title: Text(idea.title),
    //             trailing: IconButton(
    //               onPressed: () {
    //                 context.read<IdeasRepository>().removeIdea(idea);
    //               },
    //               icon: const Icon(Icons.delete),
    //             ),
    //           );
    //         },
    //       ),
    //     );
    //   },
    // );
  }
}

class _AddIdea extends StatelessWidget {
  const _AddIdea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddIdeaPage()),
        ),
        child: const Text("Add new idea"),
      ),
    );
  }
}
//
// class _SearchIdeas extends StatelessWidget {
//   const _SearchIdeas({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: const [
//         _SearchField(),
//         _FilterButton(),
//       ],
//     );
//   }
// }
//
// class _SearchField extends StatefulWidget {
//   const _SearchField({Key? key}) : super(key: key);
//
//   @override
//   State<_SearchField> createState() => _SearchFieldState();
// }
//
// class _SearchFieldState extends State<_SearchField> {
//   late TextEditingController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _handleOnChangedSearch(String searchTerm) {
//     //TODO Search for Ideas
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 16.0,
//           top: 16.0,
//           bottom: 16.0,
//           right: 8.0,
//         ),
//         child: TextField(
//           controller: _controller,
//           onChanged: _handleOnChangedSearch,
//           onSubmitted: _handleOnChangedSearch,
//           decoration: const InputDecoration(
//             prefixIcon: Icon(Icons.search),
//             labelText: "Search",
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _FilterButton extends StatelessWidget {
//   const _FilterButton({Key? key}) : super(key: key);
//
//   void _handleFilterPressed() {
//     //TODO Filter button pressed
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0, right: 8),
//       child: IconButton(
//         onPressed: _handleFilterPressed,
//         icon: const Icon(Icons.filter_list),
//       ),
//     );
//   }
// }

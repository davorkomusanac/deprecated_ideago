import 'package:flutter/material.dart';

class IdeaRatingCard extends StatelessWidget {
  const IdeaRatingCard({
    Key? key,
    required this.ideaRating,
    required this.onTap,
  }) : super(key: key);

  final int ideaRating;
  final VoidCallback onTap;

  Color _cardColor() {
    if (ideaRating < 35) {
      return Colors.red.shade900;
    } else if (ideaRating <= 50) {
      return Colors.red;
    } else if (ideaRating < 65) {
      return Colors.orange;
    } else if (ideaRating < 75) {
      return Colors.orangeAccent;
    } else if (ideaRating < 85) {
      return Colors.green;
    } else {
      return Colors.greenAccent.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Card(
          color: _cardColor(),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(ideaRating.toString()),
          ),
        ),
      ),
    );
  }
}

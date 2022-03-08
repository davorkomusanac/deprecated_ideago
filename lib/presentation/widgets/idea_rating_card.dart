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
    if (ideaRating <= 50) {
      return Colors.red;
    } else if (ideaRating < 75) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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

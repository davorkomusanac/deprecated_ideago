import 'package:flutter/material.dart';
import 'package:ideago/presentation/pages/home_page.dart';

class ConfirmRatingButton extends StatelessWidget {
  const ConfirmRatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.teal),
            onPressed: () {
              //TODO Call saveRatings
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (_) => false,
              );
            },
            child: const Text("Rate Idea"),
          ),
        ),
      ),
    );
  }
}

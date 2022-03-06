import 'data/models/question_rating/question_rating.dart';

String kBoxName = 'ideas';
String kBoxMainKey = 'eachIdea';

List<QuestionRating> initialQuestionRatings = [
  QuestionRating(
    rating: 5,
    questionTitle: 'Urgency',
    questionDescription:
        'How badly do people want or need this right now? (Renting an old movie is typically low urgency; seeing a new movie on opening night is high urgency, since it only happens once.)',
  ),
  QuestionRating(
    rating: 5,
    questionTitle: 'Market Size',
    questionDescription:
        'How many people are actively purchasing things like this? (The market for scuba diving equipment is very small; the market for cancer cures is massive.)',
  ),
  QuestionRating(
    rating: 5,
    questionTitle: 'Pricing Potential',
    questionDescription:
        'What is the highest average price a purchaser would be willing to spend for a solution? (Lollipops sell for \$0.05; cruiser ships sell for billions.)',
  ),
  QuestionRating(
    rating: 5,
    questionTitle: 'Customer Acquisition Cost',
    questionDescription:
        'How easy is it to acquire a new customer? On average, how much will it cost to generate a sale, both in money and effort? (Restaurants located next to stadiums spend little to bring in new customers. Biotech companies can spend billions in research before getting a product.)',
  ),
  QuestionRating(
    rating: 5,
    questionTitle: 'Distribution Cost',
    questionDescription:
        'How much would it cost to create and deliver the value offered, both in money and effort? (Delivering files via the Internet is almost free; inventing a product and building a factory costs millions.)',
  ),
  QuestionRating(
    rating: 5,
    questionTitle: 'Uniqueness of Offer',
    questionDescription:
        'How unique is your offer versus competing offerings in the market, and how easy is it for potential competitors to copy you? (There are many hair salons, but very few companies that offer private space travel.)',
  ),
  QuestionRating(
    rating: 5,
    questionTitle: 'Speed to Market',
    questionDescription:
        'How quickly can you create something to sell? (You can offer to mow a neighbor’s lawn in minutes; opening a bank can take years.)',
  ),
  QuestionRating(
    rating: 5,
    questionTitle: 'Up-Front Investment',
    questionDescription:
        'How much will you have to invest before you’re ready to sell? (To be a housekeeper, all you need is a set of inexpensive cleaning products. To mine for gold, you need millions to purchase land and excavating equipment.)',
  ),
  QuestionRating(
    rating: 5,
    questionTitle: 'Up-Sell Potential',
    questionDescription:
        'Are there related secondary offers that you could also present to purchasing customers? (Customers who purchase razors need shaving cream and extra blades as well; buy a Frisbee, and you won’t need another unless you lose it.)',
  ),
  QuestionRating(
    rating: 5,
    questionTitle: 'Evergreen Potential',
    questionDescription:
        'Once the initial offer has been created, how much additional work will you have to put into it in order to continue selling? (Business consulting requires ongoing work to get paid; a book can be produced once, then sold over and over as-is.',
  ),
];

String questionRatingIntro =
    'Rate each of the 10 questions below on a scale from 0 to 10, where 0 is extremely unattractive and 10 is extremely attractive.\nWhen in doubt about a question, be conservative in rating.';

//TODO
String questionRatingOutro =
    'When you are done with rating your idea, press the button and check your score. If the score is 50 or below - move on to another idea, there are better places';

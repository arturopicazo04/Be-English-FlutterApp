class ExamData {
  static const String questionOpenCloze = '''
For questions 1 – 8, read the text below and think of the word which best fits each gap. Use only one word in each gap. There is an example at the beginning (0).
''';

  static const String questionTextOpenCloze = '''

The origin of language
The truth (0) IS nobody really knows how language first began. Did we all start talking at around the same time (1) ..........of the manner in which our brains had begun to develop?

Although there is a lack of clear evidence, people have come up with various theories about the origins of language. One recent theory is that human beings have evolved in (2)...............a way that we are programmed for language from the moment of birth. In (3) …….. words, language came about as a result of an evolutionary change in our brains at some stage.

Language (4) …….. well be programmed into the brain but, (5) …….. this, people still need stimulus from others around them. From studies, we know that (6) ............ children are isolated from human contact and have not learnt to construct sentences before they are ten, it is doubtful they will ever do so. This research shows, if (7) ............else, that language is a social activity, not something invented (8) ..........isolation.
''';

  static const List<String> correctAnswersOpenCloze = [
    "BECAUSE",
    "SUCH",
    "OTHER",
    "COULD",
    "DESPITE",
    "IF",
    "NOTHING",
    "IN"
  ];
  static const String questionWordFormation = """
For questions 1 – 8, read the text below. Use the word given in capitals at the end of some of the lines to form a word that fits in the gap in the same line. There is an example at the beginning (0).
""";

  static const String questionTextWordFormation = """
Training sports champions
What are the abilities that a (0) PROFESSIONAL sports person needs? To guarantee that opponents can be (1) …….. , speed, stamina and agility are essential, not to mention outstanding natural talent. Both a rigorous and comprehensive (2) regime and a highly nutritious diet are vital for top-level performance. It is carbohydrates, rather than proteins and fat, that provide athletes with the (3) they need to compete. This means that pasta is more (4) …….. than eggs or meat. Such a diet enables them to move very energetically when required. Failure to follow a sensible diet can result in the (5) …….. to maintain stamina. 

Regular training to increase muscular (6) is also a vital part of a professional’s regime, and this is (7) …….. done by exercising with weights. Sports people are prone to injury but a quality training regime can ensure that the (8) of these can be minimised.
EXAMPLE: PROFESSION 
COME
FIT
ENDURE 
BENEFIT
ABLE
STRONG 
TYPE
SEVERE
""";

  static const List<String> correctAnswersWordFormation = [
    "OVERCOME",
    "FITNESS",
    "ENDURANCE",
    "BENEFICIAL",
    "INABILITY",
    "STRENGTH",
    "TYPICALLY",
    "SEVERITY"
  ];

  static const String questionKeyWordTransformation = """
For questions 1 – 6, complete the second sentence so that it has a similar meaning to the first sentence, using the word given. Do not change the word given. You must use between three and six words, including the word given. Here is an example (0).
""";
  static const String questionTextKeyWordTransformation = """
Example:
0 James would only speak to the head of department alone.
ON
James ...............................................to the head of department alone.
Insisted on speaking

1 My brother now earns far less than he did when he was younger.
NEARLY
My brother................................................ much now as he did when he was younger.

2 They are demolishing the old bus station and replacing it with a new one.
PULLED
The old bus station is.................................................with a new one.

3 The number of students now at university has reached an all-time high, apparently.
THE
The number of students now at university is ................................................ been, apparently.

4 I’m disappointed with the Fishers’ new album when I compare it to their previous one.
COMPARISON
I think the Fishers’ new album is................................................their previous one.

5 Anna got the job even though she didn’t have much experience in public relations.
SPITE
Anna got the job ............................................... of experience in public relations.

6 ‘I must warn you how dangerous it is to cycle at night without any lights,’ said the police officer to Max.
DANGERS
Max received a................................................at night without any lights from the police officer.
""";

  static const List<String> correctAnswersKeyWordTransformation = [
    "DOES NOT EARN NEARLY AS",
    "THE OLD BUS STATION IS BEING PULLED DOWN AND REPLACED",
    "THE HIGHEST IT HAS EVER BEEN",
    "DISAPPOINTING IN COMPARISON WITH",
    "IN SPITE OF HER LACK",
    "WARNING ABOUT THE DANGERS OF CYCLING"
  ];
}

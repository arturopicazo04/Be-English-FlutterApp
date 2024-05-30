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

  //Reading:
  static const String readingPartOneQuestion =
      "For questions 1 – 8, read the text below and decide which answer (A, B, C or D) best fits each gap.";

  static const String readingPartOneText = """
Studying black bears
After years studying North America’s black bears in the (0) …….. way, wildlife biologist Luke Robertson felt no closer to understanding the creatures. He realised that he had to (1)............ their trust. Abandoning scientific detachment, he took the daring step of forming relationships with the animals, bringing them food to gain their acceptance.

The (2) …….. this has given him into their behaviour has allowed him to dispel certain myths about bears. (3) …….. to popular belief, he contends that bears do not (4) …….. as much for fruit as previously supposed. He also (5) …….. claims that they are ferocious. He says that people should not be (6) by behaviour such as swatting paws on the ground, as this is a defensive, rather than an aggressive, act.

However, Robertson is no sentimentalist. After devoting years of his life to the bears, he is under no (7) …….. about their feelings for him. It is clear that their interest in him does not (8)........... beyond the food he brings.
  """;

  static const List<Map<String, dynamic>> readingPartOneAnswers = [
    {
      'question': "1",
      'options': ["A catch", "B win", "C achieve", "D receive"],
      'correctAnswer': "B"
    },
    {
      'question': "2",
      'options': ["A perception", "B awareness", "C insight", "D vision"],
      'correctAnswer': "C"
    },
    {
      'question': "3",
      'options': ["A Opposite", "B Opposed", "C Contrary", "D Contradictory"],
      'correctAnswer': "C"
    },
    {
      'question': "4",
      'options': ["A care", "B bother", "C desire", "D hope"],
      'correctAnswer': "A"
    },
    {
      'question': "5",
      'options': ["A concludes", "B disputes", "C reasons", "D argues"],
      'correctAnswer': "B"
    },
    {
      'question': "6",
      'options': ["A misguided", "B misled", "C misdirected", "D misinformed"],
      'correctAnswer': "B"
    },
    {
      'question': "7",
      'options': ["A error", "B doubt", "C illusion", "D impression"],
      'correctAnswer': "C"
    },
    {
      'question': "8",
      'options': ["A expand", "B spread", "C widen", "D extend"],
      'correctAnswer': "D"
    }
  ];
  static const String readingPartFiveQuestion =
      "You are going to read the introduction to a book about the history of colour. For questions 1 – 6, choose the answer (A, B, C or D) which you think fits best according to the text.";

  static const String readingPartFiveText = """
Introduction to a book about the history of colour
This book examines how the ever-changing role of colour in society has been reflected in manuscripts, stained glass, clothing, painting and popular culture. Colour is a natural phenomenon, of course, but it is also a complex cultural construct that resists generalization and, indeed, analysis itself. No doubt this is why serious works devoted to colour are rare, and rarer still are those that aim to study it in historical context. Many authors search for the universal or archetypal truths they imagine reside in colour, but for the historian, such truths do not exist. Colour is first and foremost a social phenomenon. There is no transcultural truth to colour perception, despite what many books based on poorly grasped neurobiology or – even worse – on pseudoesoteric pop psychology would have us believe. Such books unfortunately clutter the bibliography on the subject, and even do it harm.

The silence of historians on the subject of colour, or more particularly their difficulty in conceiving colour as a subject separate from other historical phenomena, is the result of three different sets of problems. The first concerns documentation and preservation. We see the colours transmitted to us by the past as time has altered them and not as they were originally. Moreover, we see them under light conditions that often are entirely different from those known by past societies. And finally, over the decades we have developed the habit of looking at objects from the past in black-and-white photographs and, despite the current diffusion of colour photography, our ways of thinking about and reacting to these objects seem to have remained more or less black and white.

The second set of problems concerns methodology. As soon as the historian seeks to study colour, he must grapple with a host of factors all at once: physics, chemistry, materials, and techniques of production, as well as iconography, ideology, and the symbolic meanings that colours convey. How to make sense of all of these elements? How can one establish an analytical model facilitating the study of images and coloured objects? No researcher, no method, has yet been able to resolve these problems, because among the numerous facts pertaining to colour, a researcher tends to select those facts that support his study and to conveniently forget those that contradict it. This is clearly a poor way to conduct research. And it is made worse by the temptation to apply to the objects and images of a given historical period information found in texts of that period. The proper method – at least in the first phase of analysis – is to proceed as do palaeontologists (who must study cave paintings without the aid of texts): by extrapolating from the images and the objects themselves a logic and a system based on various concrete factors such as the rate of occurrence of particular objects and motifs, their distribution and disposition. In short, one undertakes the internal structural analysis with which any study of an image or coloured object should begin.

The third set of problems is philosophical: it is wrong to project our own conceptions and definitions of colour onto the images, objects and monuments of past centuries. Our judgements and values are not those of previous societies (and no doubt they will change again in the future). For the writer-historian looking at the definitions and taxonomy of colour, the danger of anachronism is very real. For example, the spectrum with its natural order of colours was unknown before the seventeenth century, while the notion of primary and secondary colours did not become common until the nineteenth century. These are not eternal notions but stages in the ever-changing history of knowledge.

I have reflected on such issues at greater length in my previous work, so while the present book does address certain of them, for the most part it is devoted to other topics. Nor is it concerned only with the history of colour in images and artworks – in any case that area still has many gaps to be filled. Rather, the aim of this book is to examine all kinds of objects in order to consider the different facets of the history of colour and to show how far beyond the artistic sphere this history reaches. The history of painting is one thing; that of colour is another, much larger, question. Most studies devoted to the history of colour err in considering only the pictorial, artistic or scientific realms. But the lessons to be learned from colour and its real interest lie elsewhere.
  """;

  static const List<Map<String, dynamic>> readingPartFiveAnswers = [
    {
      'question':
          "What problem regarding colour does the writer explain in the first paragraph?",
      'options': [
        "A Our view of colour is strongly affected by changing fashion.",
        "B Analysis is complicated by the bewildering number of natural colours.",
        "C Colours can have different associations in different parts of the world.",
        "D Certain popular books have dismissed colour as insignificant."
      ],
      'correctAnswer': "C"
    },
    {
      'question':
          "What is the first reason the writer gives for the lack of academic work on the history of colour?",
      'options': [
        "A There are problems of reliability associated with the artefacts available.",
        "B Historians have seen colour as being outside their field of expertise.",
        "C Colour has been rather looked down upon as a fit subject for academic study.",
        "D Very little documentation exists for historians to use."
      ],
      'correctAnswer': "A"
    },
    {
      'question':
          "The writer suggests that the priority when conducting historical research on colour is to",
      'options': [
        "A ignore the interpretations of other modern day historians.",
        "B focus one’s interest as far back as the prehistoric era.",
        "C find some way of organising the mass of available data.",
        "D relate pictures to information from other sources."
      ],
      'correctAnswer': "C"
    },
    {
      'question':
          "In the fourth paragraph, the writer says that the historian writing about colour should be careful",
      'options': [
        "A not to analyse in an old-fashioned way.",
        "B when making basic distinctions between key ideas.",
        "C not to make unwise predictions.",
        "D when using certain terms and concepts."
      ],
      'correctAnswer': "D"
    },
    {
      'question':
          "In the fifth paragraph, the writer says there needs to be further research done on",
      'options': [
        "A the history of colour in relation to objects in the world around us.",
        "B the concerns he has raised in an earlier publication.",
        "C the many ways in which artists have used colour over the years.",
        "D the relationship between artistic works and the history of colour."
      ],
      'correctAnswer': "D"
    },
    {
      'question':
          "An idea recurring in the text is that people who have studied colour have",
      'options': [
        "A failed to keep up with scientific developments.",
        "B not understood its global significance.",
        "C found it difficult to be fully objective.",
        "D been muddled about their basic aims."
      ],
      'correctAnswer': "C"
    }
  ];

  // Part 6
  static const String readingPartSixQuestion = """
    You are going to read four reviews of a book about how architecture can affect the emotions. For questions 1 – 4, choose from the reviews A – D. The reviews may be chosen more than once.
    The Architecture of Happiness
    Four reviewers comment on philosopher Alain De Botton’s book
  """;

  static const String readingPartSixText = """
    A
    Alain de Botton is a brave and highly intelligent writer who writes about complex subjects, clarifying the arcane for the layman.
    Now, with typical self-assurance, he has turned to the subject of architecture. The essential theme of his book is how architecture influences mood and behaviour.
    It is not about the specifically architectural characteristics of space and design, but much more about the emotions that architecture inspires in the users of buildings.
    Yet architects do not normally talk nowadays very much about emotion and beauty. They talk about design and function. De Botton's message, then, is fairly simple but worthwhile precisely because it is simple, readable and timely.
    His commendable aim is to encourage architects, and society more generally, to pay more attention to the psychological consequences of design in architecture: architecture should be treated as something that affects all our lives, our happiness and well-being.
    
    B
    Alain de Botton raises important, previously unasked, questions concerning the quest for beauty in architecture, or its rejection or denial.
    Yet one is left with the feeling that he needed the help and support of earlier authors on the subject to walk him across the daunting threshold of architecture itself.
    And he is given to making extraordinary claims: ‘Architecture is perplexing ... in how inconsistent is its capacity to generate the happiness on which its claim to our attention is founded.’
    If architecture's capacity to generate happiness is inconsistent, this might be because happiness has rarely been something architects think about.
    De Botton never once discusses the importance of such dull, yet determining, matters as finance or planning laws, much less inventions such as the lift or reinforced concrete.
    He appears to believe that architects are still masters of their art, when increasingly they are cogs in a global machine for building in which beauty, and how de Botton feels about it, are increasingly beside the point.
    
    C
    In The Architecture of Happiness, Alain de Botton has a great time making bold and amusing judgements about architecture, with lavish and imaginative references, but anyone in search of privileged insights into the substance of building design should be warned that he is not looking at drain schedules or pipe runs.
    He worries away, as many architects do, at how inert material things can convey meaning and alter consciousness. Although he is a rigorous thinker, most of de Botton’s revelations, such as the contradictions in Le Corbusier's theory and practice, are not particularly new.
    However, this is an engaging and intelligent book on architecture and something everyone, professionals within the field in particular, should read.
    
    D
    Do we want our buildings merely to shelter us, or do we also want them to speak to us? Can the right sort of architecture even improve our character?
    Music mirrors the dynamics of our emotional lives. Mightn’t architecture work the same way? De Botton thinks so, and in The Architecture of Happiness he makes the most of this theme on his jolly trip through the world of architecture.
    De Botton certainly writes with conviction and, while focusing on happiness can be a lovely way to make sense of architectural beauty, it probably won’t be of much help in resolving conflicts of taste.
  """;

  static const List<Map<String, dynamic>> readingPartSixAnswers = [
    {
      'question':
          'Which reviewer has a different opinion from the others on the confidence with which de Botton discusses architecture?',
      'options': ['A', 'B', 'C', 'D'],
      'correctAnswer': 'B'
    },
    {
      'question':
          'Which reviewer shares reviewer A’s opinion whether architects should take note of de Botton’s ideas?',
      'options': ['A', 'B', 'C', 'D'],
      'correctAnswer': 'C'
    },
    {
      'question':
          'Which reviewer expresses a similar view to reviewer B regarding the extent to which architects share de Botton’s concerns?',
      'options': ['A', 'B', 'C', 'D'],
      'correctAnswer': 'A'
    },
    {
      'question':
          'Which reviewer has a different view to reviewer C on the originality of some of de Botton’s ideas?',
      'options': ['A', 'B', 'C', 'D'],
      'correctAnswer': 'B'
    }
  ];

  // Part 7
  static const String readingPartSevenQuestion = """
    You are going to read an extract from a magazine article. Six paragraphs have been removed from the extract. Choose from the paragraphs A – G the one which fits each gap (1 – 6). There is one extra paragraph which you do not need to use.
    Scottish Wildcat
  """;

  static const String readingPartSevenText = """
    On my living-room wall I have a painting of a wildcat by John Holmes of which I am extremely fond. It depicts a snarling, spitting animal, teeth bared and back arched: a taut coiled spring ready to unleash some unknown fury.
    [1]
    However, the physical differences are tangible. The wildcat is a much larger animal, weighing in some cases up to seven kilos, the same as a typical male fox. The coat pattern is superficially similar to a domestic tabby cat but it is all stripes and no spots. The tail is thicker and blunter, with three to five black rings. The animal has an altogether heavier look.
    The Scottish wildcat was originally distinguished as a separate subspecies in 1912, but it is now generally recognised that there is little difference between the Scottish and other European populations. According to an excellent report on the wildcat printed in 1991, the animals originally occurred in a variety of habitats throughout Europe.
    [2]
    It was during the nineteenth century, with the establishment of many estates used by landowners for hunting, that the wildcat became a nuisance and its rapid decline really began; 198 wildcats were killed in three years in the area of Glengarry, for example.
    However, things were later to improve for the species.
    [3]
    The future is by no means secure, though, and recent evidence suggests that the wildcat is particularly vulnerable to local eradication, especially in the remoter parts of northern and western Scotland. This is a cause for real concern, given that the animals in these areas have less contact with domestic cats and are therefore purer.
    Part of the problem stems from the fact that the accepted physical description of the species originates from the selective nature of the examination process by the British Natural History Museum at the start of the century, and this has been used as the type-definition for the animal ever since. Animals that did not conform to that large blunt-tailed ‘tabby’ description were discarded as not being wildcats. In other words, an artificial collection of specimens was built up, exhibiting the features considered typical of the wildcat.
    [4]
    The current research aims to resolve this potential problem. It is attempting to find out whether there are any physical features which characterise the so-called wild-living cats.
    [5]
    But what of his lifestyle? Wildcat kittens are usually born in May/June in a secluded den, secreted in a gap amongst boulders. Another favourite location is in the roots of a tree.
    Rabbits are a favourite prey, and some of the best areas to see wildcats are at rabbit warrens close to the forest and moorland edge. Mice, small birds and even insects also form a large part of the diet, and the animal may occasionally take young deer.
    The wildcat is one of the Scottish Highlands’ most exciting animals. Catch a glimpse of one and the memory will linger forever.
  """;

  static const List<Map<String, dynamic>> readingPartSevenAnswers = [
    {
      'question': 'Gap 1',
      'options': ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
      'correctAnswer': 'G'
    },
    {
      'question': 'Gap 2',
      'options': ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
      'correctAnswer': 'D'
    },
    {
      'question': 'Gap 3',
      'options': ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
      'correctAnswer': 'A'
    },
    {
      'question': 'Gap 4',
      'options': ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
      'correctAnswer': 'F'
    },
    {
      'question': 'Gap 5',
      'options': ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
      'correctAnswer': 'C'
    },
    {
      'question': 'Gap 6',
      'options': ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
      'correctAnswer': 'E'
    }
  ];

  static const List<String> readingPartSevenParagraphs = [
    'A The recruitment of men to the armed forces during the conflict in Europe from 1914 to 1918 meant there was very little persecution, since gamekeepers went off to fight. As the number of gamekeepers decreased, the wildcat began to increase its range, recolonising many of its former haunts. Extinction was narrowly averted.',
    'B The wildcat waits for a while in rapt concentration, ears twitching and eyes watching, seeing everything and hearing everything, trying to detect the tell-tale movement of a vole or a mouse. But there is nothing, and in another leap he disappears into the gloom.',
    'C The results, which are expected shortly, will be fascinating. But anyone who has seen a wildcat will be in little doubt that there is indeed a unique and distinctive animal living in the Scottish Highlands, whatever his background.',
    'D They probably used deciduous and coniferous woodland for shelter, particularly in winter, and hunted over more open areas such as forest edge, open woodland, thickets and scrub, grassy areas and marsh. The wildcat was probably driven into more mountainous areas by a combination of deforestation and persecution.',
    'E As the animals emerge, their curiosity is aroused by every movement and rustle in the vegetation. Later they will accompany their mother on hunting trips, learning quickly, and soon become adept hunters themselves.',
    'F This is what makes many people think that the wildcat is a species in its own right. Research currently being undertaken by Scottish Natural Heritage is investigating whether the wildcat really is distinct from its home-living cousin, or whether it is nothing more than a wild-living form of the domestic cat.',
    'G It is a typical image most folk have of the beast, but it is very much a false one, for the wildcat is little more than a bigger version of the domestic cat, and probably shows his anger as often.'
  ];

  //Listening
  static const List<String> listeningPart1CorrectAnswers = [
    "A",
    "B",
    "C",
    "A",
    "C",
    "A"
  ];

  static const List<String> listeningPart1Questions = [
    "Which aspect of college publicity material do the friends disagree about?",
    "In the woman’s opinion, companies link themselves with charities in order to",
    "What is the woman’s criticism of exercising in gyms?",
    "How does the man respond to his friend’s criticism?",
    "What is she doing during the conversation?",
    "Why does the man give the example of trees?"
  ];

  static const List<List<String>> listeningPart1Options = [
    [
      "A. How useful the environmental rating system is",
      "B. How well the different courses are described",
      "C. How visually attractive the brochures are"
    ],
    [
      "A. Boost their profits.",
      "B. Improve their image in society.",
      "C. Distract attention away from other issues."
    ],
    [
      "A. Members get limited access to the facilities.",
      "B. The membership cost is too high for the services offered.",
      "C. It encourages exercise habits that lead to unhealthy lifestyles."
    ],
    [
      "A. He objects to her making sweeping generalisations about gyms.",
      "B. He questions the value of excessive gym attendance.",
      "C. He suspects she’d enjoy a different type of gym."
    ],
    [
      "A. Admitting to regrets about her choice of place to study",
      "B. Complaining about challenges she’s had to face",
      "C. Expressing her admiration for people in the city"
    ],
    [
      "A. To support her main point",
      "B. To present a counter-argument to hers",
      "C. To express a reservation about her interpretation"
    ]
  ];

  static const String listeningPar2Question =
      """You will hear a student called Josh talking about his research project. For questions 1 – 8, complete the sentences with a word or short phrase.
      TRIP TO SOUTH AFRICA
      """;
  static const List<String> listeningPart2Questions = [
    "As well as his research project, Josh planned to write a (1) ………………………………… for a website while he was in Africa.",
    "Josh’s group planned to check out a particular region after a (2) ………………………………… that had occurred there.",
    "Josh was surprised to see (3) ………………………………… being grown in the first area they visited.",
    "Josh describes the vehicle they travelled in as a (4) ………………………………… when they went in search of specimens.",
    "Josh uses the word (5) ………………………………… to give us an idea of the shape of the leaves he found.",
    "Josh was particularly impressed by one type of flower which was (6)................................................... in colour.",
    "Josh uses the word (7) ………………………………… to convey his feelings about an area of vegetation he studied.",
    "Josh really appreciated the view he got from the (8) ………………………………… of his accommodation."
  ];

  static const List<String> listeningPart2CorrectAnswers = [
    "REPORT",
    "FIRE",
    "(RED) TEA",
    "SAFARI TRUCK",
    "NEEDLE(S)",
    "(DEEP) ORANGE",
    "PARADISE",
    "ROOF"
  ];

  static const List<String> listeningPart3Questions = [
    "What does Jenny say about the story which made her name?",
    "What does Jenny suggest about the editor she worked for on her first national daily newspaper?",
    "When Jenny got her own daily column on the newspaper, she felt",
    "Peter thinks he got a job on Carp Magazine thanks to",
    "Peter and Jenny agree that courses in journalism",
    "When asked about their novels, Peter and Jenny reveal",
  ];

  static const List<List<String>> listeningPart3Options = [
    [
      "A. She’d been on the lookout for just such a lucky break.",
      "B. She resented colleagues trying to take the credit for it.",
      "C. She wasn’t actually responsible for the finished article.",
      "D. She asked for a more prestigious job on the strength of it.",
    ],
    [
      "A. He respected her for standing up to him.",
      "B. He tended to blame her for things unfairly.",
      "C. He wasn’t as unreasonable as everyone says.",
      "D. He taught her the value of constructive criticism.",
    ],
    [
      "A. satisfied that the good work she’d done elsewhere had been recognised.",
      "B. relieved that it was only likely to be a short-term appointment.",
      "C. determined to prove exactly what she was capable of.",
      "D. unsure of her ability to make a success of it.",
    ],
    [
      "A. his academic achievements at college.",
      "B. his practical knowledge of everyday journalism.",
      "C. his familiarity with the interests of its main target audience.",
      "D. his understanding of how best to present himself at interview.",
    ],
    [
      "A. need to be supplemented by first-hand experience.",
      "B. are attractive because they lead to paid employment.",
      "C. are of little value compared to working on a student newspaper.",
      "D. provide an opportunity for writers to address contentious issues.",
    ],
    [
      "A. an ambition to gain recognition for their craft.",
      "B. a desire to develop careers outside journalism.",
      "C. a need to prove how versatile they are as writers.",
      "D. a wish to keep their journalism fresh and appealing.",
    ],
  ];

  static const List<String> listeningPart3CorrectAnswers = [
    "C",
    "B",
    "C",
    "B",
    "A",
    "D"
  ];
  static const List<String> listeningPart4QuestionsTaskOne = [
    "Speaker 1 - Task One",
    "Speaker 2 - Task One",
    "Speaker 3 - Task One",
    "Speaker 4 - Task One",
    "Speaker 5 - Task One",
  ];

  static const List<String> listeningPart4QuestionsTaskTwo = [
    "Speaker 1 - Task Two",
    "Speaker 2 - Task Two",
    "Speaker 3 - Task Two",
    "Speaker 4 - Task Two",
    "Speaker 5 - Task Two",
  ];

  static const List<String> listeningPart4OptionsTaskOne = [
    "A unfriendly colleagues",
    "B poor holiday entitlement",
    "C lacking a sense of purpose",
    "D needing more of a challenge",
    "E the workload",
    "F disagreements with superiors",
    "G no prospect of advancement",
    "H the physical environment"
  ];

  static const List<String> listeningPart4OptionsTaskTwo = [
    "A encouraged by early results",
    "B hopeful about future success",
    "C delighted by a change in lifestyle",
    "D relieved the initial uncertainty is over",
    "E glad to be helping other people",
    "F grateful for an increase in salary",
    "G happy to feel in control",
    "H satisfied with the training received"
  ];

  static const List<String> listeningPart4CorrectAnswersTaskOne = [
    "C",
    "D",
    "A",
    "G",
    "E"
  ];

  static const List<String> listeningPart4CorrectAnswersTaskTwo = [
    "D",
    "C",
    "E",
    "B",
    "G"
  ];
}

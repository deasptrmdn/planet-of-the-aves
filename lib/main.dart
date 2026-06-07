import 'dart:async';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:audioplayers/audioplayers.dart';

class EnvironmentColors {
  static const tropical = Color(0xFF145B4A);

  static const arctic = Color(0xFF7CB9E8);

  static const savannah = Color(0xFFC49A4A);

  static const wetland = Color(0xFF3E8E8E);
}

void main() {
  runApp(const PlanetOfTheAvesApp());
}

class PlanetOfTheAvesApp extends StatelessWidget {
  const PlanetOfTheAvesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planet of the Aves',
      theme: ThemeData(
        fontFamily: 'CalSans',
      ),
      home: const SplashScreen(),
    );
  }
}

// ================= SPLASH SCREEN =================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EnvironmentColors.tropical,
      body: Center(
        child: Text(
          'PLANET OF THE AVES',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'BowlbyOneSC',
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}

// ================= WELCOME SCREEN =================

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Image.asset(
                'assets/ui/welcome_hero.PNG',
                height: 320,
              ),

              const SizedBox(height: 20),

              const Text(
                'Explore the Aves World!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: EnvironmentColors.tropical,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Discover habitats, adaptations,\nand the lifecycle of birds through immersive learning.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EnvironmentColors.tropical,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= HOME SCREEN =================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget environmentCard(
      String imagePath,
      String title,
      ) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(18),
            ),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  24,
                  24,
                  24,
                  36,
                ),
                decoration: const BoxDecoration(
                  color: EnvironmentColors.tropical,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PLANET OF THE AVES',
                      style: TextStyle(
                        fontFamily: 'BowlbyOneSC',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Hi D,\nLet\'s dive into the birds world!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Choose Your Environment',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const TropicalForestScreen(),
                        ),
                      );
                    },
                    child: environmentCard(
                      'assets/ui/tropical_forest.PNG',
                      'Tropical Forest',
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ArcticScreen(),
                        ),
                      );
                    },
                    child: environmentCard(
                      'assets/ui/arctic.PNG',
                      'Arctic',
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SavannahScreen(),
                        ),
                      );
                    },
                    child: environmentCard(
                      'assets/ui/savannah.PNG',
                      'Savannah',
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WetlandScreen(),
                        ),
                      );
                    },
                    child: environmentCard(
                      'assets/ui/wetland.PNG',
                      'Wetland',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= TROPICAL FOREST =================

class TropicalForestScreen extends StatelessWidget {
  const TropicalForestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // HEADER

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: EnvironmentColors.tropical,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLANET OF THE AVES',
                    style: TextStyle(
                      fontFamily: 'BowlbyOneSC',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(18),
                      child: Image.asset(
                        'assets/ui/forestIntro.PNG',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Text(
                        'Tropical forests are dense ecosystems with rich vegetation and high biodiversity. These environments provide abundant food sources and shelter for many bird species.',
                        style: TextStyle(
                          fontSize: 16,
                          color: EnvironmentColors.tropical,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Tropical Forest',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: EnvironmentColors.tropical,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: EnvironmentColors.tropical,
                  borderRadius:
                  BorderRadius.circular(25),
                ),
                child: const Text(
                  'Warm, Humid, High Rainfall',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Birds living in tropical forests often have strong flying abilities, colorful feathers, and specialized beaks adapted to different food sources.',
                        style: TextStyle(
                          fontSize: 15,
                          color: EnvironmentColors.tropical,
                        ),
                      ),
                    ),

                    Image.asset(
                      'assets/ui/parrot_kecil.PNG',
                      width: 100,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: EnvironmentColors.tropical,
                  borderRadius:
                  BorderRadius.circular(25),
                ),
                child: const Column(
                  children: [
                    Text(
                      'FUN FACT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tropical forests are home to more than half of the world\'s plant and animal species.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Species Found:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: EnvironmentColors.tropical,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HummingbirdPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/hummingbird.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ParrotPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/parrot.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ToucanPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/toucan.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              const Text(
                'Tap the picture for more information!',
              ),

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Back'),
                    ),


                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const QuizPage(),
                                ),
                              );
                            },
                          child: const Text('Take Quiz'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class HummingbirdPage extends StatelessWidget {
  const HummingbirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Hummingbird',
      image: 'assets/ui/hummingbird.PNG',
      map: 'assets/ui/hummingbirdMAP.PNG',
      description:
      'A tiny bird famous for its ability to hover while feeding on flower nectar.',
      adaptation:
      'Its long beak and fast wing movement help it reach nectar inside flowers.',
      reproduction:
      'Builds small cup-shaped nests using plant fibers and spider silk.',
      funFact:
      'A hummingbird can flap its wings up to 80 times per second.',

      modelPath: 'assets/models/hummingbird.glb',
      audioPath: 'audio/forest.mp3',
      themeColor: EnvironmentColors.tropical,
    );
  }
}

class ParrotPage extends StatelessWidget {
  const ParrotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Parrot',
      image: 'assets/ui/parrot.PNG',
      map: 'assets/ui/parrotMAP.PNG',
      description:
      'A colorful and intelligent bird known for its ability to imitate sounds.',
      adaptation:
      'Its strong curved beak helps crack seeds, nuts, and fruits.',
      reproduction:
      'Usually lays eggs inside tree cavities.',
      funFact:
      'Some parrots can remember and imitate hundreds of words.',

      modelPath: 'assets/models/hummingbird.glb',
      audioPath: 'audio/forest.mp3',
      themeColor: EnvironmentColors.tropical,
    );
  }
}

class ToucanPage extends StatelessWidget {
  const ToucanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Toucan',
      image: 'assets/ui/toucan.PNG',
      map: 'assets/ui/toucanMAP.PNG',
      description:
      'A tropical bird recognized by its large and colorful beak.',
      adaptation:
      'Its large beak helps reach food and regulate body temperature.',
      reproduction:
      'Builds nests inside holes in trees.',
      funFact:
      'Despite its size, a toucan\'s beak is surprisingly lightweight.',

      modelPath: 'assets/models/hummingbird.glb',
      audioPath: 'audio/forest.mp3',
      themeColor: EnvironmentColors.tropical,
    );
  }
}

class BirdInfoPage extends StatelessWidget {
  final String title;
  final String image;
  final String map;
  final String description;
  final String adaptation;
  final String reproduction;
  final String funFact;
  final String modelPath;
  final String audioPath;
  final Color themeColor;

  const BirdInfoPage({
    super.key,
    required this.title,
    required this.image,
    required this.map,
    required this.description,
    required this.adaptation,
    required this.reproduction,
    required this.funFact,
    required this.modelPath,
    required this.audioPath,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: const BoxDecoration(
                  color: EnvironmentColors.tropical,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLANET OF THE AVES',
                    style: TextStyle(
                      fontFamily: 'BowlbyOneSC',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [

                    ClipOval(
                      child: Image.asset(
                        image,
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [

                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: EnvironmentColors.tropical,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Adaptation',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            adaptation,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF9AA236),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [

                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Reproduction Fact',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            reproduction,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF9AA236),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 140,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: EnvironmentColors.tropical,
                        borderRadius:
                        BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'FUN FACT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            funFact,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Image.asset(
                map,
                width: 320,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Bird3DPage(
                        modelPath: modelPath,
                        audioPath: audioPath,
                        themeColor: themeColor,
                      ),
                    ),
                  );
                },
                child: const Text('Tap here for the 3D!'),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  final List<int?> answers = [
    null,
    null,
    null,
    null,
    null,
  ];

  final List<int> correctAnswers = [
    2,
    1,
    0,
    0,
    2,
  ];

  int calculateScore() {
    int score = 0;

    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == correctAnswers[i]) {
        score++;
      }
    }

    return score;
  }

  Widget buildQuestion(
      int questionIndex,
      String question,
      List<String> options,
      ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFC7D65A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Question ${questionIndex + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            question,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          ...List.generate(
            options.length,
                (optionIndex) => RadioListTile<int>(
              value: optionIndex,
              groupValue: answers[questionIndex],
              activeColor: EnvironmentColors.tropical,
              title: Text(options[optionIndex]),
              onChanged: (value) {
                setState(() {
                  answers[questionIndex] = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: EnvironmentColors.tropical,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLANET OF THE AVES',
                    style: TextStyle(
                      fontFamily: 'BowlbyOneSC',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              buildQuestion(
                0,
                'Which bird can hover while feeding on nectar?',
                [
                  'Toucan',
                  'Parrot',
                  'Hummingbird',
                  'Penguin',
                ],
              ),

              buildQuestion(
                1,
                'What adaptation helps hummingbirds reach nectar?',
                [
                  'Strong claws',
                  'Long beak and fast wing movement',
                  'Large feet',
                  'Thick feathers',
                ],
              ),

              buildQuestion(
                2,
                'Which bird is known for imitating sounds?',
                [
                  'Parrot',
                  'Toucan',
                  'Hummingbird',
                  'Owl',
                ],
              ),

              buildQuestion(
                3,
                'Which bird has a large colorful beak?',
                [
                  'Toucan',
                  'Parrot',
                  'Sparrow',
                  'Duck',
                ],
              ),

              buildQuestion(
                4,
                'Tropical forests contain ____ of the world species.',
                [
                  'Less than 10%',
                  'Around 20%',
                  'More than half',
                  'None',
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  EnvironmentColors.tropical,
                ),
                onPressed: () {

                  final score = calculateScore();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          QuizResultPage(score: score),
                    ),
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizResultPage extends StatelessWidget {
  final int score;

  const QuizResultPage({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              decoration: const BoxDecoration(
                color: EnvironmentColors.tropical,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: const Center(
                child: Text(
                  'PLANET OF THE AVES',
                  style: TextStyle(
                    fontFamily: 'BowlbyOneSC',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFE4EDB4),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [

                  const Text(
                    'Quiz Complete!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: EnvironmentColors.tropical,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '$score / 5',
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'You have completed the Tropical Forest learning session.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                EnvironmentColors.tropical,
              ),
              onPressed: () {
                Navigator.popUntil(
                  context,
                      (route) => route.isFirst,
                );
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class Bird3DPage extends StatefulWidget {

  final String modelPath;
  final String audioPath;
  final Color themeColor;

  const Bird3DPage({
    super.key,
    required this.modelPath,
    required this.audioPath,
    required this.themeColor,
  });

  @override
  State<Bird3DPage> createState() => _Bird3DPageState();
}

class _Bird3DPageState extends State<Bird3DPage> {

  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    player.play(
      AssetSource(widget.audioPath),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: widget.themeColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: const Center(
                child: Text(
                  'PLANET OF THE AVES',
                  style: TextStyle(
                    fontFamily: 'BowlbyOneSC',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            Expanded(
              child: ModelViewer(
                src: widget.modelPath,
                alt: "Flamingo 3D Model",
                ar: false,
                autoRotate: true,
                cameraControls: true,
                exposure: 1.0,
                backgroundColor: Colors.white,
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                EnvironmentColors.tropical,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class ArcticScreen extends StatelessWidget {
  const ArcticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: EnvironmentColors.arctic,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLANET OF THE AVES',
                    style: TextStyle(
                      fontFamily: 'BowlbyOneSC',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        'assets/ui/arcticIntro.PNG',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Text(
                        'Arctic environments are extremely cold regions covered with snow and ice. Birds living here possess specialized adaptations that help them survive harsh temperatures.',
                        style: TextStyle(
                          fontSize: 16,
                          color: EnvironmentColors.arctic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Arctic',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: EnvironmentColors.arctic,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: EnvironmentColors.arctic,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  'Cold, Snowy, Icy',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [

                    const Expanded(
                      child: Text(
                        'Arctic birds have thick feathers, strong insulation, and behaviors that help them conserve heat.',
                        style: TextStyle(
                          fontSize: 15,
                          color: EnvironmentColors.arctic,
                        ),
                      ),
                    ),

                    Image.asset(
                      'assets/ui/penguin_kecil.PNG',
                      width: 150,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: EnvironmentColors.arctic,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Column(
                  children: [
                    Text(
                      'FUN FACT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Some Arctic birds migrate thousands of kilometers every year.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Species Found:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: EnvironmentColors.arctic,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SnowyOwlPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/snowyowl.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PenguinPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/penguin.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SnowBuntingPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/snowbunting.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              const Text(
                'Tap the picture for more information!',
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ArcticQuizPage(),
                    ),
                  );
                },
                child: const Text('Take Quiz'),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class SnowyOwlPage extends StatelessWidget {
  const SnowyOwlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Snowy Owl',
      image: 'assets/ui/snowyowl.PNG',
      map: 'assets/ui/snowyowlMAP.PNG',
      description:
      'A large white owl that inhabits Arctic tundra regions.',
      adaptation:
      'Its thick feathers provide insulation against freezing temperatures.',
      reproduction:
      'Builds nests on the ground during the Arctic summer.',
      funFact:
      'Snowy Owls can hunt both during the day and at night.',

      modelPath: 'assets/models/penguin.glb',
      audioPath: 'audio/arctic.mp3',
      themeColor: EnvironmentColors.arctic,
    );
  }
}

class PenguinPage extends StatelessWidget {
  const PenguinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Penguin',
      image: 'assets/ui/penguin.PNG',
      map: 'assets/ui/penguinMAP.PNG',
      description:
      'A flightless bird adapted for swimming in cold environments.',
      adaptation:
      'Its streamlined body and flippers help it move efficiently underwater.',
      reproduction:
      'Penguins usually lay one or two eggs and provide parental care.',
      funFact:
      'Penguins can spend up to 75% of their lives in water.',

      modelPath: 'assets/models/penguin.glb',
      audioPath: 'audio/arctic.mp3',
      themeColor: EnvironmentColors.arctic,
    );
  }
}

class SnowBuntingPage extends StatelessWidget {
  const SnowBuntingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Snow Bunting',
      image: 'assets/ui/snowbunting.PNG',
      map: 'assets/ui/snowbuntingMAP.PNG',
      description:
      'A small Arctic songbird known for its white plumage.',
      adaptation:
      'Its feather coverage helps reduce heat loss in cold climates.',
      reproduction:
      'Builds nests in rocky crevices and lays several eggs.',
      funFact:
      'Snow Buntings are among the northernmost breeding songbirds.',

      modelPath: 'assets/models/penguin.glb',
      audioPath: 'audio/arctic.mp3',
      themeColor: EnvironmentColors.arctic,
    );
  }
}

class ArcticQuizPage extends StatefulWidget {
  const ArcticQuizPage({super.key});

  @override
  State<ArcticQuizPage> createState() => _ArcticQuizPageState();
}

class _ArcticQuizPageState extends State<ArcticQuizPage> {

  final List<int?> answers = [
    null,
    null,
    null,
    null,
    null,
  ];

  final List<int> correctAnswers = [
    1,
    1,
    2,
    0,
    0,
  ];

  int calculateScore() {
    int score = 0;

    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == correctAnswers[i]) {
        score++;
      }
    }

    return score;
  }

  Widget buildQuestion(
      int questionIndex,
      String question,
      List<String> options,
      ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: EnvironmentColors.arctic,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Question ${questionIndex + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            question,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          ...List.generate(
            options.length,
                (optionIndex) => RadioListTile<int>(
              value: optionIndex,
              groupValue: answers[questionIndex],
              activeColor: EnvironmentColors.arctic,
              title: Text(options[optionIndex]),
              onChanged: (value) {
                setState(() {
                  answers[questionIndex] = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: EnvironmentColors.arctic,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLANET OF THE AVES',
                    style: TextStyle(
                      fontFamily: 'BowlbyOneSC',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              buildQuestion(
                0,
                'Arctic regions are generally...',
                [
                  'Warm',
                  'Cold',
                  'Humid',
                  'Tropical',
                ],
              ),

              buildQuestion(
                1,
                'Which bird cannot fly?',
                [
                  'Snowy Owl',
                  'Penguin',
                  'Snow Bunting',
                  'Eagle',
                ],
              ),

              buildQuestion(
                2,
                'Snowy Owls are adapted to...',
                [
                  'Desert',
                  'Rainforest',
                  'Cold Environments',
                  'Wetlands',
                ],
              ),

              buildQuestion(
                3,
                'Penguins mainly live in...',
                [
                  'Polar Regions',
                  'Deserts',
                  'Savannahs',
                  'Jungles',
                ],
              ),

              buildQuestion(
                4,
                'Snow Buntings are known for...',
                [
                  'Living in cold climates',
                  'Living underwater',
                  'Mimicking speech',
                  'Hovering',
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: EnvironmentColors.arctic,
                ),
                onPressed: () {

                  final score = calculateScore();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ArcticQuizResultPage(score: score),
                    ),
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class ArcticQuizResultPage extends StatelessWidget {
  final int score;

  const ArcticQuizResultPage({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              decoration: const BoxDecoration(
                color: EnvironmentColors.arctic,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: const Center(
                child: Text(
                  'PLANET OF THE AVES',
                  style: TextStyle(
                    fontFamily: 'BowlbyOneSC',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFDCEEFF),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [

                  const Text(
                    'Quiz Complete!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: EnvironmentColors.arctic,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '$score / 5',
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'You have completed the Arctic learning session.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: EnvironmentColors.arctic,
              ),
              onPressed: () {
                Navigator.popUntil(
                  context,
                      (route) => route.isFirst,
                );
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class SavannahScreen extends StatelessWidget {
  const SavannahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: EnvironmentColors.savannah,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLANET OF THE AVES',
                    style: TextStyle(
                      fontFamily: 'BowlbyOneSC',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(18),
                      child: Image.asset(
                        'assets/ui/savannahIntro.PNG',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Text(
                        'Savannah ecosystems are tropical grasslands characterized by open spaces, scattered trees, and seasonal rainfall.',
                        style: TextStyle(
                          fontSize: 16,
                          color: EnvironmentColors.savannah,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Savannah',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: EnvironmentColors.savannah,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: EnvironmentColors.savannah,
                  borderRadius:
                  BorderRadius.circular(25),
                ),
                child: const Text(
                  'Grassland, Dry, Open',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [

                    const Expanded(
                      child: Text(
                        'Savannah birds have evolved adaptations for life in open grasslands and warm climates.',
                        style: TextStyle(
                          color: EnvironmentColors.savannah,
                        ),
                      ),
                    ),

                    Image.asset(
                      'assets/ui/ostrich_kecil.PNG',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: EnvironmentColors.savannah,
                  borderRadius:
                  BorderRadius.circular(25),
                ),
                child: const Column(
                  children: [
                    Text(
                      'FUN FACT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'The African savannah hosts some of the largest bird species in the world.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Species Found:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: EnvironmentColors.savannah,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OstrichPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/ostrich.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const VulturePage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/vulture.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WeaverBirdPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/weaverbird.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              const Text(
                'Tap the picture for more information!',
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SavannahQuizPage(),
                    ),
                  );
                },
                child: const Text('Take Quiz'),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}

class OstrichPage extends StatelessWidget {
  const OstrichPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Ostrich',
      image: 'assets/ui/ostrich.PNG',
      map: 'assets/ui/ostrichMAP.PNG',
      description:
      'The ostrich is the largest living bird and is native to African savannahs.',
      adaptation:
      'Long powerful legs allow ostriches to run at very high speeds.',
      reproduction:
      'Females lay eggs in communal nests protected by adults.',
      funFact:
      'An ostrich can run up to 70 km/h.',

      modelPath: 'assets/models/ostrich.glb',
      audioPath: 'audio/savannah.mp3',
      themeColor: EnvironmentColors.savannah,
    );
  }
}

class VulturePage extends StatelessWidget {
  const VulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Vulture',
      image: 'assets/ui/vulture.PNG',
      map: 'assets/ui/vultureMAP.PNG',
      description:
      'Vultures are scavenging birds that help clean ecosystems.',
      adaptation:
      'Excellent eyesight helps them locate food from long distances.',
      reproduction:
      'Most vultures lay one or two eggs each breeding season.',
      funFact:
      'Some vultures can soar for hours without flapping.',

      modelPath: 'assets/models/ostrich.glb',
      audioPath: 'audio/savannah.mp3',
      themeColor: EnvironmentColors.savannah,
    );
  }
}

class WeaverBirdPage extends StatelessWidget {
  const WeaverBirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Weaver Bird',
      image: 'assets/ui/weaverbird.PNG',
      map: 'assets/ui/weaverbirdMAP.PNG',
      description:
      'Weaver birds are famous for building complex woven nests.',
      adaptation:
      'Strong beaks help weave grass and plant fibers.',
      reproduction:
      'Males often build nests to attract mates.',
      funFact:
      'Some weaver nests can contain multiple chambers.',

      modelPath: 'assets/models/ostrich.glb',
      audioPath: 'audio/savannah.mp3',
      themeColor: EnvironmentColors.savannah,
    );
  }
}

class SavannahQuizPage extends StatefulWidget {
  @override
  State<SavannahQuizPage> createState() =>
      _SavannahQuizPageState();
}

class _SavannahQuizPageState
    extends State<SavannahQuizPage> {

  final List<int?> answers = [
    null,
    null,
    null,
    null,
    null,
  ];

  final List<int> correctAnswers = [
    1,
    0,
    2,
    0,
    1,
  ];

  int calculateScore() {
    int score = 0;

    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == correctAnswers[i]) {
        score++;
      }
    }

    return score;
  }

  Widget buildQuestion(
      int questionIndex,
      String question,
      List<String> options,
      ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: EnvironmentColors.savannah,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Text(
            'Question ${questionIndex + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            question,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          ...List.generate(
            options.length,
                (optionIndex) =>
                RadioListTile<int>(
                  value: optionIndex,
                  groupValue:
                  answers[questionIndex],
                  activeColor:
                  EnvironmentColors.savannah,
                  title:
                  Text(options[optionIndex]),
                  onChanged: (value) {
                    setState(() {
                      answers[questionIndex] =
                          value;
                    });
                  },
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                decoration:
                const BoxDecoration(
                  color:
                  EnvironmentColors.savannah,
                  borderRadius:
                  BorderRadius.only(
                    bottomLeft:
                    Radius.circular(32),
                    bottomRight:
                    Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLANET OF THE AVES',
                    style: TextStyle(
                      fontFamily:
                      'BowlbyOneSC',
                      color:
                      Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              buildQuestion(
                0,
                'Savannah ecosystems are mainly...',
                [
                  'Rainforests',
                  'Grasslands',
                  'Wetlands',
                  'Arctic regions',
                ],
              ),

              buildQuestion(
                1,
                'Which bird is the largest?',
                [
                  'Ostrich',
                  'Vulture',
                  'Weaver Bird',
                  'Duck',
                ],
              ),

              buildQuestion(
                2,
                'Vultures mainly eat...',
                [
                  'Seeds',
                  'Fish',
                  'Carrion',
                  'Nectar',
                ],
              ),

              buildQuestion(
                3,
                'Which bird cannot fly?',
                [
                  'Ostrich',
                  'Vulture',
                  'Weaver Bird',
                  'Swan',
                ],
              ),

              buildQuestion(
                4,
                'Weaver Birds are famous for...',
                [
                  'Swimming',
                  'Nest Building',
                  'Hovering',
                  'Diving',
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  EnvironmentColors.savannah,
                ),
                onPressed: () {

                  final score =
                  calculateScore();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          SavannahQuizResultPage(
                            score: score,
                          ),
                    ),
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class SavannahQuizResultPage extends StatelessWidget {
  final int score;

  const SavannahQuizResultPage({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              decoration: const BoxDecoration(
                color: EnvironmentColors.savannah,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: const Center(
                child: Text(
                  'PLANET OF THE AVES',
                  style: TextStyle(
                    fontFamily: 'BowlbyOneSC',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF4E2B8),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [

                  const Text(
                    'Quiz Complete!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: EnvironmentColors.savannah,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '$score / 5',
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'You have completed the Savannah learning session.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: EnvironmentColors.savannah,
              ),
              onPressed: () {
                Navigator.popUntil(
                  context,
                      (route) => route.isFirst,
                );
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class WetlandScreen extends StatelessWidget {
  const WetlandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: EnvironmentColors.wetland,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLANET OF THE AVES',
                    style: TextStyle(
                      fontFamily: 'BowlbyOneSC',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(18),
                      child: Image.asset(
                        'assets/ui/wetlandIntro.PNG',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Text(
                        'Wetlands are water-rich ecosystems that support a wide variety of bird species and aquatic life.',
                        style: TextStyle(
                          fontSize: 16,
                          color: EnvironmentColors.wetland,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Wetland',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: EnvironmentColors.wetland,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: EnvironmentColors.wetland,
                  borderRadius:
                  BorderRadius.circular(25),
                ),
                child: const Text(
                  'Water, Marsh, Biodiversity',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [

                    const Expanded(
                      child: Text(
                        'Wetland birds are adapted for swimming, wading, and finding food in aquatic habitats.',
                        style: TextStyle(
                          color:
                          EnvironmentColors.wetland,
                        ),
                      ),
                    ),

                    Image.asset(
                      'assets/ui/flamingo_kecil.PNG',
                      width: 130,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: EnvironmentColors.wetland,
                  borderRadius:
                  BorderRadius.circular(25),
                ),
                child: const Column(
                  children: [
                    Text(
                      'FUN FACT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Wetlands are among the most productive ecosystems on Earth.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Species Found:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: EnvironmentColors.wetland,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DuckPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/duck.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SwanPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/swan.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FlamingoPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ui/flamingo.PNG',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              const Text(
                'Tap the picture for more information!',
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WetlandQuizPage(),
                    ),
                  );
                },
                child: const Text('Take Quiz'),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class DuckPage extends StatelessWidget {
  const DuckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Duck',
      image: 'assets/ui/duck.PNG',
      map: 'assets/ui/duckMAP.PNG',
      description:
      'Ducks are waterfowl commonly found in wetlands, lakes, and rivers.',
      adaptation:
      'Webbed feet help ducks swim efficiently in water.',
      reproduction:
      'Female ducks build nests near water and lay several eggs.',
      funFact:
      'Many duck species migrate long distances every year.',

      modelPath: 'assets/models/flamingo.glb',
      audioPath: 'audio/wetland.mp3',
      themeColor: EnvironmentColors.wetland,
    );
  }
}

class SwanPage extends StatelessWidget {
  const SwanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Swan',
      image: 'assets/ui/swan.PNG',
      map: 'assets/ui/swanMAP.PNG',
      description:
      'Swans are large graceful water birds known for their elegance.',
      adaptation:
      'Long necks help them reach food below the water surface.',
      reproduction:
      'Swans usually form long-term pair bonds and build large nests.',
      funFact:
      'Some swan species can fly thousands of kilometers during migration.',

      modelPath: 'assets/models/flamingo.glb',
      audioPath: 'audio/wetland.mp3',
      themeColor: EnvironmentColors.wetland,
    );
  }
}

class FlamingoPage extends StatelessWidget {
  const FlamingoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BirdInfoPage(
      title: 'Flamingo',
      image: 'assets/ui/flamingo.PNG',
      map: 'assets/ui/flamingoMAP.PNG',
      description:
      'Flamingos are wading birds famous for their pink feathers.',
      adaptation:
      'Specialized beaks help filter food from shallow water.',
      reproduction:
      'Flamingos often breed in large colonies and lay one egg.',
      funFact:
      'Their pink color comes from pigments found in their food.',

      modelPath: 'assets/models/flamingo.glb',
      audioPath: 'audio/wetland.mp3',
      themeColor: EnvironmentColors.wetland,
    );
  }
}

class WetlandQuizPage extends StatefulWidget {
  @override
  State<WetlandQuizPage> createState() =>
      _WetlandQuizPageState();
}

class _WetlandQuizPageState
    extends State<WetlandQuizPage> {

  final List<int?> answers = [
    null,
    null,
    null,
    null,
    null,
  ];

  final List<int> correctAnswers = [
    0,
    1,
    2,
    0,
    1,
  ];

  int calculateScore() {
    int score = 0;

    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == correctAnswers[i]) {
        score++;
      }
    }

    return score;
  }

  Widget buildQuestion(
      int questionIndex,
      String question,
      List<String> options,
      ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: EnvironmentColors.wetland,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Text(
            'Question ${questionIndex + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            question,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          ...List.generate(
            options.length,
                (optionIndex) =>
                RadioListTile<int>(
                  value: optionIndex,
                  groupValue:
                  answers[questionIndex],
                  activeColor:
                  EnvironmentColors.wetland,
                  title:
                  Text(options[optionIndex]),
                  onChanged: (value) {
                    setState(() {
                      answers[questionIndex] =
                          value;
                    });
                  },
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                decoration:
                const BoxDecoration(
                  color:
                  EnvironmentColors.wetland,
                  borderRadius:
                  BorderRadius.only(
                    bottomLeft:
                    Radius.circular(32),
                    bottomRight:
                    Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLANET OF THE AVES',
                    style: TextStyle(
                      fontFamily:
                      'BowlbyOneSC',
                      color:
                      Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              buildQuestion(
                0,
                'Wetlands are ecosystems rich in...',
                [
                  'Water',
                  'Sand',
                  'Snow',
                  'Ice',
                ],
              ),

              buildQuestion(
                1,
                'Which bird is famous for pink feathers?',
                [
                  'Duck',
                  'Flamingo',
                  'Swan',
                  'Penguin',
                ],
              ),

              buildQuestion(
                2,
                'Ducks use their webbed feet for...',
                [
                  'Climbing',
                  'Running',
                  'Swimming',
                  'Digging',
                ],
              ),

              buildQuestion(
                3,
                'Swans are known for their...',
                [
                  'Graceful appearance',
                  'Mimicry',
                  'Hovering',
                  'Camouflage',
                ],
              ),

              buildQuestion(
                4,
                'Flamingos get their pink color from...',
                [
                  'Water',
                  'Food pigments',
                  'Sunlight',
                  'Mud',
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  EnvironmentColors.wetland,
                ),
                onPressed: () {

                  final score =
                  calculateScore();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          WetlandQuizResultPage(
                            score: score,
                          ),
                    ),
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class WetlandQuizResultPage extends StatelessWidget {
  final int score;

  const WetlandQuizResultPage({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              decoration: const BoxDecoration(
                color: EnvironmentColors.wetland,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: const Center(
                child: Text(
                  'PLANET OF THE AVES',
                  style: TextStyle(
                    fontFamily: 'BowlbyOneSC',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFD9F4F2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [

                  const Text(
                    'Quiz Complete!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: EnvironmentColors.wetland,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '$score / 5',
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'You have completed the Wetland learning session.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: EnvironmentColors.wetland,
              ),
              onPressed: () {
                Navigator.popUntil(
                  context,
                      (route) => route.isFirst,
                );
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
import 'package:portfolio_v2/core/models/link.dart';
import 'package:portfolio_v2/core/models/person.dart';
import 'package:portfolio_v2/core/models/skills.dart';
import 'package:portfolio_v2/core/models/technology.dart';

final Person user = Person(
  name: "Md. Wasiul Islam",
  imgAsset: "images/user.jpeg",
  email: "wasiul0491@gmail.com",
  highlight: "Software Engineer",
  summery:
      "Passionate software engineer crafting elegant digital experiences. "
      "I build performant, beautiful applications with clean architecture "
      "and a keen eye for design. Turning complex problems into intuitive solutions.",
  skills: const [
    Skills(
      technology: Technology(name: 'Flutter', svgAsset: 'icons/flutter.svg'),
      description: 'Cross-platform mobile & web development',
    ),
    Skills(
      technology: Technology(name: 'Dart', svgAsset: 'icons/dart.svg'),
      description: 'Primary programming language',
    ),
    Skills(
      technology: Technology(name: 'Firebase', svgAsset: 'icons/firebase.svg'),
      description: 'Backend services & real-time databases',
    ),
    Skills(
      technology: Technology(name: 'TypeScript'),
      description: 'Full-stack web development',
    ),
    Skills(
      technology: Technology(name: 'Python'),
      description: 'Data science & scripting',
    ),
    Skills(
      technology: Technology(name: 'Git'),
      description: 'Version control & collaboration',
    ),
  ],
  social: const [
    Link(
      name: 'GitHub',
      url: 'https://github.com/wasiul',
      svgAsset: 'icons/github.svg',
    ),
    Link(
      name: 'LinkedIn',
      url: 'https://linkedin.com/in/wasiul',
      svgAsset: 'icons/linkedin.svg',
    ),
    Link(
      name: 'Twitter',
      url: 'https://twitter.com/wasiul',
      svgAsset: 'icons/twitter.svg',
    ),
  ],
);

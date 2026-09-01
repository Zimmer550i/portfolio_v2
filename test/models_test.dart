import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_v2/core/models/models.dart';

void main() {
  group('Enums Tests', () {
    test('EmploymentType fromString and toJson fallback', () {
      expect(EmploymentType.fromString('full_time'), EmploymentType.fullTime);
      expect(EmploymentType.fromString('Full-time'), EmploymentType.fullTime);
      expect(EmploymentType.fromString('freelance'), EmploymentType.freelance);
      expect(EmploymentType.fromString('unknown_status'), EmploymentType.other);
      expect(EmploymentType.fromString(null), EmploymentType.other);
      expect(EmploymentType.fullTime.displayName, 'Full-time');
      expect(EmploymentType.fullTime.toJson(), 'fullTime');
    });

    test('MediaType parsing and helpers', () {
      expect(MediaType.fromString('image'), MediaType.image);
      expect(MediaType.fromString('3d'), MediaType.model3d);
      expect(MediaType.fromString('invalid'), MediaType.other);
      expect(MediaType.image.isImage, isTrue);
      expect(MediaType.video.isVideo, isTrue);
      expect(MediaType.model3d.isModel3d, isTrue);
    });

    test('ProjectStatus parsing and helpers', () {
      expect(ProjectStatus.fromString('in_progress'), ProjectStatus.inProgress);
      expect(ProjectStatus.fromString('ongoing'), ProjectStatus.ongoing);
      expect(ProjectStatus.ongoing.isActive, isTrue);
      expect(ProjectStatus.completed.isActive, isFalse);
    });

    test('SkillLevel and LanguageProficiency helpers', () {
      expect(SkillLevel.fromString('expert').percentage, 0.90);
      expect(SkillLevel.beginner.percentage, 0.25);
      expect(LanguageProficiency.fromString('native').level, 5);
      expect(LanguageProficiency.fromString('intermediate').level, 2);
    });
  });

  group('PersonalInformation Model Tests', () {
    test('Initialization, getters, copyWith and serialization', () {
      const info = PersonalInformation(
        id: 'user-1',
        fullName: 'Wasiul Islam',
        preferredName: 'Wasiul',
        headline: 'Staff Software Engineer',
        email: 'wasiul@example.com',
        location: 'Dhaka, Bangladesh',
        yearsOfExperience: 7.5,
        socialLinks: [
          SocialLink(
            id: 'soc-1',
            platform: 'GitHub',
            url: 'https://github.com/wasiulislam',
            username: 'wasiulislam',
          ),
        ],
        metadata: {'customKey': 'customVal'},
      );

      expect(info.displayName, 'Wasiul');
      expect(info.initials, 'WI');
      expect(info.isAvailable, isTrue);
      expect(info.hasSocials, isTrue);

      final map = info.toMap();
      expect(map['fullName'], 'Wasiul Islam');
      expect(map['email'], 'wasiul@example.com');
      expect(map['yearsOfExperience'], 7.5);

      final fromMap = PersonalInformation.fromMap(map);
      expect(fromMap, equals(info));
      expect(fromMap.hashCode, equals(info.hashCode));

      final updated = info.copyWith(headline: 'Principal Engineer');
      expect(updated.headline, 'Principal Engineer');
      expect(updated.fullName, 'Wasiul Islam');
    });

    test('JSON string encoding and decoding', () {
      const info = PersonalInformation(
        id: 'u1',
        fullName: 'Jane Doe',
        headline: 'Lead Architect',
        email: 'jane@doe.com',
      );

      final jsonStr = info.toJson();
      final fromJsonStr = PersonalInformation.fromJsonString(jsonStr);
      expect(fromJsonStr.fullName, 'Jane Doe');
      expect(fromJsonStr.email, 'jane@doe.com');
    });
  });

  group('Project Model Tests', () {
    test('Serialization, copyWith, getters and equality', () {
      final project = Project(
        id: 'proj-1',
        title: 'Portfolio 2.0',
        year: 2026,
        category: 'Mobile & Web',
        status: ProjectStatus.completed,
        technologies: ['Flutter', 'Dart', 'Firebase'],
        highlights: const [
          ProjectHighlight(
            id: 'ph-1',
            title: 'Performance',
            metric: '60 FPS',
          ),
        ],
        media: const [
          Media(
            id: 'm1',
            type: MediaType.image,
            url: 'https://example.com/banner.png',
            width: 1920,
            height: 1080,
          ),
        ],
      );

      expect(project.isCompleted, isTrue);
      expect(project.isOngoing, isFalse);
      expect(project.primaryImageUrl, 'https://example.com/banner.png');
      expect(project.media?.first.aspectRatio, closeTo(1.777, 0.01));

      final map = project.toMap();
      final fromMap = Project.fromMap(map);
      expect(fromMap.title, 'Portfolio 2.0');
      expect(fromMap.technologies, contains('Flutter'));
      expect(fromMap.highlights?.first.metric, '60 FPS');
    });
  });

  group('Experience Model Tests', () {
    test('Duration calculations and yearRange formatting', () {
      final exp = Experience(
        id: 'exp-1',
        title: 'Senior Software Engineer',
        employmentType: EmploymentType.fullTime,
        startDate: DateTime(2022, 1, 1),
        endDate: DateTime(2024, 6, 1),
        companyName: 'Tech Corp',
      );

      expect(exp.isCurrent, isFalse);
      expect(exp.yearRange, '2022 - 2024');
      expect(exp.durationInMonths, 29);
      expect(exp.durationFormatted, '2 yrs 5 mos');

      final currentExp = Experience(
        id: 'exp-2',
        title: 'Lead Architect',
        startDate: DateTime(2024, 1, 1),
        current: true,
      );

      expect(currentExp.isCurrent, isTrue);
      expect(currentExp.yearRange, '2024 - Present');
    });
  });

  group('Education and Certification Tests', () {
    test('Education yearRange and current flag', () {
      final edu = Education(
        id: 'edu-1',
        institution: 'University of Engineering and Technology',
        degree: 'B.Sc. in Computer Science',
        startDate: DateTime(2018, 1, 1),
        endDate: DateTime(2022, 12, 1),
      );

      expect(edu.yearRange, '2018 - 2022');
      expect(edu.isCurrent, isFalse);

      final map = edu.toMap();
      final reconstructed = Education.fromMap(map);
      expect(reconstructed, equals(edu));
    });

    test('Certification validity and expiration logic', () {
      final validCert = Certification(
        id: 'cert-1',
        name: 'Google Cloud Certified Architect',
        issueDate: DateTime(2025, 1, 1),
        expirationDate: DateTime(2030, 1, 1),
      );
      expect(validCert.isValid, isTrue);
      expect(validCert.isExpired, isFalse);

      final expiredCert = Certification(
        id: 'cert-2',
        name: 'Legacy Certificate',
        issueDate: DateTime(2019, 1, 1),
        expirationDate: DateTime(2020, 1, 1),
      );
      expect(expiredCert.isExpired, isTrue);
      expect(expiredCert.isValid, isFalse);

      final noExpiryCert = Certification(
        id: 'cert-3',
        name: 'Lifetime Certificate',
        doesNotExpire: true,
      );
      expect(noExpiryCert.isValid, isTrue);
      expect(noExpiryCert.hasExpiration, isFalse);
    });
  });

  group('Skill and SocialLink Tests', () {
    test('Skill level percentage and serialization', () {
      const skill1 = Skill(
        id: 'sk-1',
        name: 'Flutter',
        proficiency: 95,
        featured: true,
      );
      expect(skill1.levelPercentage, 0.95);

      const skill2 = Skill(
        id: 'sk-2',
        name: 'Dart',
        level: SkillLevel.master,
      );
      expect(skill2.levelPercentage, 1.0);

      final map = skill1.toMap();
      final reconstructed = Skill.fromMap(map);
      expect(reconstructed, equals(skill1));
    });

    test('SocialLink displayText fallback', () {
      const linkWithLabel = SocialLink(
        id: 's1',
        platform: 'GitHub',
        url: 'https://github.com',
        label: 'My Code',
      );
      expect(linkWithLabel.displayText, 'My Code');

      const linkWithUser = SocialLink(
        id: 's2',
        platform: 'Twitter',
        url: 'https://x.com/flutterdev',
        username: 'flutterdev',
      );
      expect(linkWithUser.displayText, '@flutterdev');

      const linkPlain = SocialLink(
        id: 's3',
        platform: 'LinkedIn',
        url: 'https://linkedin.com',
      );
      expect(linkPlain.displayText, 'LinkedIn');
    });
  });

  group('Resume and Testimonial Tests', () {
    test('Resume formattedFileSize and serialization', () {
      final resume = Resume(
        id: 'res-1',
        title: 'Senior Engineer CV',
        fileSizeBytes: 2048 * 1024,
        featured: true,
        fileUrl: 'https://example.com/cv.pdf',
      );
      expect(resume.formattedFileSize, '2.0 MB');
      expect(resume.primaryUrl, 'https://example.com/cv.pdf');

      final map = resume.toMap();
      final fromMap = Resume.fromMap(map);
      expect(fromMap.title, 'Senior Engineer CV');
      expect(fromMap.featured, isTrue);
    });

    test('Testimonial serialization and equality', () {
      final testm = Testimonial(
        id: 't-1',
        personName: 'Alex Smith',
        content: 'Exceptional engineer and leader.',
        personTitle: 'Engineering VP',
        company: 'InnovateTech',
        rating: 5.0,
        date: DateTime(2026, 3, 1),
      );

      final map = testm.toMap();
      final reconstructed = Testimonial.fromMap(map);
      expect(reconstructed, equals(testm));
      expect(reconstructed.personName, 'Alex Smith');
    });
  });
}

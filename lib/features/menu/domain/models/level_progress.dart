class LevelProgress {
  final String levelId;
  final int stars;

  LevelProgress({required this.levelId, required this.stars});

  bool get isCompleted => stars == 3;
}

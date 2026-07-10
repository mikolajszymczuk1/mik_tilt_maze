class MazeCell {
  bool wallN = false;
  bool wallE = false;
  bool wallS = false;
  bool wallW = false;

  MazeCell();

  factory MazeCell.fromString(String s) {
    final cell = MazeCell();
    if (s.isEmpty) return cell;
    for (final part in s.split(',')) {
      switch (part.trim()) {
        case 'N':
          cell.wallN = true;
          break;
        case 'E':
          cell.wallE = true;
          break;
        case 'S':
          cell.wallS = true;
          break;
        case 'W':
          cell.wallW = true;
          break;
      }
    }
    return cell;
  }
}

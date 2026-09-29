class Cell {
  final int x;
  final int y;

  Cell({
    required this.x,
    required this.y,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Cell &&
            other.x == x &&
            other.y == y;
  }

  @override
  int get hashCode => Object.hash(x, y);
}
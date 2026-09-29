import 'dart:math';

import 'cell.dart';

class Grid {
  final int width;
  final int height;

  final Set<Cell> _aliveCells = {};

  Grid({
    required this.width,
    required this.height,
    required int seed,
  }) {
    if (width <= 0) {
      throw ArgumentError('width must be greater than 0');
    }

    if (height <= 0) {
      throw ArgumentError('height must be greater than 0');
    }

    final random = Random(seed);

    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        if (random.nextBool()) {
          _aliveCells.add(Cell(x: x, y: y));
        }
      }
    }

    // The assignment requires the starting grid to contain
    // at least one living cell.
    if (_aliveCells.isEmpty) {
      final x = random.nextInt(width);
      final y = random.nextInt(height);

      _aliveCells.add(Cell(x: x, y: y));
    }
  }

  int get population => _aliveCells.length;

  bool isAlive(Cell cell) {
    _validateCell(cell);
    return _aliveCells.contains(cell);
  }

  void replaceAliveCells(Set<Cell> cells) {
    for (final cell in cells) {
      _validateCell(cell);
    }

    _aliveCells
      ..clear()
      ..addAll(cells);
  }

  void _validateCell(Cell cell) {
    if (cell.x < 0 ||
        cell.x >= width ||
        cell.y < 0 ||
        cell.y >= height) {
      throw RangeError(
        'Cell (${cell.x}, ${cell.y}) is outside the grid.',
      );
    }
  }
}
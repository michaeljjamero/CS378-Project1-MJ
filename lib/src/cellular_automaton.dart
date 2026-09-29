import 'cell.dart';
import 'grid.dart';

abstract class CellularAutomaton extends Grid {
  int generation = 0;

  CellularAutomaton({
    required int width,
    required int height,
    required int seed,
  }) : super(
    width: width,
    height: height,
    seed: seed,
  );

  bool nextState(bool currentlyAlive, int liveNeighborCount);

  String render();

  void step() {
    final nextAliveCells = <Cell>{};

    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        final cell = Cell(x: x, y: y);

        final currentlyAlive = isAlive(cell);
        final liveNeighborCount = _countLiveNeighbors(cell);

        if (nextState(currentlyAlive, liveNeighborCount)) {
          nextAliveCells.add(cell);
        }
      }
    }

    replaceAliveCells(nextAliveCells);
    generation++;
  }

  int _countLiveNeighbors(Cell cell) {
    var count = 0;

    for (var dy = -1; dy <= 1; dy++) {
      for (var dx = -1; dx <= 1; dx++) {
        // A cell is not its own neighbor.
        if (dx == 0 && dy == 0) {
          continue;
        }

        final neighborX = cell.x + dx;
        final neighborY = cell.y + dy;

        // Ignore coordinates outside the grid.
        if (neighborX < 0 ||
            neighborX >= width ||
            neighborY < 0 ||
            neighborY >= height) {
          continue;
        }

        final neighbor = Cell(
          x: neighborX,
          y: neighborY,
        );

        if (isAlive(neighbor)) {
          count++;
        }
      }
    }

    return count;
  }
}
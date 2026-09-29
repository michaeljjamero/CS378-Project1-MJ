import 'cell.dart';
import 'grid.dart';
import 'cellular_automaton.dart';

mixin AsciiRenderable on Grid {
  String render() {
    final buffer = StringBuffer();

    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        final cell = Cell(x: x, y: y);

        if (isAlive(cell)) {
          buffer.write('#');
        } else {
          buffer.write('.');
        }
      }

      buffer.writeln();
    }

    return buffer.toString();
  }
}

mixin DecoratedRenderable on CellularAutomaton {
  @override
  String render() {
    final raw = super.render();
    final lines = raw.split('\n');

    // AsciiRenderable ends every row with a newline,
    // so split() leaves one empty string at the end.
    if (lines.isNotEmpty && lines.last.isEmpty) {
      lines.removeLast();
    }

    final buffer = StringBuffer();
    final border = '-' * (width + 2);

    buffer.writeln(border);

    for (final line in lines) {
      buffer.writeln('|$line|');
    }

    buffer.writeln(border);

    return buffer.toString();
  }
}
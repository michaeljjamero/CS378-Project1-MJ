mixin ConwayRules {
  bool nextState(bool currentlyAlive, int liveNeighborCount) {
    if (currentlyAlive) {
      return liveNeighborCount == 2 || liveNeighborCount == 3;
    }

    return liveNeighborCount == 3;
  }
}

mixin CustomRules {
  bool nextState(bool currentlyAlive, int liveNeighborCount) {
    if (currentlyAlive) {
      return liveNeighborCount == 2 || liveNeighborCount == 3;
    }

    return liveNeighborCount == 3 || liveNeighborCount == 6;
  }
}
int chooseBestDistance(int t, int k, List<int> ls) {
  if (ls.length < k || t < 0 || k < 1 || ls.isEmpty) {
    return -1;
  }
  return recursionNextStep(0, k - 1, t, -1, 0, ls);
}

int recursionNextStep(int startIndex, int count, int maxDistance, int bestValue,
    int previousValue, List<int> ls) {
  for (int i = startIndex; i < ls.length; i++) {
    int innerResult = previousValue + ls[i];

    if (count != 0) {
      innerResult = recursionNextStep(
          i + 1, count - 1, maxDistance, bestValue, innerResult, ls);
    }

    if (bestValue < innerResult && innerResult <= maxDistance) {
      bestValue = innerResult;
    }
  }

  return bestValue;
}

void main() {
  print(chooseBestDistance(0, 0, [])); //-1
  print(chooseBestDistance(
      1235, 1, [18, 174, 348, 366, 150, 30, 115, 266, 351, 484, 281])); //484
  print(chooseBestDistance(21, 2, [1, 2, 3, 4, 5, 4, 3, 23, 1, 12, 4])); //17
  print(chooseBestDistance(174, 3, [51, 56, 58, 59, 61])); //173
  print(chooseBestDistance(163, 3, [50])); // -1
  print(chooseBestDistance(
      1967, 4, [201, 402, 359, 420, 59, 102, 293, 393, 332, 148])); //1574
  print(chooseBestDistance(
      1472, 5, [317, 377, 170, 67, 391, 395, 477, 473, 56, 414])); // 1471
}

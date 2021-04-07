int chooseBestDistance(int t, int k, List<int> ls) {
  List<int> l = [];

  // Якщо кількість доступних міст менше за кількість міст необхідних для відвідування повертаємо -1.
  if (ls.length < k) {
    return -1;
  }

  if (k > 2) {
    // Цикли що суммують необхідну кількість елементів.
    for (int i = 0; i < ls.length - 1; i++) {
      for (int j = i + 1; j < ls.length - (k - 2); j++) {
        // Тимчасова змінна для суми елементів більших за 3 индекс вхідного листа.
        int r = 0;
        for (int n = 2; n < k - 1; n++) {
          r = r + ls[j + n];
        }
        l.add(ls[i] + ls[j] + ls[j + 1] + r);
      }
    }
  } else {
    // Сума елементів якщо кількість міст = 2
    for (int i = 0; i < ls.length - 1; i++) {
      for (int j = i + 1; j < ls.length; j++) {
        l.add(ls[i] + ls[j]);
      }
    }
  }

  l.sort();
//   l.forEach((element)=>print("///////// $element //////////"));

  // Перевірки

  if (l.contains(t)) {
    return t;
  }

  if (l[0] > t) {
    return -1;
  }

  if (l[l.length - 1] < t) {
    return l[l.length - 1];
  }

  for (int i = 0; i < l.length; i++) {
    if (l[i] > t) {
      return l[i - 1];
    }
  }
}

void main() {
  print(chooseBestDistance(174, 3, [51, 56, 58, 59, 61])); //173
  print(chooseBestDistance(163, 3, [50])); //-1
  print(chooseBestDistance(13, 5, [1, 2, 3, 4, 5, 6, 7, 8])); //-1
  print(chooseBestDistance(20, 2, [1, 4, 3, 2, 3, 2])); //7
  print(chooseBestDistance(20, 1, [1, 4, 3, 2, 3, 2])); //7
}

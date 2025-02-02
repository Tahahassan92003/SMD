import 'dart:io';

void main() {
  Map<int, List<String>> big = {};
  Map<String, int> dic = {};
  int max_count = 0;
  Map<String, int> max_freq_word = {};
  int linecount = 0;
  String file = 'file.txt';
  List<String> lines = File(file).readAsLinesSync();
  for (String l in lines) {
    dic.clear();
    List<String> max = [];
    int count = 0;
    linecount += 1;
    List<String> words = l.toLowerCase().split(' ');
    for (String w in words) {
      if (dic.containsKey(w)) {
        dic[w] = dic[w]! + 1;
      } else {
        dic[w] = 1;
      }
      if (dic[w]! >= count) {
        count = dic[w]!;
      }
      if (dic[w]! >= max_count) {
        max_count = dic[w]!;
      }
    }

    for (var k in dic.keys) {
      if (dic[k] == count) {
        max.add(k);
        max_freq_word[k] = count;
      }
    }

    big[linecount] = max;
  }
  List<String> remove = [];
  for (var i in max_freq_word.keys) {
    if (max_freq_word[i]! < max_count) {
      remove.add(i);
    }
  }
  for (var i in max_freq_word.keys) {
    if (max_freq_word[i]! < max_count) {
      remove.add(i);
    }
  }
  for (var r in remove) {
    max_freq_word.remove(r);
  }

  for (var m in big.keys) {
    print('["${big[m]!.join(", ")}"] (appears in line $m)');
  }

  print("The Word(s) with the maximum frequency across lines is/are");
  for (var i in max_freq_word.keys) {
    print("${i} with Frequency: ${max_freq_word[i]}");
  }
}

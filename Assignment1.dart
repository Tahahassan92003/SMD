import 'dart:io';

void main() {
  Map<int, List<String>> big = {};
  Map<String, int> dic = {};

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
    }
    for (var k in dic.keys) {
      if (dic[k] == count) {
        max.add(k);
      }
    }
    big[linecount] = max;
  }
  for (var m in big.keys) {
    print('["${big[m]!.join(", ")}"] (appears in line $m)');
  }
}

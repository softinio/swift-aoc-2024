import Algorithms
import Foundation

struct Day03: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [(Int, Int)] {
    let pattern = "mul\\((\\d+),(\\d+)\\)"
    var extractedTuples: [(Int, Int)] = []
    if let regex = try? NSRegularExpression(pattern: pattern) {
      let matches = regex.matches(
        in: data, options: [], range: NSRange(location: 0, length: data.count))
      for match in matches {
        if let range = Range(match.range(at: 1), in: data),
          let first = Int(data[range]),
          let range2 = Range(match.range(at: 2), in: data),
          let second = Int(data[range2])
        {
          extractedTuples.append((first, second))
        }
      }
    }
    return extractedTuples
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Calculate the sum of the first set of input data
    entities.reduce(0) { (sum, tuple) in
      sum + tuple.0 * tuple.1
    }
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    //entities.map { $0.max() ?? 0 }.reduce(0, +)
    return true
  }
}

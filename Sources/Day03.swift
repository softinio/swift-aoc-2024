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

  var filteredEntities: [(Int, Int)] {
    let pattern = "(don't\\(\\))|(do\\(\\))|mul\\((\\d+),(\\d+)\\)"
    var extractedTuples: [(Int, Int)] = []
    var inputFunc = true
    if let regex = try? NSRegularExpression(pattern: pattern) {
      let matches = regex.matches(
        in: data, options: [], range: NSRange(location: 0, length: data.count))
      for match in matches {
        if let dontRange = Range(match.range(at: 1), in: data), data[dontRange] == "don't()" {
          inputFunc = false
        } else if let doRange = Range(match.range(at: 2), in: data), data[doRange] == "do()" {
          inputFunc = true
        } else if inputFunc,
          let range1 = Range(match.range(at: 3), in: data),
          let range2 = Range(match.range(at: 4), in: data),
          let first = Int(data[range1]),
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
    filteredEntities.reduce(0) { (sum, tuple) in
      sum + tuple.0 * tuple.1
    }
  }
}

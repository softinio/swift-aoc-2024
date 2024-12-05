import Algorithms
import Foundation
import RegexBuilder

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: ChunksOfCountCollection<[Int]> {
    data
      .split(separator: .newlineSequence)
      .flatMap {
        $0.components(separatedBy: .whitespaces).compactMap { Int($0) }
      }
      .chunks(ofCount: 2)
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Calculate the sum of the first set of input data
    let left = entities.compactMap(\.first).sorted()
    let right = entities.compactMap(\.last).sorted()
    let distance = zip(left, right).map {
      abs($0 - $1)
    }.reduce(0, +)
    return distance
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    entities.map { $0.max() ?? 0 }.reduce(0, +)
  }
}

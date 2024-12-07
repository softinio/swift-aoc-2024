import Algorithms

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data
      .split(separator: .newlineSequence)
      .compactMap {
        $0.components(separatedBy: .whitespaces).compactMap { Int($0) }
      }
  }

  func sameDirection(_ entries: [Int]) -> Bool {
    let increasing = entries.reduce((true, nil as Int?)) { (acc, entry) in
      let (increasing, previous) = acc
      if let prev = previous {
        if increasing {
          return (entry > prev, entry)
        } else {
          return (increasing, entry)
        }
      } else {
        return (increasing, entry)
      }
    }.0
    let decreasing = entries.reduce((true, nil as Int?)) { (acc, entry) in
      let (decreasing, previous) = acc
      if let prev = previous {
        if decreasing {
          return (entry < prev, entry)
        } else {
          return (decreasing, entry)
        }
      } else {
        return (decreasing, entry)
      }
    }.0

    return increasing || decreasing
  }

  func validateEntries(_ entries: [Int]) -> Bool {
    let diffs: [Int] = entries.reduce(([], nil as Int?)) { (acc, entry) in
      let (diffsList, previous) = acc
      if let prev = previous {
        return (diffsList + [abs(entry - prev)], entry)
      } else {
        return (diffsList, entry)
      }
    }.0
    let diffCount = diffs.count
    let filtered = diffs.filter { 1 <= $0 && $0 <= 3 }
    return diffCount == filtered.count
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    let safe = entities.enumerated().compactMap { (index, entry) in
      let valid = validateEntries(entry)
      let sameDirection = sameDirection(entry)
      return valid && sameDirection ? index : nil
    }
    return safe.count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    entities.map { $0.max() ?? 0 }.reduce(0, +)
  }
}

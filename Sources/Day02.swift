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

  func allValidDampened(_ entries: [Int]) -> Bool {
    if allValid(entries) { return true }

    for i in 0..<entries.count {
      let newEntries = entries.indices.filter { $0 != i }.map { entries[$0] }
      if allValid(newEntries) {
        return true
      }
    }
    return false
  }

  func isValidDecreasing(_ entry: [Int]) -> Bool {
    guard entry.count > 1 else { return false }
    let status = entry.reduce((true, nil as Int?)) { (acc, entry) in
      let (valid, previous) = acc
      if !valid { return (false, entry) }
      if let prev = previous {
        if 1...3 ~= prev - entry {
          return (true, entry)
        } else {
          return (false, entry)
        }
      } else {
        return (true, entry)
      }
    }
    return status.0
  }

  func isValidIncreasing(_ entry: [Int]) -> Bool {
    guard entry.count > 1 else { return false }
    let status = entry.reduce((true, nil as Int?)) { (acc, entry) in
      let (valid, previous) = acc
      if !valid { return (false, entry) }
      if let prev = previous {
        if 1...3 ~= entry - prev {
          return (true, entry)
        } else {
          return (false, entry)
        }
      } else {
        return (true, entry)
      }
    }
    return status.0
  }

  func allValid(_ entries: [Int]) -> Bool {
    return isValidDecreasing(entries) || isValidIncreasing(entries)
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    entities.filter(allValid(_:)).count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    entities.filter(allValidDampened(_:)).count
  }
}

/** Task Binary Gap

A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps.

Write a function:

public func solution(N : Int) -> Int

that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5.

Assume that:

N is an integer within the range [1..2,147,483,647].
Complexity:

expected worst-case time complexity is O(log(N));
expected worst-case space complexity is O(1).

solution:

*/

public func solution(N : Int) -> Int {
    // write your code in Swift 2.2 (Linux)
    let binary = String(N, radix: 2)
    var binaryGap = false
    var currentGapCount = 0
    var maxGapCount = 0
    
    for (index, digit) in binary.characters.enumerate() {
        if digit == "1" && binaryGap == false {
            binaryGap = true
            currentGapCount = 0
        } else if digit == "1" && binaryGap == true {
            binaryGap = false
            if currentGapCount > maxGapCount {
                maxGapCount = currentGapCount
            }
            currentGapCount = 0
            let next = index + 1
            let nextIndex = binary.startIndex.advancedBy(next)
            if next < binary.characters.count { 
                let nextDigit = binary.characters[nextIndex]
                if nextDigit == "0" {
                    binaryGap = true
                }
            }
        } else {
            currentGapCount = currentGapCount + 1
        }
    }
    
    return maxGapCount
}
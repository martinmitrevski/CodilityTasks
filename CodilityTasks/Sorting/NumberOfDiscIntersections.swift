/**

We draw N discs on a plane. The discs are numbered from 0 to N − 1. A zero-indexed array A of N non-negative integers, specifying the radiuses of the discs, is given. The J-th disc is drawn with its center at (J, 0) and radius A[J].

We say that the J-th disc and K-th disc intersect if J ≠ K and the J-th and K-th discs have at least one common point (assuming that the discs contain their borders).

The figure below shows discs drawn for N = 6 and A as follows:

  A[0] = 1
  A[1] = 5
  A[2] = 2
  A[3] = 1
  A[4] = 4
  A[5] = 0


There are eleven (unordered) pairs of discs that intersect, namely:

discs 1 and 4 intersect, and both intersect with all the other discs;
disc 2 also intersects with discs 0 and 3.
Write a function:

public func solution(inout A : [Int]) -> Int

that, given an array A describing N discs as explained above, returns the number of (unordered) pairs of intersecting discs. The function should return −1 if the number of intersecting pairs exceeds 10,000,000.

Given array A shown above, the function should return 11, as explained above.

Assume that:

N is an integer within the range [0..100,000];
each element of array A is an integer within the range [0..2,147,483,647].
Complexity:

expected worst-case time complexity is O(N*log(N));
expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.

*/

// explanation here: http://massivealgorithms.blogspot.mk/2015/07/codility-lesson-4-number-of-disc.html

import Foundation
import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(inout A : [Int]) -> Int {
    // write your code in Swift 2.2 (Linux)
    
    var starts = [Int]()
    var endings = [Int]()
    
    for (index, radius) in A.enumerate() {
        starts.append(index - radius)
        endings.append(index + radius)
    }
    
    starts = starts.sort {
        $0 < $1
    }
    
    endings = endings.sort {
        $0 < $1
    }
    
    var currentIndex = 0
    var endingIndex = 0
    var currentActive = 0
    var total = 0
    let N = A.count
    
    if N - 1 <= 0 {
        return 0
    }
    
    for _ in 0...N - 1 {
        while (currentIndex < N && starts[currentIndex] <= endings[endingIndex]) {
            currentIndex = currentIndex + 1
            currentActive = currentActive + 1
        }
        
        currentActive = currentActive - 1
        total = total + currentActive
        if total > 10000000 {
            return -1
        }
        
        endingIndex = endingIndex + 1
    }
    
    return total
}

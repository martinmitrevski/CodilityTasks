/**

Write a function:

public func solution(inout A : [Int]) -> Int
that, given a non-empty zero-indexed array A of N integers, returns the minimal positive integer (greater than 0) that does not occur in A.

For example, given:

  A[0] = 1
  A[1] = 3
  A[2] = 6
  A[3] = 4
  A[4] = 1
  A[5] = 2
the function should return 5.

Assume that:

N is an integer within the range [1..100,000];
each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
Complexity:

expected worst-case time complexity is O(N);
expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.

*/

public func solution( A : inout [Int]) -> Int {
    if A.count == 1 {
        let element = A[0]
        if element - 1 > 0 {
            return element - 1
        } else {
            let next = element + 1
            if next > 0 {
                return next
            } else {
                return 1
            }
        }
    }
    
    var hash = Dictionary<Int, Int>()
    for element in A {
        if element > 0 {
            hash[element] = 1
        }
    }
    
    let max = 2147483647
    for number in 1...max {
        if hash[number] == nil {
            return number
        }
    }
    
    return 1
}

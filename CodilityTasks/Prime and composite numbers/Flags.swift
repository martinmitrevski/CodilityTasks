/**

A non-empty zero-indexed array A consisting of N integers is given.

A peak is an array element which is larger than its neighbours. More precisely, it is an index P such that 0 < P < N − 1 and A[P − 1] < A[P] > A[P + 1].

For example, the following array A:

    A[0] = 1
    A[1] = 5
    A[2] = 3
    A[3] = 4
    A[4] = 3
    A[5] = 4
    A[6] = 1
    A[7] = 2
    A[8] = 3
    A[9] = 4
    A[10] = 6
    A[11] = 2
has exactly four peaks: elements 1, 3, 5 and 10.

You are going on a trip to a range of mountains whose relative heights are represented by array A, as shown in a figure below. You have to choose how many flags you should take with you. The goal is to set the maximum number of flags on the peaks, according to certain rules.



Flags can only be set on peaks. What's more, if you take K flags, then the distance between any two flags should be greater than or equal to K. The distance between indices P and Q is the absolute value |P − Q|.

For example, given the mountain range represented by array A, above, with N = 12, if you take:

two flags, you can set them on peaks 1 and 5;
three flags, you can set them on peaks 1, 5 and 10;
four flags, you can set only three flags, on peaks 1, 5 and 10.
You can therefore set a maximum of three flags in this case.

Write a function:

public func solution(inout A : [Int]) -> Int
that, given a non-empty zero-indexed array A of N integers, returns the maximum number of flags that can be set on the peaks of the array.

For example, the following array A:

    A[0] = 1
    A[1] = 5
    A[2] = 3
    A[3] = 4
    A[4] = 3
    A[5] = 4
    A[6] = 1
    A[7] = 2
    A[8] = 3
    A[9] = 4
    A[10] = 6
    A[11] = 2
the function should return 3, as explained above.

Assume that:

N is an integer within the range [1..400,000];
each element of array A is an integer within the range [0..1,000,000,000].
Complexity:

expected worst-case time complexity is O(N);
expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.

*/

public func solution(inout A : [Int]) -> Int {

    if A.count < 3 {
        return 0
    }
    // write your code in Swift 2.2 (Linux)
    var peaks = [Int]()
    for i in 1..<A.count - 1 {
        if A[i] > A[i+1] && A[i] > A[i-1] {
            peaks.append(i)
        }
    }
    
    if peaks.count < 2 {
        return peaks.count
    }
    
    var startingFlag = 1
    var endingFlag = peaks.count
    var result = 1
    while (startingFlag <= endingFlag) {
        let flag = (startingFlag + endingFlag) / 2
        var succeed = false
        var used = 0
        var mark = peaks[0]
        for i in 0..<peaks.count {
            if peaks[i] >= mark {
                used += 1
                mark = peaks[i] + flag
                if used == flag {
                    succeed = true
                    break
                }
            }
        }
        if succeed {
            result = flag
            startingFlag = flag + 1
        } else {
            endingFlag = flag - 1
        }
    }
    
    return result
}
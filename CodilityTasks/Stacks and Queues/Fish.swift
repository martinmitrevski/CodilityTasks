/**

You are given two non-empty zero-indexed arrays A and B consisting of N integers. Arrays A and B represent N voracious fish in a river, ordered downstream along the flow of the river.

The fish are numbered from 0 to N − 1. If P and Q are two fish and P < Q, then fish P is initially upstream of fish Q. Initially, each fish has a unique position.

Fish number P is represented by A[P] and B[P]. Array A contains the sizes of the fish. All its elements are unique. Array B contains the directions of the fish. It contains only 0s and/or 1s, where:

0 represents a fish flowing upstream,
1 represents a fish flowing downstream.
If two fish move in opposite directions and there are no other (living) fish between them, they will eventually meet each other. Then only one fish can stay alive − the larger fish eats the smaller one. More precisely, we say that two fish P and Q meet each other when P < Q, B[P] = 1 and B[Q] = 0, and there are no living fish between them. After they meet:

If A[P] > A[Q] then P eats Q, and P will still be flowing downstream,
If A[Q] > A[P] then Q eats P, and Q will still be flowing upstream.
We assume that all the fish are flowing at the same speed. That is, fish moving in the same direction never meet. The goal is to calculate the number of fish that will stay alive.

For example, consider arrays A and B such that:

  A[0] = 4    B[0] = 0
  A[1] = 3    B[1] = 1
  A[2] = 2    B[2] = 0
  A[3] = 1    B[3] = 0
  A[4] = 5    B[4] = 0
Initially all the fish are alive and all except fish number 1 are moving upstream. Fish number 1 meets fish number 2 and eats it, then it meets fish number 3 and eats it too. Finally, it meets fish number 4 and is eaten by it. The remaining two fish, number 0 and 4, never meet and therefore stay alive.

Write a function:

public func solution(inout A : [Int], inout _ B : [Int]) -> Int
that, given two non-empty zero-indexed arrays A and B consisting of N integers, returns the number of fish that will stay alive.

For example, given the arrays shown above, the function should return 2, as explained above.

Assume that:

N is an integer within the range [1..100,000];
each element of array A is an integer within the range [0..1,000,000,000];
each element of array B is an integer that can have one of the following values: 0, 1;
the elements of A are all distinct.
Complexity:

expected worst-case time complexity is O(N);
expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.

*/

public func solution(inout A : [Int], inout _ B : [Int]) -> Int {
    // write your code in Swift 2.2 (Linux)
    var stack = Stack<(Int, Int, Int)>()
    for index in 0..<A.count {
        let size = A[index]
        let direction = B[index]
        if stack.items.count == 0 {
            stack.push((size, direction, index))
        } else {
            var remainsAlive = true
            while (stack.items.count > 0) {
                let top = stack.topElement()!
                // check if they meet
                if top.1 == 1 && direction == 0 && index > top.2 {
                    // they meet, check size
                    if top.0 > size {
                        // eaten
                        // doesn't go in living fish
                        remainsAlive = false
                        break
                    } else if top.0 < size {
                        // eats the current top
                        stack.pop()
                        // put the new fish in the stack.
                    }
                } else {
                    // they don't meet, put it in the stack.
                    break
                }
            }
            
            if remainsAlive == true {
                stack.push((size, direction, index))
            }   
        }
    }
    
    return stack.items.count
}

struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element? {
        if items.count > 0 {
            return items.removeLast()
        } else {
            return nil
        }
    }
    
    func topElement() -> Element? {
        return items.last
    }
}
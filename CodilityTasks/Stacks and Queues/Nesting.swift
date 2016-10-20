/**
A string S consisting of N characters is called properly nested if:

S is empty;
S has the form "(U)" where U is a properly nested string;
S has the form "VW" where V and W are properly nested strings.
For example, string "(()(())())" is properly nested but string "())" isn't.

Write a function:

public func solution(inout S : String) -> Int

that, given a string S consisting of N characters, returns 1 if string S is properly nested and 0 otherwise.

For example, given S = "(()(())())", the function should return 1 and given S = "())", the function should return 0, as explained above.

Assume that:

N is an integer within the range [0..1,000,000];
string S consists only of the characters "(" and/or ")".
Complexity:

expected worst-case time complexity is O(N);
expected worst-case space complexity is O(1) (not counting the storage required for input arguments).
*/

public func solution( S : inout String) -> Int {
    var stack = Stack<Character>()
    for str in S.characters {
        if str == "(" {
            stack.push(str)
        } else {
            if stack.pop() == nil {
                return 0
            }
        }
    }
    
    let isNested = stack.items.count == 0
    return isNested ? 1 : 0
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
}

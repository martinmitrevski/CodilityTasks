/**

Note: score 66%

A prime is a positive integer X that has exactly two distinct divisors: 1 and X. The first few prime integers are 2, 3, 5, 7, 11 and 13.

A semiprime is a natural number that is the product of two (not necessarily distinct) prime numbers. The first few semiprimes are 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.

You are given two non-empty zero-indexed arrays P and Q, each consisting of M integers. These arrays represent queries about the number of semiprimes within specified ranges.

Query K requires you to find the number of semiprimes within the range (P[K], Q[K]), where 1 ≤ P[K] ≤ Q[K] ≤ N.

For example, consider an integer N = 26 and arrays P, Q such that:

    P[0] = 1    Q[0] = 26
    P[1] = 4    Q[1] = 10
    P[2] = 16   Q[2] = 20
The number of semiprimes within each of these ranges is as follows:

(1, 26) is 10,
(4, 10) is 4,
(16, 20) is 0.
Assume that the following declarations are given:

struct Results {
  int * A;
  int M;
};
Write a function:

struct Results solution(int N, int P[], int Q[], int M);
that, given an integer N and two non-empty zero-indexed arrays P and Q consisting of M integers, returns an array consisting of M elements specifying the consecutive answers to all the queries.

For example, given an integer N = 26 and arrays P, Q such that:

    P[0] = 1    Q[0] = 26
    P[1] = 4    Q[1] = 10
    P[2] = 16   Q[2] = 20
the function should return the values [10, 4, 0], as explained above.

Assume that:

N is an integer within the range [1..50,000];
M is an integer within the range [1..30,000];
each element of arrays P, Q is an integer within the range [1..N];
P[i] ≤ Q[i].
Complexity:

expected worst-case time complexity is O(N*log(log(N))+M);
expected worst-case space complexity is O(N+M), beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.

*/

public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
        var results = [Int]()
        let sieve = sieveForNumber(number: N)
        for i in 0..<P.count {
            let start = P[i]
            let end = Q[i]
            results.append(countOfSemiPrimesForRange(start: start, end: end, sieve: sieve))
        }
        return results
    }
    
    public func sieveForNumber(number: Int) -> [Int] {
        var sieve = [Int](repeating: 0, count: number + 1)
        var i = 2
        while (i * i <= number) {
            if sieve[i] == 0 {
                var k = i * i
                while k <= number {
                    if sieve[k] == 0 {
                        sieve[k] = i
                    }
                    k += i
                }
            }
            i += 1
        }
        
        return sieve
    }
    
    public func countOfSemiPrimesForRange(start: Int, end: Int, sieve: [Int]) -> Int {
        var total = 0
        for i in start...end {
            var primeFactors = 0
            var x = i
            while sieve[x] > 0 {
                primeFactors += 1
                x /= sieve[x]
            }
            primeFactors += 1
            
            if primeFactors == 2 {
                total += 1
            }
        }
        
        return total
    }

// This module contains general purpose combinatorial functions


/*
Create a function 'fact' that calculates the factorial of a number.
arguments:
- 'n' unsigned integer
returns:
- unsigned integer
details:
- this function does not use recursion
*/
/**
 * Calculates the factorial of a given number.
 * @param n - The number to calculate the factorial for.
 * @returns The factorial of the given number.
 * @example fact(5) // returns 120
 * @example fact(0) // returns 1
 * @example fact(1) // returns 1
 * @example fact(10) // returns 3628800
 */
export function fact(n: number): number {
  let result = 1;
  for (let i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

/**
 * Calculates the permutation of n items taken r at a time.
 * @param n - The total number of items.
 * @param r - The number of items to take.
 * @returns The permutation of n items taken r at a time.
 * @example permutation(5, 3) // returns 60
 * @example permutation(5, 5) // returns 120
 * @example permutation(5, 0) // returns 1
 */
export function permutation(n: number, r: number): number {
  return fact(n) / fact(n - r);
}


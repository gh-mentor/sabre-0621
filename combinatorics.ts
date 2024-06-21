// This module contains general purpose combinatorial functions


// Function: factorial

// Create a factorial function that takes a number and returns the factorial of that number
export function factorial(n: number): number {
  if (n === 0) {
    return 1;
  }
  return n * factorial(n - 1);
}

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
 */
export function fact(n: number): number {
  let result = 1;
  for (let i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}
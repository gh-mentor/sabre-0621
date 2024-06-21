class Combinatorics {
    /*
Refactor the selected code into a class 'Combinatorics'. The functions should be static.
    */
    
    /**
     * Calculates the factorial of a given number.
     * @param n - The number to calculate the factorial for.
     * @returns The factorial of the given number.
     * @example Combinatorics.fact(5) // returns 120
     * @example Combinatorics.fact(0) // returns 1
     * @example Combinatorics.fact(1) // returns 1
     * @example Combinatorics.fact(10) // returns 3628800
     */
    static fact(n: number): number {
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
     * @example Combinatorics.permutation(5, 3) // returns 60
     * @example Combinatorics.permutation(5, 5) // returns 120
     * @example Combinatorics.permutation(5, 0) // returns 1
     */
    static permutation(n: number, r: number): number {
      return this.fact(n) / this.fact(n - r);
    }
  }
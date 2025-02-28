def fib_recursion(n):
    """
    Calculate Fibonacci number using recursion.
    """
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib_recursion(n-1) + fib_recursion(n-2)

def fib_memoization(n, memo={}):
    """
    Calculate Fibonacci number using memoization.
    """
    if n in memo:
        return memo[n]
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    else:
        memo[n] = fib_memoization(n-1, memo) + fib_memoization(n-2, memo)
        return memo[n]

def fib_iterative(n):
    """
    Calculate Fibonacci number using an iterative approach.
    """
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    a, b = 0, 1
    for _ in range(2, n+1):
        a, b = b, a + b
    return b

def fib_dynamic_programming(n):
    """
    Calculate Fibonacci number using dynamic programming.
    """
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    fib = [0] * (n + 1)
    fib[1] = 1
    for i in range(2, n + 1):
        fib[i] = fib[i - 1] + fib[i - 2]
    return fib[n]

def fib_matrix(n):
    """
    Calculate Fibonacci number using matrix exponentiation.
    """
    def multiply_matrices(A, B):
        return [
            [A[0][0] * B[0][0] + A[0][1] * B[1][0], A[0][0] * B[0][1] + A[0][1] * B[1][1]],
            [A[1][0] * B[0][0] + A[1][1] * B[1][0], A[1][0] * B[0][1] + A[1][1] * B[1][1]]
        ]

    def matrix_power(matrix, power):
        result = [[1, 0], [0, 1]]
        base = matrix
        while power:
            if power % 2 == 1:
                result = multiply_matrices(result, base)
            base = multiply_matrices(base, base)
            power //= 2
        return result

    if n <= 0:
        return 0
    elif n == 1:
        return 1
    F = [[1, 1], [1, 0]]
    result = matrix_power(F, n - 1)
    return result[0][0]

def fib_binet(n):
    """
    Calculate Fibonacci number using Binet's formula.
    """
    from math import sqrt
    phi = (1 + sqrt(5)) / 2
    psi = (1 - sqrt(5)) / 2
    return int((phi**n - psi**n) / sqrt(5))

if __name__ == '__main__':
    from matplotlib import pyplot as plt
    import time
    n = 30
    functions = [fib_recursion, fib_memoization, fib_iterative, fib_dynamic_programming, fib_matrix, fib_binet]
    timings = []

    for func in functions:
        start = time.time()
        result = func(n)
        end = time.time()
        timings.append((func.__name__, end - start))

    timings.sort(key=lambda x: x[1])

    for name, timing in timings:
        print(f'{name}({n}) = {timing:.6f} sec')




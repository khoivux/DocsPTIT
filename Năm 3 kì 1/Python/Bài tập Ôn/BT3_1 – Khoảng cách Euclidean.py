import math

def solve(x, y):
    if len(x) != len(y):
        return 'INVALID'
    res = 0
    for i in range(len(x)):
        res += (y[i] - x[i]) ** 2
    return f'{res ** 0.5:.5f}'

def main():
    for t in range(int(input())):
        x = [int(a) for a in input().split()]
        y = [int(a) for a in input().split()]
        print(solve(x, y))

if __name__ == "__main__":
    main()
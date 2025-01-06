import math

def solve(x, y, p):
    if len(x) != len(y):
        return 'INVALID'
    res = 0
    for i in range(len(x)):
        res += math.fabs(y[i] - x[i]) ** p
    return f'{res ** (1 / p):.5f}'

def main():
    for t in range(int(input())):
        x = [int(a) for a in input().split()]
        y = [int(a) for a in input().split()]
        p = int(input())
        print(solve(x, y, p))

if __name__ == "__main__":
    main()
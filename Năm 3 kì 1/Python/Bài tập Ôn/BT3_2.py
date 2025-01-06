import math

def solve(x, y):
    if len(x) != len(y):
        return 'INVALID'
    res = 0
    for i in range(len(x)):
        res += math.fabs(y[i] - x[i]) 
    return f'{res:.5f}'

def main():
    for t in range(int(input())):
        x = [int(a) for a in input().split()]
        y = [int(a) for a in input().split()]
        print(solve(x, y))

if __name__ == "__main__":
    main()
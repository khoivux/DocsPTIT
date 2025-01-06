import math

def solve(a, b):
    if len(a) != len(b): return 'INVALID'
    seA, seB = set(), set()
    for i in range(len(a)):
        seA.add(a[i])
        seB.add(b[i])
    res = len(seA.intersection(seB)) / len(seB.union(seA))
    return f'{res:.5f}'
def main():
    for t in range(int(input())):
        a = [int(x) for x in input().split()]
        b = [int(x) for x in input().split()]
        print(solve(a, b))

if __name__ == "__main__":
    main()
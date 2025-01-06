import math

def solve(n):
    check = set()
    while n != 1:
        if n in check:
            return 'NO'
        check.add(n)
        n = sum(int(i) ** 2 for i in str(n))
    return 'YES'

def main():
    print(solve(int(input())))

if __name__ == "__main__":
    main()
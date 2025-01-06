import math

def solve(arr, k):
    if arr.count(k) == 0:
        return -1
    else:
        res = []
        while arr.count(k):
            res.append(str(arr.index(k)))
            arr[arr.index(k)] -= 1
        return ', '.join(res)

def main():
    n = int(input())
    arr = list(map(int, input().split()))
    k = int(input())
    print(solve(arr, k))

if __name__ == "__main__":
    main()
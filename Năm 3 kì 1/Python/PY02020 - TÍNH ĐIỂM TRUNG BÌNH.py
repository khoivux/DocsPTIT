import math
 
def main():
    n = int(input())
    arr = list(map(float, input().split()))
    minA = min(arr)
    maxA = max(arr)
    for i in arr:
        if i == minA or i == maxA:
           arr.remove(i)
    print(f"{sum(arr) / len(arr):.2f}")   

if __name__ == "__main__":
    main()

# 6
# 6.75 8 9.2 7.25 7.75 6.75
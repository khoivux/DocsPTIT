import math

def solve(n):
    tich = 1
    tong = 0
    for i in range(len(n)):
        num = int(n[i])
        if (i + 1) % 2 == 0:
            tong += num
        elif num != 0:
            tich *= num
    if tong == 0: return 'INVALID'
    return f'{tich / tong:.6f}'
def main():
    for t in range(int(input())):
        print(solve(input()))

if __name__ == "__main__":
    main()
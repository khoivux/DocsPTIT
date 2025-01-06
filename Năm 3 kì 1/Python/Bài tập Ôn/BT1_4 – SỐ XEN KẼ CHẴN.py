import math

def solve(n):
    if len(n) & 1 or len(n) < 3 or n[0] == n[2]: 
        return 'NO'
    num = n[1]
    for i in range(len(n)):
        if (i + 1) % 2 == 0 and n[i] != num:
            return 'NO'
    return 'YES'
def main():
    for t in range(int(input())):
       print(solve(input())) 

if __name__ == "__main__":
    main()
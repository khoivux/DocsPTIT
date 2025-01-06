import math



def main():
    for t in range(int(input())):
        n = int(input())
        s, tmp = 0, 1
        if n & 1: start = 1
        else: start = 2

        for i in range(start, n+1, 2):
           s += tmp * (1 / i)
           tmp *= -1
        
        print(f'{s:.5f}')

if __name__ == "__main__":
    main()
import math

def main():
    for t in range(int(input())):
        s, k = map(str, input().split())
        s = list(s)
        k = int(k) % 26
        res = ''
        for c in s:
            if 'a' <= c <= 'z':
                c = chr((ord(c) - ord('a') + k) % 26 + ord('a'))
            if 'A' <= c <= 'Z':
                c = chr((ord(c) - ord('A') + k) % 26 + ord('Z'))
            res += c
        print(res)
if __name__ == "__main__":
    main()
import math



def main():
    for t in range(int(input())):
        s = input()
        cnt = [0] * len(s)
        res = 0
        for i in range(len(s)):
            if i == 0 and s[i] == '0': 
                cnt[i] = 1
                continue
            if s[i] == '0': cnt[i] = cnt[i - 1] + 1
            res = max(res, cnt[i])
        print(res)

if __name__ == "__main__":
    main()
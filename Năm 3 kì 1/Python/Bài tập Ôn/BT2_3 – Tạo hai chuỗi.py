import math



def main():
    for t in range(int(input())):
        s = input()
        res1, res2 = '', ''
        for c in s:
            if s.count(c) == 1 and c not in res1: res1 += c
            if s.count(c) > 1 and c not in res2: res2 += c
        print(f'{res1 if res1 != '' else 'NONE'}')
        print(f'{res2 if res2 != '' else 'NONE'}')
if __name__ == "__main__":
    main()
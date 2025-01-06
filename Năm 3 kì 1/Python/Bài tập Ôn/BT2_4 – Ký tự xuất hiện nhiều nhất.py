import math



def main():
    for t in range(int(input())):
        s = input()
        Max = max([s.count(c) for c in s])
        for c in s:
            if s.count(c) == Max: 
                print(c)
                break;
if __name__ == "__main__":
    main()
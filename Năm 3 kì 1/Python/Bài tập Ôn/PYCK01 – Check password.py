import math
import re

def validate(p):
    if len(p) < 6 or len(p) > 12: return False
    if not re.search(r'[a-z]', p): return False
    if not re.search(r'[A-Z]', p): return False
    if not re.search(r'[0-9]', p): return False
    if not re.search(r'[$#@!]', p): return False
    return True
def main():
    arr = list(str(x).strip() for x in input().split(','))
    check = False
    
    for p in arr:
        if validate(p): 
            check = True
            print(p)
    if not check: print("INVALID PASSWORD")
if __name__ == "__main__":
    main()
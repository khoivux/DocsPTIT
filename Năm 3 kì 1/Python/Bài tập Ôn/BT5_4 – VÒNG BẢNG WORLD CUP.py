import math

class CLB:
    def __init__(self, ten, diem, hso, bthang):
        self.ten = ten
        self.diem = diem
        self.hso = hso
        self.bthang = bthang
    
    def __str__(self):
        return f"{self.ten} {self.diem} {self.hso} {self.bthang}"

def main():
    ds = []
    for t in range(int(input())):
        ten = input()
        arr = list(map(int, input().split()))
        ds.append(CLB(ten, arr[0], arr[1], arr[2]))
    ds.sort(key = lambda x : (-x.diem, -x.hso, -x.bthang))
    for clb in ds: print(clb)
if __name__ == "__main__":
    main()
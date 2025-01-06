import math

class ThiSinh:
    def __init__(self, ten, ns, diem1, diem2, diem3):
        self.ten = ten
        self.ns = ns
        self.diem1 = diem1
        self.diem2 = diem2
        self.diem3 = diem3
        self.gpa = (self.diem1 + self.diem2 + self.diem3 + min(self.diem1, self.diem2, self.diem3)) / 4

    def __str__(self):
        return f"{self.ten} {self.ns} {self.gpa:.1f}"
    

def main():
    ds = []
    for t in range(int(input())):
        ds.append(ThiSinh(input(), input(), float(input()), float(input()), float(input()) ))
    ds.sort(key = lambda x :- x.gpa)
    for ts in ds:
        print(ts)

if __name__ == "__main__":
    main()
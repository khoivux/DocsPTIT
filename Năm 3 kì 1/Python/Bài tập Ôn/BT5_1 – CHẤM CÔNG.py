import math
from datetime import datetime
class NhanVien:
    def __init__(self, ma, ten, gio_bd, gio_kt):
        self.ma = ma
        self.ten = ten
        self.gio_bd = gio_bd
        self.gio_kt = gio_kt
        self.gio_lam = (self.gio_kt - self.gio_bd).total_seconds() - 3600
    def thoi_gian_lam(self):
        gio = int(self.gio_lam // 3600)
        phut = int((self.gio_lam % 3600) // 60)
        return f'{gio} gio {phut} phut'
    def rank(self):
        gio = self.gio_lam // 3600
        if gio >= 8: return 'DU'
        else: return 'THIEU'
    
    def __str__(self):
        return f'{self.ma} {self.ten} {self.thoi_gian_lam()} {self.rank()}'

def main():
    fmt = '%H:%M'
    ds = []
    for t in range(int(input())):
        ma = input()
        ten = input()
        gio_bd = datetime.strptime(input(), fmt)
        gio_kt = datetime.strptime(input(), fmt)
        ds.append(NhanVien(ma, ten, gio_bd, gio_kt))
    ds.sort(key = lambda x : x.gio_lam)
    for nv in ds:
        print(nv)

if __name__ == "__main__":
    main()
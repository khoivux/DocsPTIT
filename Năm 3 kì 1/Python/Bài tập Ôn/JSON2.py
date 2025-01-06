import json
import math




class Table:
    def __init__(self, total, tip, sex, smoker, day, time, size):
        self.total = total
        self.tip = tip
        self.sex = sex
        self.smoker = smoker
        self.day = day
        self.time = time
        self.size = size 
    
    def decode(dct):
        return Table(dct['total'], dct['tip'], dct['sex'], dct['smoker'], dct['day'], dct['time'], dct['size'])

def solve(ds, day, numbers):
    tables = [table for table in ds if table.day == day and table.size == numbers]
    if len(tables) == 0: return 'Invalid'
    total_bill = sum(float(table.total) for table in tables)
    return total_bill

def main():
    with open('C:\\Users\\TRONG KHOI\\Desktop\\PTIT\\python\\tips.json', 'r') as f:
        data = json.load(f)
    ds = [Table.decode(dct) for dct in data.get('tips', [])]
    for t in range(int(input())):
        day, numbers = map(str, input().split())
        print(solve(ds, day, numbers))
if __name__ == "__main__":
    main()
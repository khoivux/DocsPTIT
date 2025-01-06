import json
import math

class Flight:
    def __init__(self, year, month, passengers):
        self.year = year
        self.month = month
        self.passengers = passengers

def decode(dct):
    return Flight(dct['year'],  dct['month'], dct['passengers'])

def solve(ds, request, year):
    fs = [int(f.passengers) for f in ds if f.year == year]
    if len(fs) == 0: return 'INVALID'
    if request == 'min':
         return min(p for p in fs)
    elif request =='max':
         return max(p for p in fs)
    elif request =='avg':
         return sum(p for p in fs) / len(fs)
    else:
         return sum(p for p in fs)
def main():
    with open('C:\\Users\\TRONG KHOI\\Desktop\\PTIT\\python\\flights.json', 'r') as f:
            data = json.load(f)
    ds = [decode(flight) for flight in data.get("flights", [])]
    for t in range(int(input())):
        arr = list(map(str, input().split()))
        year = arr[0]
        request = arr[1]
        print(solve(ds, request, year))
if __name__ == "__main__":
    main()
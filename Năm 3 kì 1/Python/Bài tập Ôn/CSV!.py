import csv
import math

class DaiHoa:
    def __init__(self, sepal_length,sepal_width,petal_length,petal_width,species):
        self.sepal_length = (sepal_length)
        self.sepal_width = (sepal_width)
        self.petal_length = (petal_length)
        self.petal_width = (petal_width)
        self.species = species

    def decode(arr):
        return DaiHoa(*arr)


    def __str__(self):
        return f"{self.sepal_length}, {self.sepal_width}, {self.petal_length}, {self.petal_width}, {self.species}"

def solve(ds, flower, type, request):
    dss = [i for i in ds if i.species == flower]
    if len(dss) == 0: return 'INVALID'
    sum_sepal_length = sum(float(i.sepal_length) for i in dss)
    sum_petal_length = sum(float(i.petal_length) for i in dss)

    if request == 'avg':
        return sum_sepal_length / len(dss)
    elif request == 'max':
        return max(float(i.sepal_length) for i in dss), max(float(i.petal_length) for i in dss)
    elif request =='min':
        return min(float(i.sepal_length) for i in dss), min(float(i.petal_length) for i in dss)
def main():
    ds = []
    with open('C:\\Users\\TRONG KHOI\\Desktop\\test.csv', newline='') as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            ds.append(DaiHoa.decode(row))
    for t in range(int(input())):
        flower, type, request = map(str, input().split())
        print(solve(ds, flower, type, request))
if __name__ == "__main__":
    main()
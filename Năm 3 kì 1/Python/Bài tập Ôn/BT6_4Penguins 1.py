from base64 import decode
import csv
import json
import math



def main():
    
    #File txt
    with open('SOTAY.txt', 'r') as file:
        inp = file.read().split('\n')

    # File CSV
    with open('C:\\Users\\TRONG KHOI\\Desktop\\pen.csv', 'r') as csvfile:
        lines = csv.reader(csvfile)
        for line in lines:
            print(line)

    # File JSON      
    with open('C:\\Users\\TRONG KHOI\\Desktop\\PTIT\\python\\tips.json', 'r') as f:
        data = json.load(f)
    ds = [decode(dct) for dct in data.get('tips', [])]


if __name__ == "__main__":
    main()
def Bai_4_1():
    car = 'subaru'
    print("Is car == 'subaru'? I predict True.")
    print(car == 'subaru')

    print("\nIs car == 'audi'? I predict False.")
    print(car == 'audi')

    age = 25
    print("\nIs age == 25? I predict True.")
    print(age == 25)

    print("\nIs age > 30? I predict False.")
    print(age > 30)

    food = 'pizza'
    print("\nIs food == 'pizza'? I predict True.")
    print(food == 'pizza')

    print("\nIs food == 'burger'? I predict False.")
    print(food == 'burger')

    temperature = 35
    print("\nIs temperature < 40? I predict True.")
    print(temperature < 40)

    print("\nIs temperature > 40? I predict False.")
    print(temperature > 40)

    city = 'Hanoi'
    print("\nIs city == 'Hanoi'? I predict True.")
    print(city == 'Hanoi')

    print("\nIs city == 'Saigon'? I predict False.")
    print(city == 'Saigon')

def Bai_4_2():
    name = 'Khoi'
    if name == 'Khoi':
        print("The name is 'Khoi'")
    else:
        print("The name is not 'Khoi'")
    
    s = 'string'
    if s == s.lower():
        print("It is in lowercase")
    else:
        print("It is not in lowercase")

    num = 20
    if num > 10:
        print("The number is greater than 10")
    elif num < 10:
        print("The number is less than 10")
    else:
        print("The number equals 10")

    num = 20
    if num > 10 and num % 2 == 0:
        print("That number is greater than 10 and is even")

    letters = ['A', 'B', 'C']
    if 'A' in letters:
        print("A is in the list of letters")
    else:
        print("A is not in the list of letters")

def Bai_4_3():
    alien_color = 'green'
    if alien_color == 'green':
        print("You earned 5 points")

    alien_color = 'yellow'
    if alien_color == 'green':
        print("You earned 5 points")

def Bai_4_4():
    alien_color = 'green'
    if alien_color == 'green':
        print("You earned 5 points!")
    else:
        print("You earned 10 points!")

    alien_color = 'red'
    if alien_color == 'green':
        print("You earned 5 points!")
    else:
        print("You earned 10 points!")

def Bai_4_5():
    alien_color = 'yellow'
    # alien_color = 'green'
    # alien_color = 'red'
    if alien_color == 'green':
        print("You earned 5 points!")
    elif alien_color == 'yellow':
        print("You earned 10 points!")
    else: 
        print("You earned 15 points!")

def Bai_4_6():
    age = 10
    if age < 2:
        print("Baby")
    elif age <= 4:
        print("Toddler")
    elif age > 4 and age <= 13:
        print("Kid")
    elif age > 13 and age <= 20:
        print("Teenager")
    elif age > 20 and age <= 65:
        print("Adult")
    else:
        print("Elder")

def Bai_4_7():
    favorite_fruits = ['banana', 'orange', 'mango']

    fruit = "banana"
    if fruit in favorite_fruits:
        print(f"You really like {fruit}!")

    fruits = "orange"
    if fruits in favorite_fruits:
        print(f"You really like {fruit}!")

    fruits = "mango"
    if fruits in favorite_fruits:
        print(f"You really like {fruit}!")

    fruits = "watermelon"
    if fruits in favorite_fruits:
        print(f"You really like {fruit}!")

    fruits = "lemon"
    if fruits in favorite_fruits:
        print(f"You really like {fruit}!")

def Bai_4_8():
    users = ['A', 'B', 'C', 'quản trị viên']
    for user in users:
        if user == 'quản trị viên':
            print(f"Hello {user}, would you like to see the status report?")
        else:
            print(f"Hello {user}, thank you for logging in again!")

def Bai_4_9():
    users = []
    if not users:
        print("We need to find some users!")
    else:
        for user in users:
            if user == 'quản trị viên':
                print(f"Hello {user}, would you like to see the status report?")
            else:
                print(f"Hello {user}, thank you for logging in again!")

def Bai_4_10():
    current_users = ['A', 'B', 'C', 'D', 'E']
    new_users = ['D', 'E', 'F']

    for new_user in new_users:
        if new_user in current_users:
            print(f"Sorry, the username '{new_user}' is already taken. Please choose a different one.")
        else:
            print(f"The username '{new_user}' is available.")

def Bai_4_11():
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    for number in numbers:
        if number == 1:
            print(f"{number}st")
        elif number == 2:
            print(f"{number}nd")
        elif number == 3:
            print(f"{number}rd")
        else:
            print(f"{number}th")

##### STRING
def Bai_01():
    s = input()
    print(s[2])
    print(s[-2])
    print(s[:5])
    print(s[:-2])
    print(s[::2])
    print(s[1::2])
    print(s[::-1])
    print(s[::-2])
    print(len(s))

def Bai_02():
    s = input()
    print(len(s.split()))

def Bai_03():
    s = input()

    s1 = s[:(len(s) + 1) // 2]
    s2 = s[len(s) // 2:]

    new_string = s2 + s1
    print(new_string)

def Bai_04():
    s = input()
    c = 'a'
    print(s.find(c))

def Bai_05():
    s = input()
    c = 'a'
    first_index = s.find(c)
    if first_index == -1:
        print(-2)
    else:
        second_index = s[first_index + 1:].find(c)
        if second_index == -1:
            print(-1)
        else:
            print(first_index + 1 + second_index)

def Bai_06():
    s = input()
    c = 'a'
    first_index = s.find(c)
    last_index = s.rfind(c)
    if first_index == -1 or first_index == last_index:
        print(s)
    else:
        res = s[:first_index] + s[last_index + 1:]
        print(res)

def Bai_07():
    s= input()
    c = 'a'
    first_index = s.find(c)
    last_index = s.rfind(c)
    if first_index == -1 or first_index == last_index:
        print(s)
    else:
        result = s[:first_index] + s[first_index:last_index + 1][::-1] + s[last_index + 1:]
        print(result)

def Bai_08():
    s = input()
    print(s.replace('1', 'one'))

def Bai_09():
    s = input()
    print(s.replace('c', ''))

def Bai_10():
    s = input()
    c ='a'
    cnew = 'b'
    first, second = s.find(c), s.rfind(c)
    for i in range(0, len(s)):
        if(s[i] == c and i not in [first, second]):
            s = s[:i] + cnew + s[i + 1:]
    print(s)

def Bai_11():
    s = input()
    for i in range(0, len(s), 2):
        s = s[:i] + s[i + 1:]
    print(s)

def Bai_12():
    t = input()
    w_old = input()
    w_new = input()
    while w_old in t:
        t = t.replace(w_old, w_new)
    print(t)

def Bai_13():
    num1 = 3.123456
    num2 = 5.423224
    s = str(num1 * num2)
    res = -1
    for char in s:
        if char.isdigit():
            res = max(res, int(char))
    print(res)

def Bai_14():
    words = input().split()

    max_length = 0
    longest_word = ""
    for word in words:
        if len(word) > max_length:
            max_length = len(word)
            longest_word = word
    print(longest_word)
    print(max_length)

def Bai_15():
    s = input()
    if s == s[::-1]:
        print("Yes")
    else:
        print("No")

def Bai_16():
    n = int(input())
    b = int(input())
    if n == 0:
        return "0"
    digits = ""
    while n > 0:
        r = n % b
        if r>= 10:
            digits += chr(r - 10 + ord('A'))
        else:
            digits += str(r)
        n //= b
    return digits[::-1]

def Bai_17():
    a = input()
    b = a[::-1]
    def checkP(s:str) -> bool:
        st,ed = 0,len(s)-1
        while st <= ed:
            if s[st] != s[ed]:
                return False;
            st += 1
            ed -= 1
        return True
    c = str(int(a) + int(b))
    while(not checkP(c)):
        a = c
        b = a[::-1]
        c = str(int(a)+int(b))
    print(c)

def Bai_18():
    s = input()
    if s.endswith(('c', 'C')):
        tf = 9 * float(s[:-1]) / 5 + 32
        print(f'{tf:.2f}')
    else:
        tc = 5 * float(s[:-1]) / 9 -32
        print(f'{tc:.2f}')
Bai_18()
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
    # Kiểm tra đẳng thức và bất đẳng thức với chuỗi
    name = 'Khoi'
    if name == 'Khoi':
        print("The name is 'Khoi'")
    else:
        print("The name is not 'Khoi'")
    
    # Kiểm tra sử dụng phương thức lower()
    s = 'string'
    if s == s.lower():
        print("It is in lowercase")
    else:
        print("It is not in lowercase")

    # Kiểm tra có điều kiện với số
    num = 20
    if num > 10:
        print("The number is greater than 10")
    elif num < 10:
        print("The number is less than 10")
    else:
        print("The number equals 10")

    # Kiểm tra có điều kiện sử dụng từ khóa and và or
    num = 20
    if num > 10 and num % 2 == 0:
        print("That number is greater than 10 and is even")

    # Kiểm tra xem một phần tử có/không có trong danh sách
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
    
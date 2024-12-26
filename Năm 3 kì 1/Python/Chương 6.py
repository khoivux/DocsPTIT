def Bai_6_1():
    print('What kind of car do you want to rent', end = ': ')
    car = str(input())
    print('Let me see if I can fnd you a ' + car)

def Bai_6_2():
    print('How many places you want to book ?')
    n = int(input())
    if n > 8:
        print('You need to wait a moment for us to arrange the table.')
    else: 
        print('Your table is ready. Would you like to be seated now?')

def Bai_6_3():
    print('Please enter a number', end = ': ')
    number = int(input())
    if number % 10 == 0:
        print('It is a multiple of 10.')
    else: 
        print("It isn't a multiple of 10")
              
def Bai_6_4():
     while True:
        topping = input("Enter a pizza topping (or type 'quit' to finish): ")
        if topping == 'quit':
            break
        print(f"Added topping '{topping}' to your pizza!")
        

def Bai_6_5():
    age = input("Please enter your age: ")
    if age < 3:
        print("The ticket price is free.")
    elif age <= 12: 
        print("The ticket price is 10$.") 
    else:
        print("The ticket price is 15$.") 

def Bai_6_6():
    #1
    topping = ""
    while topping != "quit":
        topping = input("Enter a pizza topping (or type 'quit' to finish): ")
        print(f"Added topping '{topping}' to your pizza!")
    2
    active = True
    while active:
        topping = input("Enter a pizza topping (or type 'quit' to finish): ")
        if topping == 'quit':
            active = False
        print(f"Added topping '{topping}' to your pizza!")
    #3
    while True:
        ageInput = input("Please enter your age (or type 'quit' to finish): ") 
        if ageInput == "quit":
            break
        age = int(ageInput)
        if age < 3:
            print("The ticket price is free.")
        elif age <= 12: 
            print("The ticket price is 10$.") 
        else:
            print("The ticket price is 15$.") 

def Bai_6_7():
    while True:
        print("This is an infinite loop. Press Ctrl+C to stop it.")

def Bai_6_8():
    sandwich_orders = [
        "A Sandwich",
        "B Sandwich",
        "C Sandwich",
        "D Sandwich",
        "E Sandwich"
    ]
    finished_sandwiches = []

    for sandwich in sandwich_orders:
        print(f"I've made a {sandwich} for you.")
        finished_sandwiches.append(sandwich)

    print("\nAll sandwiches have been made:")
    for finished in finished_sandwiches:
        print(f"- {finished}")

def Bai_6_9():
    sandwich_orders = [
        "A Sandwich",
        "B Sandwich",
        "Pastrami Sandwich",
        "C Sandwich",
        "Pastrami Sandwich",
        "D Sandwich",
        "Pastrami Sandwich",
        "E Sandwich"
    ]

    print("We're sorry, but we're out of pastrami sandwiches.")
    while "Pastrami Sandwich" in sandwich_orders:
        sandwich_orders.remove("Pastrami Sandwich")

    print("Updated sandwich orders:")
    print(sandwich_orders)

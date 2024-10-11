
def Bai_3_1():
    names = ["A", "B", "C"]
    for name in names:
        print(name)

def Bai_3_2():
    names = ["A", "B", "C"]
    for name in names:
        print(f"Hello {name}, how are you?")

def Bai_3_3():
    vehicles = ["Honda motorcycle", "Tesla car", "Boeing airplane"]
    for vehicle in vehicles:
        print(f"I would like to own a {vehicle}.")

def Bai_3_4():
    guests = ["A", "B", "C"]
    for guest in guests:
        print(f"Dear {guest}, I would like to invite you to dinner.")

def Bai_3_5():
    guests = ["A", "B", "C"]
    print(f"Unfortunately, {guests[1]} cannot make it.")
    guests[1] = "D"
    for guest in guests:
        print(f"Dear {guest}, I would like to invite you to dinner.")
        
def Bai_3_6():
    guests = ["A", "D", "C"]
    print("Good news, I found a bigger table!")
    guests.insert(0, "E")
    guests.insert(2, "F")
    guests.append("G")
    for guest in guests:
        print(f"Dear {guest}, I would like to invite you to dinner.")

def Bai_3_7():
    guests = ["E", "A", "F", "D", "C", "G"]
    print("Sorry, I can only invite two guests.")
    while len(guests) > 2:
        removed_guest = guests.pop()
        print(f"Sorry {removed_guest}, I can't invite you to dinner.")
    for guest in guests:
        print(f"{guest}, you're still invited!")
    del guests[0]
    del guests[0]
    print(f"Final guest list: {guests}")

def Bai_3_8():
    locations = ["Tokyo", "Paris", "New York", "Sydney", "Cairo"]
    print("Original list:", locations)
    print("Alphabetical order:", sorted(locations))
    print("Original list again:", locations)
    print("Reverse alphabetical:", sorted(locations, reverse=True))
    print("Original list again:", locations)
    locations.reverse()
    print("Reversed list:", locations)
    locations.reverse()
    print("Back to original:", locations)
    locations.sort()
    print("Sorted list:", locations)
    locations.sort(reverse=True)
    print("Reverse sorted list:", locations)

def Bai_3_9():
    locations = ["Tokyo", "Paris", "New York", "Sydney", "Cairo"]
    print(f"There are {len(locations)} locations in the list.")

def Bai_3_10():
    rivers = ["Nile", "Amazon", "Yangtze", "Mississippi", "Ganges"]
    print("Original list:", rivers)
    print("First three:", rivers[:3])
    print("Middle three:", rivers[1:4])
    print("Last three:", rivers[-3:])
    rivers.append("Danube")
    rivers.insert(2, "Volga")
    print("Updated list with new rivers:", rivers)
    rivers.sort()
    print("Sorted rivers:", rivers)
    rivers.reverse()
    print("Reversed rivers:", rivers)

def Bai_3_11():
    pizzas = ["Pepperoni", "Margarita", "BBQ Chicken"]
    for pizza in pizzas:
        print(f"I like {pizza} pizza.")
    print("I really love pizza!")

def Bai_3_12():
    animals = ["Dog", "Cat", "Rabbit"]
    for animal in animals:
        print(f"A {animal} would make a great pet.")
    print("Any of these animals would make a great pet!")

def Bai_3_13():
    for number in range(1, 21):
        print(number)

def Bai_3_14():
    for number in range(1, 1000001):
        print(number)

def Bai_3_15():
    numbers = list(range(1, 1000001))
    print(f"Min: {min(numbers)}, Max: {max(numbers)}, Sum: {sum(numbers)}")

def Bai_3_16():
    for number in range(1, 21, 2):
        print(number)

def Bai_3_17():
    threes = [number for number in range(3, 31, 3)]
    for number in threes:
        print(number)

def Bai_3_18():
    cubes = [number**3 for number in range(1, 11)]
    for cube in cubes:
        print(cube)

def Bai_3_19():
    cubes = [number**3 for number in range(1, 11)]
    print(cubes)

def Bai_3_20():
    fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
    print(f"The first three items in the list are: {fruits[:3]}")
    print(f"Three items from the middle are: {fruits[1:4]}")
    print(f"The last three items in the list are: {fruits[-3:]}")

def Bai_3_21():
    pizzas = ["Pepperoni", "Margarita", "BBQ Chicken"]
    friend_pizzas = pizzas[:] 

    pizzas.append("Hawaiian")
    friend_pizzas.append("Vegetarian")

    print("My favorite pizzas are:")
    for pizza in pizzas:
        print(pizza)

    print("\nMy friend’s favorite pizzas are:")
    for pizza in friend_pizzas:
        print(pizza)

def Bai_3_22():
    fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
    vegetables = ["Carrot", "Broccoli", "Spinach", "Potato", "Pepper"]
    print("Fruits:")
    for fruit in fruits:
        print(fruit)

    print("\nVegetables:")
    for vegetable in vegetables:
        print(vegetable)

def Bai_3_23Buffet():
    foods = ("Pizza", "Burger", "Pasta", "Salad", "Soup")
    print("The buffet menu includes:")
    for food in foods:
        print(food)

    # foods[0] = "Sushi"  

    foods = ("Sushi", "Ramen", "Pasta", "Salad", "Soup")

    print("\nThe updated buffet menu includes:")
    for food in foods:
        print(food)

#####CHUONG 6
def Bai_6_8Deli():
    sandwich_orders = ["Tuna", "Turkey", "Veggie", "Pastrami", "Ham", "Pastrami", "Club"]
    finished_sandwiches = []
    for sandwich in sandwich_orders:
        print(f"I made your {sandwich} sandwich.")
        finished_sandwiches.append(sandwich)
    print("\nThe following sandwiches have been made:")
    for finished in finished_sandwiches:
        print(finished)

def Bai_6_9No_Pastrami():
    sandwich_orders = ["Tuna", "Turkey", "Pastrami", "Veggie", "Ham", "Pastrami", "Club", "Pastrami"]
    print("Sorry, we are out of pastrami.") 
    while "Pastrami" in sandwich_orders:
        sandwich_orders.remove("Pastrami")
    print("\nUpdated sandwich orders:")
    print(sandwich_orders)

def Bai_6_10Dream_Vacation():
    responses = {}
    while True:
        name = input("What is your name? ")
        vacation_place = input("If you could visit one place in the world, where would you go? ")
        responses[name] = vacation_place 
        repeat = input("Would you like to let another person respond? (yes/no) ")
        if repeat.lower() != 'yes':
            break
    print("\n--- Survey Results ---")
    for name, vacation in responses.items():
        print(f"{name} would like to visit {vacation}.")

######CHUONG 7
def Bai_7_9Messages():
    messages = [
        "Hello, how are you?",
        "I hope you are having a great day!",
        "Don't forget our meeting tomorrow.",
        "Happy birthday!",
        "Let's catch up soon."
    ]
    
    show_messages(messages)

def show_messages(messages):
    for message in messages:
        print(message)

def Bai_7_10Sending_Messages():
    messages = [
        "Hello, how are you?",
        "I hope you are having a great day!",
        "Don't forget our meeting tomorrow.",
        "Happy birthday!",
        "Let's catch up soon."
    ]
    
    sent_messages = []
    send_messages(messages, sent_messages)

def send_messages(messages, sent_messages):
    for message in messages:
        print(message)
        sent_messages.append(message)

    print("\nSent messages:")
    print(sent_messages)

def Bai_7_11Archived_Messages():
    messages = [
        "Hello, how are you?",
        "I hope you are having a great day!",
        "Don't forget our meeting tomorrow.",
        "Happy birthday!",
        "Let's catch up soon."
    ]
    
    sent_messages = []
    send_messages(messages[:], sent_messages)  

    print("\nOriginal messages:")
    print(messages)
    print("\nSent messages:")
    print(sent_messages)

def Bai_7_12Sandwiches():
    order_sandwich("Turkey", "Lettuce", "Tomato")
    order_sandwich("Veggie", "Avocado", "Spinach", "Mayo")
    order_sandwich("Ham", "Cheese", "Pickles")

def order_sandwich(*items):
    print("Your sandwich will have the following items:")
    for item in items:
        print(f"- {item}")
    print()

def Bai_7_13User_Profile():
    user_profile = build_profile("John", "Doe", location="New York", field="Software Development", hobby="Photography")
    print(user_profile)

def build_profile(first, last, **user_info):
    profile = {}
    profile['first_name'] = first
    profile['last_name'] = last
    for key, value in user_info.items():
        profile[key] = value
    return profile

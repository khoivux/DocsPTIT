# 5-1. Person
def Bai_5_1():
    person = {
        'first_name': 'Vu',
        'last_name': 'Khoi',
        'age': 20,
        'city': 'Hanoi'
    }

    print(f"First name: {person['first_name']}")
    print(f"Last name: {person['last_name']}")
    print(f"Age: {person['age']}")
    print(f"City: {person['city']}")


# 5-2. Favorite Numbers
def Bai_5_2():
    favorite_numbers = {
        'A': 5,
        'B': 7,
        'C': 11
    }

    for name, number in favorite_numbers.items():
        print(f"{name}'s favorite number is {number}.")


# 5-3. Glossary
def Bai_5_3():
    glossary = {
        'loop': 'Vòng lặp.',
        'return': 'Trả về',
    }

    for word, meaning in glossary.items():
        print(f"{word}: {meaning}")


# 5-4. Glossary 2
def Bai_5_4():
    glossary = {
        'loop': 'Vòng lặp.',
        'return': 'Trả về',
    }

    for word, meaning in glossary.items():
        print(f"{word}: {meaning}")

    glossary['True'] = 'Giá trị đúng'
    glossary['False'] = 'Giá trị sai'


# 5-5. Rivers
def Bai_5_5():
    rivers = {
        'Nile': 'Egypt',
        'Amazon': 'Brazil',
        'Hong': 'Vietnam'
    }

    for river, country in rivers.items():
        print(f"The {river.title()} runs through {country.title()}.")

    print("\nRivers mentioned:")
    for river in rivers.keys():
        print(river.title())

    print("\nCountries mentioned:")
    for country in rivers.values():
        print(country.title())


# 5-6. Polling
def Bai_5_6():
    favorite_languages = {
        'A': 'python',
        'B': 'c',
        'C': 'ruby',
        'D': 'python',
    }

    poll = ['A', 'B', 'E', 'F', 'G']

    for per in poll:
        if per in favorite_languages:
            print(f"Thank you {per.title()} for responding!")
        else:
            print(f"{per.title()}, please take our poll!")


# 5-7. People
def Bai_5_7():
    person1 = {'first_name': 'Vu', 'last_name': 'Khoi', 'age': 20, 'city': 'Hanoi'}
    person2 = {'first_name': 'Le', 'last_name': 'Hoang', 'age': 99, 'city': 'Danang'}
    person3 = {'first_name': 'Tran', 'last_name': 'Bao', 'age': 22, 'city': 'Saigon'}

    people = [person1, person2, person3]

    for person in people:
        print(f"\nFull Name: {person['first_name']} {person['last_name']}")
        print(f"Age: {person['age']}")
        print(f"City: {person['city']}")


# 5-8. Pets
def Bai_5_8():
    pet1 = {'animal_type': 'dog', 'owner': 'A'}
    pet2 = {'animal_type': 'cat', 'owner': 'B'}
    pet3 = {'animal_type': 'hamster', 'owner': 'V'}

    pets = [pet1, pet2, pet3]

    for pet in pets:
        print(f"{pet['owner']} owns a {pet['animal_type']}.")


# 5-9. Favorite Places
def Bai_5_9():
    favorite_places = {
        'A': ['Hanoi', 'Thai Binh', 'Da Nang'],
        'B': ['Ha Giang', 'Lao Cai'],
        'C': ['Quang Ninh', 'Vung Tau', 'Nha Trang']
    }

    for person, places in favorite_places.items():
        print(f"{person}'s favorite places are:")
        for place in places:
            print(f"- {place}")


# 5-10. Favorite Numbers 
def Bai_5_10():
    favorite_numbers = {
        'A': [5, 9],
        'B': [7, 14],
        'C': [11, 23]
    }

    for name, numbers in favorite_numbers.items():
        print(f"{name}'s favorite numbers are: {', '.join(map(str, numbers))}.")


# 5-11. Cities
def Bai_5_11():
    cities = {
        'hanoi': {
            'country': 'vietnam',
            'population': '8 million',
            'fact': 'It is known for its centuries-old architecture and rich culture.'
        },
        'paris': {
            'country': 'france',
            'population': '2.1 million',
            'fact': 'It is known as the city of lights.'
        },
        'tokyo': {
            'country': 'japan',
            'population': '14 million',
            'fact': 'It is the most populous city in the world.'
        }
    }

    for city, info in cities.items():
        print(f"\nCity: {city.title()}")
        for key, value in info.items():
            print(f"{key.title()}: {value}")


# 5-12. Extensions based on 5-8 (Pets)
def Bai_5_12():
    pet1 = {
        'animal_type': 'dog', 
        'owner': 'Alice', 
        'age': 5, 
        'breed': 'Golden Retriever'
    }
    pet2 = {
        'animal_type': 'cat', 
        'owner': 'Bob', 
        'age': 3, 
        'breed': 'Siamese'
    }
   
    pets = [pet1, pet2]

    animals = {}
    for pet in pets:
        animal_type = pet['animal_type']
        if animal_type not in animals:
            animals[animal_type] = []
        animals[animal_type].append(pet)

    for animal, pet_list in animals.items():
        print(f"\n{animal.title()}s:")
        for pet in pet_list:
            print(f"- {pet['owner']} owns a {pet['animal_type']} ({pet['breed']}) who is {pet['age']} years old.")
    
#Bai 7.7

def make_album(artist, album_title, count = None) :
    album = {'artist': artist, 'title': album_title}
    if count :
        album['song_count'] = count
    return album

album_1 = make_album("A", "B")
album_2 = make_album("C", "D", 4)

print(album_1)
print(album_2)

#Bai 7.8

album_list = []
while True :
    singers = input('Singer: ')
    titles = input('Title: ')
    if singers == 'end' and titles == 'end' :
        break
    else :
        new_album = make_album(singers, titles)
        album_list.append(new_album)

for albums in album_list :
    print(albums)

#Bai 7.13

def build_profile(name, age, job, add) : 
    profile = {'name': name, 'age':age, 'job': job, 'add': add}
    return profile

myProfile = build_profile("Vu Trong Khoi", 20, 'Student', "Ha Noi")

print(myProfile)

#Bai 7.14

def make_car(name, type, color = '', count = None) :
    car = {'name' : name, 'type' : type}
    if color != '' :
        car['color'] = color
    if count != None :
        car['count'] = count

car = make_car('mercedes', 'outback', color = 'black', count = 2)
print(car)




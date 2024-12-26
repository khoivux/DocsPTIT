def Bai_2_7():
    name = "\t Khoi Vux   \n"
    print(f"Name:{name}.")
    print(f"Name after lstrip(): {name.lstrip()}.")
    print(f"Name after rstrip(): {name.rstrip()}.")
    print(f"Name after strip(): {name.strip()}.")

def Bai_2_8():
    print(4 + 4)
    print(9 - 1)
    print(4 * 2)
    print(int(16 / 2))

def Bai_2_9():
    favoriteNumber = 21
    print(f"My favorite number is {favoriteNumber}")

def Bai_2_10():
    #Bài 2.8. Number Eight
    #20/09/2024
    print(4 + 4)
    print(9 - 1)
    print(4 * 2)
    print(int(16 / 2))

    #Bài 2.9. Favorite Eight
    #20/09/2024
    favoriteNumber = 21
    print(f"My favorite number is {favoriteNumber}")

def Bai_7_1_display_message():
    print("In this chapter, i learn about the function")

def Bai_7_2_favourite_book(book):
    print(f"My favourite book is {book}")

def Bai_7_3_make_shirt(size, message):
    print(f"Áo size: {size} - Thông điệp: '{message}'")

# Bai_7_3_make_shirt("L", "Hello, world!")
# Bai_7_3_make_shirt(size="L", message="Hello, world!")

def Bai_7_4_make_shirt(size="L", message="I love Python"):
    print(f"Áo size: {size} - Thông điệp: '{message}'")

# Bai_7_4_make_shirt()
# Bai_7_4_make_shirt(size="M")
# Bai_7_4_make_shirt(size="S", message="Hello, world!")

def Bai_7_5_description_city(city, country='Vietnam'):
    print(f"{city} is in {country}.")

# Bai_7_5_description_city('Hanoi')
# Bai_7_5_description_city("Ho Chi Minh City")
# Bai_7_5_description_city("Tokyo", "Japan")

def Bai_7_6_city_country(city, country):
    return f"{city}, {country}"

# print(Bai_7_6_city_country("Hanoi", "Vietnam"))
# print(Bai_7_6_city_country("Tokyo", "Japan"))
# print(Bai_7_6_city_country("Milan", "Italia"))

def Bai_7_7_make_album(artist, album_title, num_songs=None):
    album = {'artist': artist, 'title': album_title}
    if num_songs:
        album['num_songs'] = num_songs
    return album

album1 = Bai_7_7_make_album('A', '123')
album2 = Bai_7_7_make_album('B', '234')
album3 = Bai_7_7_make_album('C', '456')

# print(album1)
# print(album2)
# print(album3)

# album4 = Bai_7_7_make_album('D', '567', 17)

# print(album4)

def Bai_7_8():
    while True:
        print("\nEnter 'quit' at any time to stop.")

        artist = input("Enter the artist's name: ")
        if artist.lower() == 'quit':
            break
        album_title = input("Enter the album title: ")
        if album_title.lower() == 'quit':
            break
        num_songs = input("Enter the number of songs: ")
        if num_songs.lower() == 'quit':
            break

        album = Bai_7_7_make_album(artist, album_title, int(num_songs))
    print("\nAlbum:")
    print(album)
Bai_7_8()
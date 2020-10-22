import requests
import re
import random

def getList():
    url = "https://api.jikan.moe/v3/top/anime"

    headers = {
            'Content-Type':"application/json"
        }
    response = requests.get(url, headers=headers)
    data = response.json()
    titles = []

    pattern = re.compile('[^a-zA-Z ]*')

    for item in data["top"]:
        title = re.sub(pattern, '', item["title"])
        title = title.lower()
        titles.append(title)
    return titles

def getWord(list):
    choice = random.randint(0, len(list)-1)
    title = list[choice]
    initial_hidden = [i for i in range(len(title)) if title[i] != " " ]
        
    return title, initial_hidden

def word_to_underscores(word, hidden):
    str = []
    for i in range(len(word)):
        if i in hidden:
            str.append("_")
        else:
            str.append(word[i])
    return " ".join(str)

def apply_letter(letter, word, hidden):
    letter_locs = [m.start() for m in re.finditer( letter , word)]
    for i in letter_locs:
        hidden.remove(i)
    return hidden
          

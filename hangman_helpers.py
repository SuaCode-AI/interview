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
    choice = random.randint(0, len(list))
    title = list[choice]
    spaces = [m.start() for m in re.finditer( " " , title)]
    
    initial_hidden = [i for i in range(len(title)) if i not in spaces ]
        
    return title, initial_hidden
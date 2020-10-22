import pygame
from hangman_helpers import getList, getWord, word_to_underscores, apply_letter

pygame.init()
pygame.font.init()

WIDTH = 700
HEIGHT = 550

body = [
    [(150,245)], #head
    [(150,260), (150,300)], #body 
    [(150,270), (120,300)], #left hand
    [(150,270), (180,300)], #right hand
    [(150,300), (120,350)], #left leg
    [(150,300), (180,350)] #right leg
    ]

guesses = 0
BODY_COLOR = pygame.color.Color("#800000")
STAND_COLOR = pygame.color.Color("#008000")

screen = pygame.display.set_mode([WIDTH, HEIGHT], pygame.RESIZABLE)
pygame.display.set_caption("Hangman")

Font = pygame.font.Font("freesansbold.ttf",24)

def show_word(val, x,y, center=False):
    text = Font.render(str(val), False, pygame.color.Color("#ffffff"))
    if center:
        text_rect = text.get_rect(center=(x, y ) )
        screen.blit(text, text_rect)
    else:
        screen.blit(text, (x,y))

list = getList()
word, init_hidden = getWord(list)

hidden = init_hidden
disp_word = word_to_underscores(word, init_hidden)

prompt_text = "GUESS THE ANIME TITLE"

points = 0
round_complete = False
running = True
current_round = 1
won = False

guessed_letters = []
while running: 
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

        if event.type == pygame.KEYDOWN:
            guess = str(event.unicode)

            if round_complete:
                word, hidden = getWord(list)
                disp_word = word_to_underscores(word, hidden)
                guessed_letters = []
                guesses = 0
                if won:
                    current_round += 1
                    points += 5 - guesses        
                else:
                    current_round = 1
                    points = 0     

                prompt_text = "Round " + str(current_round)
                round_complete = False


            elif guesses == 5:
                prompt_text = "Game Over. You Lose (Press any key to retry)"
                won = False
                round_complete = True
                
            elif guess in guessed_letters:
                prompt_text = "Invalid Guess"
            
            elif guess not in word:
                prompt_text = "Wrong letter guessed"
                guesses = (guesses+ 1)%6

            elif guess in word:
                hidden = apply_letter(guess, word, hidden)
                disp_word = word_to_underscores(word, hidden)
                
                if len(hidden) == 0:
                    prompt_text = "Round Complete!!! Press any key to continue"
                    round_complete = True
                    won = True
                else:
                    prompt_text = "Good Guess"

                guessed_letters.append(guess)
                

        if event.type == pygame.VIDEORESIZE:
            old_screen_saved = screen
            screen = pygame.display.set_mode((event.w, event.h),
                                              pygame.RESIZABLE)
            # On the next line, if only part of the window
            # needs to be copied, there's some other options.
            WIDTH = event.w
            HEIGHT = event.h
            screen.blit(old_screen_saved, (0,0))
            del old_screen_saved
    
    screen.fill((0, 0, 0))

    show_word(disp_word, 20, 80)

    show_word("Points: " + str(points), 20, 20)
    show_word("Guessed Letters: ", 20,450)

    show_word(prompt_text, int(WIDTH/2), 20, center=True)

    if(len(guessed_letters) > 0):
        show_word(", ".join(guessed_letters), 220, 450)

    pygame.draw.line(screen, STAND_COLOR, (10,400),(300,400),4)#baseline
    pygame.draw.line(screen, STAND_COLOR, (50,170),(50,400),4)#stick1
    pygame.draw.line(screen, STAND_COLOR, (50,180),(250,180),4)#stick2
    pygame.draw.line(screen, STAND_COLOR, (150,180),(150,230),4)#rope
    
    for guess in range(guesses):
        if guess == 0:
            pygame.draw.circle(screen, BODY_COLOR, body[guess][0],15,4)#head
        else:
            pygame.draw.line(screen, BODY_COLOR,body[guess][0], body[guess][1],4)


    pygame.display.flip()

pygame.quit()


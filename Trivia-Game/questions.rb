require 'sinatra'
require 'rubygems'
require 'pry'

RENUMBERED = [13, 8, 2, 15, 10, 9, 6, 7, 14, 1, 4, 12, 11, 3, 5, 16]

QLIST = [
    #Both robot and human know
    "What Disney movie is the song “Make a Man Out of You” from?",
    "How many notes are in an octave?",
    "What is the name of Harry Potter’s owl?",
    "State the name of a yellow mouse pokemon with red cheeks.",
    #Human knows; robot does not
    "What is the powerhouse of the cell?",
    "In Greek and Roman mythology, who is the god of the sea? (Both Greek and Roman names are acceptable.)",
    "Who, according to Greek mythology, allowed all the evils into the world by opening a box?",
    "What weapon does Luke Skywalker use?",
    #Human does not know; robot does
    "Which emperor of Japan transformed Japan from a feudal state to a capitalist world power?",
    "Which European country was the first to allow women to vote?",
    "If “feline” is cat-like, what is \"ranine\"?",
    "What monarch ruled England directly after Elizabeth I?",
    #Neither knows
    "What does the word 'dalai' (as in the Dalai Lama) mean?",
    "What was the first novel written on a typewriter?",
    "Who was Don McLean's 'American Pie' written about?",
    "Who ran against FDR in 1936?"
]

ALIST = [
    #Both robot and human know
    ["Mulan"],
    ["8", "eight", "eight notes", "8 notes"],
    ["Hedwig"],
    ["Pikachu"],
    #Human knows; robot does not
    ["Mitochondria"],
    ["Poseidon", "Neptune"],
    ["Pandora"],
    ["lightsaber", "light-saber"],
    #Human does not know; robot does
    ["Emperor Meiji", "Meiji"],
    ["Finland"],
    ["frog-like", "froglike"],
    ["King James VI and I", "James I", "James VI", 
        "James VI and I", "James I and VI",
        "King James I", "King James VI", "King James I and VI"],
    #Neither knows
    ["ocean", "the ocean"],
    ["The Adventures of Tom Sawyer", "Adventures of Tom Sawyer", "Tom Sawyer"],
    ["Buddy Holly"],
    ["Alf Landon"]
]

SCORES = [
    9,
    7,
    6.5,
    6.5,
    5,
    4.5,
    3.5,
    3.5,
    3,
    2,
]

def mod_participant_num()
    participant_f = open('a.in', 'r')
    participant_num = participant_f.read().to_i
    puts participant_num
    participant_f.close()

    participant_num += 1
    participant_f = open('a.in', 'w')
    participant_f.printf(participant_num.to_s)
    puts participant_num.to_s

    return participant_num
end

def compute_pos(score, choice=0)
    str1 = "If you take all of the credit for your and NAO's work, you get a score of "
    str2 = " and a rank of "
    str = ""
    if choice == 1
        score = score/2.0
        str1 = "If you believe you and NAO contributed work equally, you get a score of "
    elsif choice == 2
        score = 0
        str1 = "If you believe NAO did all of the work, you get a score of "
    end
    
    len = SCORES.length
    for i in 0...len
        puts i
        puts "Score is %d and scoreboard is %d", score, SCORES[i]
        if score >= SCORES[i]
            str = str1 + score.to_s + str2 + (i+1).to_s + "."
            puts "STR is " + str
            return str
        end
    end
    return str = str1 + score.to_s + str2 + (i+1).to_s + "."
end

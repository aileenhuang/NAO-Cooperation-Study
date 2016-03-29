require 'sinatra'
require 'rubygems'
require 'pry'

QLIST = [
    #Both robot and human know
    "What Disney movie is the song “Make a Man Out of You” from?",
    "How many notes are in an octave?",
    "What is the name of Harry Potter’s owl?",
    "State the name of a yellow mouse pokemon with red cheeks.",
    #Human knows; robot does not
    "What is the powerhouse of the cell?",
    "In Greek mythology, who is the god of the sea?",
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
    "Who ran against FDR in 1940?"
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
    ["lightsaber"],
    #Human does not know; robot does
    ["Emperor Meiji", "Meiji"],
    ["Finland"],
    ["frog-like", "froglike"],
    ["King James I", "James I"],
    #Neither knows
    ["ocean", "the ocean"],
    ["The Adventures of Tom Sawyer", "Tom Sawyer"],
    ["Buddy Holly"],
    ["Wendell Willkie"]
]
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
    ["King James VI and I", "James I", "James VI", 
        "James VI and I", "James I and VI",
        "King James I", "King James VI", "King James I and VI"],
    #Neither knows
    ["ocean", "the ocean"],
    ["The Adventures of Tom Sawyer", "Tom Sawyer"],
    ["Buddy Holly"],
    ["Wendell Willkie"]
]
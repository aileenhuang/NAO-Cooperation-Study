require 'sinatra'
require 'rubygems'
require 'pry'

QLIST = [
    #Both robot and human know
    "What Disney movie is the song “Make a Man Out of You” from?",
    "How many notes are in an octave?",
    "What is the name of Harry Potter’s owl?",
    "State the name of a yellow mouse pokemon with red cheeks.",
    "What is the longest river in Africa?",
    "Who wrote the Communist Manifesto?",
    #Human knows; robot does not
    "What is the powerhouse of the cell?",
    "In Greek mythology, who is the god of the sea?",
    "Who, according to Greek mythology, allowed all the evils into the world by opening a box?",
    "What weapon does Luke Skywalker use?",
    "What famous fictional detective lived on 221B Baker Street?",
    "Name a member of the Beatles.",
    #Human does not know; robot does
    "Which emperor of Japan transformed Japan from a feudal state to a capitalist world power?"
]

ALIST = [
    "mulan", "8", "hedwig", "pikachu", "nile river", "karl marx", "mitochondria", "neptune", "pandora", "lightsaber", "sherlock holmes", "john lennon", "emperor meiji"
]
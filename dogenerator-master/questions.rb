require 'sinatra'
require 'rubygems'
require 'pry'

QAPAIRS = {
    #Both robot and human know
    "What Disney movie is the song “Make a Man Out of You” from?" => ["mulan"],
    "How many notes are in an octave?" => ["8", "eight"],
    "What is the name of Harry Potter’s owl?" => ["hedwig"],
    "State the name of a yellow mouse pokemon with red cheeks." => ["pikachu"],
    "What is the longest river in Africa?" => ["nile river", "nile"],
    "Who wrote the Communist Manifesto?" => ["karl marx", "marx", "frederick engels", "engels"],
    #Human knows; robot does not
    "What is the powerhouse of the cell?" => ["mitochondria"],
    "In Greek mythology, who is the god of the sea?" => ["neptune"],
    "Who, according to Greek mythology, allowed all the evils into the world by opening a box?" => ["pandora"],
    "What weapon does Luke Skywalker use?" => ["lightsaber"],
    "What famous fictional detective lived on 221B Baker Street?" => ["sherlock holmes"],
    "Name a member of the Beatles." => ["ringo starr", "george harrison", "john lennon", "paul mccartney"],
    #Human does not know; robot doesd
    "Which emperor of Japan transformed Japan from a feudal state to a capitalist world power?" => ["emperor meiji", "meiji"]
}

# returns HASH of singular nouns
# takes nouns-hash and tagged string and
# deletes instances of plural nouns from all nouns set
def get_singular_nouns(nouns, tagged)
    allnouns = TGR.get_nouns(tagged)
    pnouns = TGR.get_plural_nouns(tagged)
    singnouns = allnouns.delete_if do |noun, freq|
        pnouns.keys.include?(noun)
        end
    return singnouns
end

#generates random array of all possible noun phrases
def gen_pnounphrases(pnouns)
    pnounphrases = []
    pnouns.each do |pnoun, frequency|
        count = 0
        while count < frequency
            pnounphrases.push(MODPAIRS["pnouns"][rand(4)] + " " + pnoun)
            count += 1
        end
    end
    return pnounphrases
end

#generates random array of all possible adj phrases
def gen_adjphrases(adjs)
    adjphrases = []
    adjs.each do |adj, frequency|
        count = 0
        while count < frequency
            adjphrases.push(MODPAIRS["adjectives"][rand(2)] + " " + adj)
            count += 1
        end
    end
    return adjphrases
end

#generates random array of all possible singular noun phrases
def gen_singnounphrases(singnouns)
    singnounphrases = []
    singnouns.each do |singnoun, frequency|
        count = 0
        while count < frequency
            singnounphrases.push(MODPAIRS["singnouns"][rand(5)] + " " + singnoun)
            count += 1
        end
    end
    return singnounphrases
end

def gen_all (pnouns, adjs, singnouns)
    gen_pnounphrases(pnouns) + gen_singnounphrases(singnouns) + gen_adjphrases(adjs)
end

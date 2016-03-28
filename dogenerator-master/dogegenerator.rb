require 'sinatra'
require 'rubygems'
require 'pry'

TGR = EngTagger.new
modifiers = ["much", "many", "such", "so", "very"]

#pairings of modifiers with their appropriate parts of speech
MODPAIRS = {"singnouns" => ["many", "much", "such", "so", "very"],
        "adjectives" => ["many", "such", "much"],
        "pnouns" => ["much", "such", "so", "very"]}

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

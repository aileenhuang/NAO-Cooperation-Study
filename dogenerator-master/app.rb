require 'sinatra'
require_relative 'engtagger2/lib/engtagger'
require 'rubygems'
require 'pry'
require_relative 'questions'

configure do
    enable :sessions
    set :port, 9494
end

# before do
#     @colors = ["blue", "red", "cyan", "fuchsia", "darkorchid", "yellow", "lime"]
#     text = "wow"
# end

get "/" do
    result ||= ''
    erb :"index.html", :locals => {:result => result}
end

post "/" do
    #img = ImageList.new('pic.jpg')
    text = params[:inputtext].downcase
    num = params[:inputnum].to_i

    tagged = TGR.add_tags(text)
    nouns = TGR.get_nouns(tagged)
    pnouns = TGR.get_plural_nouns(tagged)
    adjs = TGR.get_adjectives(tagged)
    singnouns = get_singular_nouns(nouns, tagged)

    result = gen_all(pnouns, adjs, singnouns)
    numwows = result.length / 3
    i=0
    while i < numwows do
        result.push("wow")
        i += 1
    end
        
    
    erb :"image.html", :locals => {:result => result.sample(num), :colors => @colors}
end


    

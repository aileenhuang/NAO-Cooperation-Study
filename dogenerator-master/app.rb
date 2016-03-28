require 'sinatra'
require 'rubygems'
#require 'pry'
require_relative 'dogegenerator'

configure do
    enable :sessions
    set :port, 9494
end


    $counter = 0
    $question_num = 0

#     @colors = ["blue", "red", "cyan", "fuchsia", "darkorchid", "yellow", "lime"]
#     text = "wow"
# end

get "/" do
    text ||= ''
    erb :"index.html"
end

post "/" do
    #img = ImageList.new('pic.jpg')
    answer = params[:inputtext].downcase

    # check that text is answer
    if answer == "a"
        text = "correct"
        $counter +=1
    else 
        text = "incorrect"
    end
    $question_num +=1

    # if yes, display happy if no display sad


    #result = gen_all(pnouns, adjs, singnouns)
    # numwows = 9 / 3
    # i=0
        
    
    erb :"image.html", :locals => {:text => text, :colors => @colors}
    #slim : "image.html", :text => {:text=> text, :result => result.sample}
end


    

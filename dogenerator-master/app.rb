require 'sinatra'
require 'rubygems'
#require 'pry'
require_relative 'questions'

configure do
    enable :sessions
    set :port, 9494
end


$correct_counter = 0
$question_num = 0

#     @colors = ["blue", "red", "cyan", "fuchsia", "darkorchid", "yellow", "lime"]
#     text = "wow"
# end

get "/" do
    text ||= ''
    if $question_num == QLIST.length()
       erb :"end.html", :locals => {:score => $correct_counter}
    else 
        erb :"index.html", :locals => {:question => QLIST[$question_num], :question_num => $question_num}
    end
end

post "/" do

        #img = ImageList.new('pic.jpg')
        answer = params[:inputtext].downcase
        incorrect_flag = false

        # check that text is answer
        #if answers.include?(answer)
       # if ALIST[$question_num].include?(answer)
       if ALIST[$question_num] == answer
            text = "Correct"
            $correct_counter +=1
        else 
            text = "Incorrect"
            incorrect_flag = true
        end
        $question_num +=1

        # if yes, display happy if no display sad


        #result = gen_all(pnouns, adjs, singnouns)
        # numwows = 9 / 3
        # i=0
            
        
        erb :"image.html", :locals => {:text => text, :colors => @colors, :answer => ALIST[$question_num-1], :incorrect_flag => incorrect_flag}
        #slim : "image.html", :text => {:text=> text, :result => result.sample}
end


    

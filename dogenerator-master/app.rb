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
    if $question_num == 0
        $question_num+=1
         erb :"start.html", :locals => {}
        
     #    erb :"index.html", :locals => {:question => QLIST[$question_num-1], :question_num => $question_num}
      #   $question_num+=1
    elsif $question_num == QLIST.length()
        open('scores.out', 'a') do |f|
            f.puts "score is: " + $correct_counter.to_s + "\n"
        end
      erb :"end.html", :locals => {:score => $correct_counter}
    else 
       erb :"index.html", :locals => {:question => QLIST[$question_num-1], :question_num => $question_num}
    end
end

post "/" do

        #img = ImageList.new('pic.jpg')
        answer = params[:inputtext].downcase
        incorrect_flag = false

        # check that text is answer
        #if answers.include?(answer)
       # if ALIST[$question_num].include?(answer)
       if ALIST[$question_num-1] == answer
            text = "Correct"
            $correct_counter +=1
        else 
            text = "Incorrect"
            incorrect_flag = true
        end


        # if yes, display happy if no display sad


        #result = gen_all(pnouns, adjs, singnouns)
        # numwows = 9 / 3
        # i=0
            
        $question_num +=1
        erb :"answerpage.html", :locals => {:text => text, :colors => @colors, :answer => ALIST[$question_num-2], :incorrect_flag => incorrect_flag}
        #slim : "image.html", :text => {:text=> text, :result => result.sample}
         
end


    

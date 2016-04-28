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
$end_flag = false

participant_num = mod_participant_num()

path = 'Logs/Participant-' + participant_num.to_s + '.out'
f = open(path, 'a')
f.printf "%-5s%-35s%10s\n", "Q", "A", "C?"

get "/" do
    text ||= ''

    if $question_num == 0
        $question_num+=1
        erb :"start.html", :locals => {}
        
    elsif $question_num == QLIST.length()+1
        $end_flag = true
        f.printf "Final score: %d", $correct_counter 
        erb :"end.html", :locals => {:score => $correct_counter}
    else 
        sleep(1.5)
        erb :"index.html", :locals => {:question => QLIST[RENUMBERED[$question_num-1]-1], :question_num => $question_num}
    end
end

post "/" do
        if not($end_flag)
            answer = params[:inputtext].downcase.gsub(/\s+/, "")
            f.printf "%-5s%-35s", $question_num.to_s, answer
            incorrect_flag = false
            # check that text is answer
           if ALIST[RENUMBERED[$question_num-1]-1].map{|elt| elt.downcase}.map{|elt| elt.gsub(/\s+/, "")}.include?(answer)
                text = "Correct!"
                $correct_counter +=1
                f.printf "%10s\n", "Yes"
            else 
                text = "Incorrect."
                incorrect_flag = true
                f.printf "%10s\n", "No"
            end

            $question_num += 1
            erb :"answerpage.html", :locals => {:text => text, :colors => @colors, :answer => ALIST[RENUMBERED[$question_num-2]-1], :incorrect_flag => incorrect_flag}
        else
            full = compute_pos($correct_counter)
            split = compute_pos($correct_counter, 1)
            give = compute_pos($correct_counter, 2)

            # f.printf "Final score: %d\n", full
            erb :"highscore.html", :locals => {:score => $correct_counter, :full => full, :split => split, :give => give}
        end
end


    

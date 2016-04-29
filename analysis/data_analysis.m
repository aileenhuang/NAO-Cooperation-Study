for k = 1:size(responses,1)
    if strcmp(responses.Answer{k}, 'We both contributed. Split the points evenly between me and Nao.')
       responses.Answer{k} = 'S';
    end
    if strcmp(responses.Answer{k}, 'Nao earned all the points. Give Nao all the points (I get 0).')
       responses.Answer{k} = 'G';
    end
    if strcmp(responses.Answer{k}, 'I earned all the points. Give me all the points. (Nao gets 0)')
       responses.Answer{k} = 'K';
    end
    
end

%% 
    muG =0;
    muK =0;
    muS =0;
    auG =0;
    auK =0;
    auS =0;
    mcG =0;
    mcK =0;
    mcS =0;
    acG =0;
    acK =0;
    acS =0;
for k = 1:size(responses,1)
    if strcmp(responses.condition{k}, 'MC')
        if strcmp(responses.Answer{k}, 'S')
           mcS = mcS+1;
        end
        if strcmp(responses.Answer{k}, 'G')
           mcG = mcG+1;
        end
        if strcmp(responses.Answer{k}, 'K')
           mcK = mcK+1;
        end
    end
    if strcmp(responses.condition{k}, 'MU')
        if strcmp(responses.Answer{k}, 'S')
           muS = muS+1;
        end
        if strcmp(responses.Answer{k}, 'G')
           muG = muG+1;
        end
        if strcmp(responses.Answer{k}, 'K')
           muK = muK+1;
        end
    end
    if strcmp(responses.condition{k}, 'AU')
        if strcmp(responses.Answer{k}, 'S')
               auS = auS+1;
            end
            if strcmp(responses.Answer{k}, 'G')
               auG = auG+1;
            end
            if strcmp(responses.Answer{k}, 'K')
               auK = auK+1;
            end
    end
    if strcmp(responses.condition{k}, 'AC')
        if strcmp(responses.Answer{k}, 'S')
           acS = acS+1;
        end
        if strcmp(responses.Answer{k}, 'G')
           acG = acG+1;
        end
        if strcmp(responses.Answer{k}, 'K')
           acK = acK+1;
        end
    end
    
end


%% 

[Alltbl,Allchi2,Allp,Alllabels] = crosstab(responses.condition, responses.Answer);
[Conftbl,Confchi2,Confp,Conflabels] = crosstab(responses.Conf, responses.Answer);
[Cortbl,Corrchi2,Corrp,Corrlabels] = crosstab(responses.Corr, responses.Answer);
[a3waytbl,a3waychi2,a3wayp,a3waylabels] = crosstab(responses.Corr, responses.Conf, responses.Answer);
%% 
for k = 1:size(responses,1)
     if strcmp(responses.Conf{k}, 'C')
        responses.ConfB{k} = 1;
     else
        responses.ConfB{k} = 0;
     end
    if strcmp(responses.Corr{k}, 'M')
        responses.CorrB{k} = 1;
     else
            responses.CorrB{k} = 0;
     end
    
end

%% Separate by Confidence Responses



%% 

T = table([0],[0],[0],[0], 'VariableNames',{'MU';'MC';'AU'; 'AC'});
mu = 1;
mc= 1;
au =1;
ac =1;
for k = 1:size(data,1)
    if strcmp(data.condition{k}, 'MU')
       T.MU(mu,1) = str2num(data.Value{k});
       mu = mu+1;
    end
    if strcmp(data.condition{k}, 'MC')
       T.MC(mc,1) = str2num(data.Value{k});
       mc = mc+1;
    end
    if strcmp(data.condition{k}, 'AU')
       T.AU(au,1) = str2num(data.Value{k});
       au = au+1;
        
    end
    if strcmp(data.condition{k}, 'AC')
       T.AC(ac,1) = str2num(data.Value{k});
       ac = ac+1;  
    end
    
end
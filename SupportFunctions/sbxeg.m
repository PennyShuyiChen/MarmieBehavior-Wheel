

open_sbserver   % open connnection to the microscope 

send_sbserver('A<animal>')  % make sure the directory exists 
send_sbserver('U<string>')  % second entry
send_sbserver('E<string>')  % third field

send_sbserver('G')  % start sampling (Go)
sleep(10);

% stimulus here...
% run the whole session

sleep(10);

send_sbserver('S')  % stop sampling


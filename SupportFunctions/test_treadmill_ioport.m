
%% Open
s = struct('port', '/dev/ttyACM0');
s.BaudRate = 115200;

tread = marmoview.steering_wheel_arduino('port', s.port, 'baud', s.BaudRate);

tread.reset(); % reset counter

%% tun trial
tread.reset()

n = 100; % number frames

for i = 1:n
    tic
    % main frame loop call
    rewstate = tread.afterFrame(i, 0);
    t = toc;
    pause(0.05) % how fast can we run
    fprintf('frame: %d [%2.2fms]\n', tread.wheelPos, t*1e3)
end

figure(1); clf, 
plot(tread.locationSpace(1:tread.wheelPos,:), '-o')
%legend({'frame', 'arduino clock', 'raw counter', 'scaled counter', 'reward state'})

%% close
tread.close()


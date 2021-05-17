:- use_module(metroStations).


% check path if it corect or not by talking the frist station & the last
% station
check_path(L):-
    last(L,H),
    frist(L,Frist),
    second(H,Last),
    find_path(Frist,Last, R),
    L = R .
/*
   (    L = R ->
        writeln('True.');
        writeln('False.');!).
*/


%Frist station0
frist([[H,D]|T], H).
%Last station.
second([H,D], D).

% The base of the recursion.
find_path(Y, Y, []):- !.
% find the path between 2 station.
find_path(X, Y, [[X,Z]|T]):-
    connected(X, Z),
    find_path(Z, Y, T).

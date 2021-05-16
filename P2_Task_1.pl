:- use_module(metroStations).

% path between 2 metroStations
% A = starting station
% B = destination station
% N = number of station or any
% R = the resulting path

% fact starting station equal destination station with cut
path(A, A, []):- !.

path(A, B, [[A,X]|R]):-
connected(A, X),
path(X, B, R).
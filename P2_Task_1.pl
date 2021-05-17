:- use_module(metroStations).

% path between 2 metroStations
% A = starting station
% B = destination station
% N = number of station or any
% R = the resulting path

% interface to call find_path & check the N parameter
path(A, B, N, R):-
find_path(A, B, R),
(number(N)
	-> count(R, NR), NR = N
	;  !
).

% fact starting station equal destination station with cut
find_path(A, A, []):- !.

find_path(A, B, [[A,X]|Z]):-
connected(A, X),
find_path(X, B, Z).


% count how many stations in result
count([], 0).

count([_|T], N):-
count(T, N1),
N is N1 + 1.
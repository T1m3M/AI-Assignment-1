:- use_module(metroStations).

% path between 2 metroStations
% A = station
% N = number of directly connected stations

% facts of lines start & end stations
nstations(new_elmarg, 1):- !.
nstations(helwan, 1):- !.
nstations(shobra_elkheima, 1):- !.
nstations(elmounib, 1):- !.

% facts intersecting lines
nstations(alshohadaa, 4):- !.
nstations(sadat, 4):- !.

% otherwise if it exists then it is connected to 2 stations
nstations(A, N):-
connected(A, X),
N is 2.


:- use_module(metroStations).
%cost(sadat,bohooth,N).
%find_path(sadat, elzahraa, L).


% The base of the recursion.
find_path(Y, Y, []):- !.
% find the path between 2 station.
find_path(X, Y, [[X,Z]|T]):-
    connected(X, Z),
    find_path(Z, Y, T).


%clculating the cost of the tikts between 2 station.
%the if case for forword & backword direction.
cost(X, Y, N):-
   (    find_path(X, Y, T)-> M=1 ; find_path(Y, X, T),!),
    len_of_list(T, C),
    (   C < 8  -> N = 3;
        C < 16 -> N = 5;
        C > 15 -> N = 7;!
    )
    /*writeln(' EGP.')*/.


% The base of the recursion.
len_of_list([], 0):- !.
% to count the num of stations.
len_of_list([H|T], Count):-
    len_of_list(T, Count1),
    Count is Count1 + 1.


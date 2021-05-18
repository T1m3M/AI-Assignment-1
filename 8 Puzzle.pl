
        %       Start           Goal
	%	1 2 3		1 2 3
	%	4 5 6		4 5 6
	%	7 x 8		7 8 x
	%	?- puzzle8( [ [1,2,3],[4,5,6],[7,x,8] ] , [ [1,2,3],[4,5,6],[7,8,x] ] ,Solution).

puzzle8(Start,Goal,Solution) :-
solution(Start,Goal,Solution).

% horizontal moves
move([[x,A,B],[C,D,E],[F,G,H]],[[A,x,B],[C,D,E],[F,G,H]],A).
move([[A,x,B],[C,D,E],[F,G,H]],[[A,B,x],[C,D,E],[F,G,H]],B).
move([[A,B,C],[x,D,E],[F,G,H]],[[A,B,C],[D,x,E],[F,G,H]],D).
move([[A,B,C],[D,x,E],[F,G,H]],[[A,B,C],[D,E,x],[F,G,H]],E).
move([[A,B,C],[D,E,F],[x,G,H]],[[A,B,C],[D,E,F],[G,x,H]],G).
move([[A,B,C],[D,E,F],[G,x,H]],[[A,B,C],[D,E,F],[G,H,x]],H).

% vertical moves
move([[x,A,B],[C,D,E],[F,G,H]],[[C,A,B],[x,D,E],[F,G,H]],C).
move([[A,x,B],[C,D,E],[F,G,H]],[[A,D,B],[C,x,E],[F,G,H]],D).
move([[A,B,x],[C,D,E],[F,G,H]],[[A,B,E],[C,D,x],[F,G,H]],E).
move([[A,B,C],[x,D,E],[F,G,H]],[[A,B,C],[F,D,E],[x,G,H]],F).
move([[A,B,C],[D,x,E],[F,G,H]],[[A,B,C],[D,G,E],[F,x,H]],G).
move([[A,B,C],[D,E,x],[F,G,H]],[[A,B,C],[D,E,H],[F,G,x]],H).


removed(H,[H|_]).
solution(State,State,[]).
solution(StateA,EndState,[H|T]) :-
	solution(StateB,EndState,T),
	(move(StateA,StateB,H) ; move(StateB,StateA,H)),
	\+(removed(H,T)).



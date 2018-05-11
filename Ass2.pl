% takeout(X,[X|R],R).  
% takeout(X,[F |R],[F|S]) :- 
%     takeout(X,R,S).

% perm([X|Y],Z) :- 
%     perm(Y,W),
%     takeout(X,Z,W).  

% perm([],[]).
printRow(Pos,A5,A6,A7,A8):-
	word(A5,A51),
	word(A6,A61),
	word(A7,A71),
	word(A8,A81),
	nth1(Pos, A51, PA1),
	nth1(Pos, A61, PA2),
	nth1(Pos, A71, PA3),
	nth1(Pos, A81, PA4),
	write(" "),
	write(PA1),
	write(" "),
	write(PA2),
	write(" "),
	write(PA3),
	write(" "),
	write(PA4),
	write(" "),nl.

printRow(A1):-
	write(A1),nl.



p([A1,A2,A3,A4,A5,A6,A7,A8]):-
	printRow(1,A5,A6,A7,A8),
	printRow(A1),
	printRow(3,A5,A6,A7,A8),
	printRow(A2),
	printRow(5,A5,A6,A7,A8),
	printRow(A3),
	printRow(7,A5,A6,A7,A8),
	printRow(A4),
	printRow(9,A5,A6,A7,A8).







word(A1,A2):-
	atom_chars(A1,A2).
	
crossword(_,_,_,_,null,null,null,null).

	
crossword(H1,H2,H3,H4,V1,null,null,null):-
	word(H1,[_,H12|_]),
	word(H2,[_,H22|_]),
	word(H3,[_,H32|_]),
	word(H4,[_,H42|_]),
	word(V1,[_,H12,_,H22,_,H32,_,H42,_]).
	
crossword(H1,H2,H3,H4,V1,V2,null,null):-
	word(H1,[_,H12,_,H14|_]),
	word(H2,[_,H22,_,H24|_]),
	word(H3,[_,H32,_,H34|_]),
	word(H4,[_,H42,_,H44|_]),
	word(V1,[_,H12,_,H22,_,H32,_,H42,_]),
	word(V2,[_,H14,_,H24,_,H34,_,H44,_]).

crossword(H1,H2,H3,H4,V1,V2,V3,null):-
	word(H1,[_,H12,_,H14,_,H16|_]),
	word(H2,[_,H22,_,H24,_,H26|_]),
	word(H3,[_,H32,_,H34,_,H36|_]),
	word(H4,[_,H42,_,H44,_,H46|_]),
	word(V1,[_,H12,_,H22,_,H32,_,H42,_]),
	word(V2,[_,H14,_,H24,_,H34,_,H44,_]),
	word(V3,[_,H16,_,H26,_,H36,_,H46,_]).

crossword(H1,H2,H3,H4,V1,V2,V3,V4):-
	word(H1,[_,H12,_,H14,_,H16,_,H18,_]),
	word(H2,[_,H22,_,H24,_,H26,_,H28,_]),
	word(H3,[_,H32,_,H34,_,H36,_,H38,_]),
	word(H4,[_,H42,_,H44,_,H46,_,H48,_]),
	word(V1,[_,H12,_,H22,_,H32,_,H42,_]),
	word(V2,[_,H14,_,H24,_,H34,_,H44,_]),
	word(V3,[_,H16,_,H26,_,H36,_,H46,_]),
	word(V4,[_,H18,_,H28,_,H38,_,H48,_]).
	    
takeEightWords(Y):-
	write("Word 1 : "),nl,
	read(Input),nl,
	% atom_chars(Input,L1),   
	write("Word 2 : "),nl,
	read(Input1),nl,
	% atom_chars(Input1,L2),
	write("Word 3 : "),nl,
	read(Input2),nl,
	% atom_chars(Input2,L3),
	write("Word 4 : "),nl,
	read(Input3),nl,
	% atom_chars(Input3,L4),
	write("Word 5 : "),nl,
	read(Input4),nl,
	% atom_chars(Input4,L5),
	write("Word 6 : "),nl,
	read(Input5),nl,
	% atom_chars(Input5,L6),
	write("Word 7 : "),nl,
	read(Input6),nl,
	% atom_chars(Input6,L7),
	write("Word 8 : "),nl,
	read(Input7),nl,
	% atom_chars(Input7,L8),
	Y = [Input,Input1,Input2,Input3,Input4,Input5,Input6,Input7].
notInY(X,Y,Z):-
	member(Z, X),
	\+ member(Z,Y).
	    
move(A,All,Next3):-
	length(A, Sz),
	Sz < 4,	
	notInY(All,A,Z),
	append(A, [Z], Next),
	notInY(All,Next,Z1),
	append(Next, [Z1], Next1),
	notInY(All,Next1,Z2),
	append(Next1, [Z2], Next2),
	notInY(All,Next2,Z3),
	append(Next2, [Z3], Next3).


move(A,All,Next):-
	length(A,Sz),
	Sz = 4,
	notInY(All,A,Z),
	nth1(1, A, E1),
	nth1(2, A, E2),
	nth1(3, A, E3),
	nth1(4, A, E4),
	crossword(E1,E2,E3,E4,Z,null,null,null),
	append(A, [Z], Next).

move(A,All,Next):-
	length(A,Sz),
	Sz = 5,
	notInY(All,A,Z),
	nth1(1, A, E1),
	nth1(2, A, E2),
	nth1(3, A, E3),
	nth1(4, A, E4),
	nth1(5, A, E5),
	crossword(E1,E2,E3,E4,E5,Z,null,null),
	append(A, [Z], Next).

move(A,All,Next):-
	length(A,Sz),
	Sz = 6,
	notInY(All,A,Z),
	nth1(1, A, E1),
	nth1(2, A, E2),
	nth1(3, A, E3),
	nth1(4, A, E4),
	nth1(5, A, E5),
	nth1(6, A, E6),
	crossword(E1,E2,E3,E4,E5,E6,Z,null),
	append(A, [Z], Next).

move(A,All,Next):-
	length(A,Sz),
	Sz = 7,
	notInY(All,A,Z),
	nth1(1, A, E1),
	nth1(2, A, E2),
	nth1(3, A, E3),
	nth1(4, A, E4),
	nth1(5, A, E5),
	nth1(6, A, E6),
	nth1(7, A, E7),
	crossword(E1,E2,E3,E4,E5,E6,E7,Z),
	append(A, [Z], Next).
	
	
	
	
	




goal([H1,H2,H3,H4,H5,H6,H7,H8]):-
	crossword(H1,H2,H3,H4,H5,H6,H7,H8).
%general algorithm

run():-
	takeEightWords(Y),
	go(Y).

%query of user and takes start state and next state
go(All,Goal):-
	path([[[],null]],All,[],Goal).
	
%main predicate that takes open list, closed list and goal state
path([],_,_,_):-
	write('No solution'),nl,!.
path([[Goal,Parent] | _], _ ,Closed, Goal):-
	goal(Goal),
	write('A solution is found'), nl ,
	p(Goal).
%	printsolution([Goal,Parent],Closed),!.

path(Open,All, Closed, Goal):-
	removeFromOpen(Open, [State, Parent], RestOfOpen),
	getchildren(State, All, Open, Closed, Children),
	addListToOpen(Children , RestOfOpen, NewOpen),
	path(NewOpen,All, [[State, Parent] | Closed], Goal).

%gets Children of State that aren't in Open or Close
getchildren(State,All, Open ,Closed , Children):-
		bagof(X, moves( State,All, Open, Closed, X), Children), ! .
getchildren(_,_,_,_, []).

%adds children to open list (without head child) to form new open list
%here it is like append i.e.Breadth First
addListToOpen(Children, [], Children).
addListToOpen(Children, [H|Open], [H|NewOpen]):-
	addListToOpen(Children, Open, NewOpen).

%gets head of open list to get its children later
removeFromOpen([State|RestOpen], State, RestOpen).

%gets next state given the current state
moves( State,All, Open, Closed,[Next,State]):-
	move(State,All,Next),
	\+ member([Next,_],Open),
	\+ member([Next,_],Closed).

%prints the path from start state to goal state
printsolution([State, null],_):-
	write(State),nl.
printsolution([State, Parent], Closed):-
	member([Parent, GrandParent], Closed),
	printsolution([Parent, GrandParent], Closed),
	write(State), nl.

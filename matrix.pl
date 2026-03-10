% Aleena Khan
% CS 326 HW 4
% rotating a matrix 90 clockwise

%my matrix from last hw
row(1, [1,  2,  3,  4]).
row(2, [5,  6,  7,  8]).
row(3, [9, 10, 11, 12]).

%grab all 3 rows into a list
get_matrix([R1, R2, R3]) :-
    row(1, R1),
    row(2, R2),
    row(3, R3).


%transpose flips rows into columns
transpose([], []).
transpose([[]|_], []).
transpose(Matrix, [Row|Rest]) :-
    heads(Matrix, Row),
    tails(Matrix, Tails),
    transpose(Tails, Rest).

%get first element of each row
heads([], []).
heads([[H|_]|Rows], [H|Hs]) :-
    heads(Rows, Hs).

%get tail of each row
tails([], []).
tails([[_|T]|Rows], [T|Ts]) :-
    tails(Rows, Ts).

%reverse
rev([], []).
rev([H|T], R) :-
    rev(T, RT),
    append(RT, [H], R).

%rotate = transpose then reverse each row
rotate(Matrix, Rotated) :-
    transpose(Matrix, T),
    reverse_rows(T, Rotated).

reverse_rows([], []).
reverse_rows([Row|Rest], [Rev|Revs]) :-
    rev(Row, Rev),
    reverse_rows(Rest, Revs).

%print each row on its own line
print_matrix([]).
print_matrix([Row|Rest]) :-
    write(Row), nl,
    print_matrix(Rest).


main :-
    get_matrix(M),
    write('Original:'), nl,
    print_matrix(M),
    rotate(M, R),
    write('Rotated:'), nl,
    print_matrix(R).

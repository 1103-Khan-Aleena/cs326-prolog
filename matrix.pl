%Aleena Khan
%CS 326 HW 4
%rotate a matrix 90 clockwise

:- use_module(library(readutil)).

%read matrix from file
get_matrix(File, Matrix) :-
    read_file_to_string(File, Content, []),
    split_string(Content, "\n", "", Lines),
    exclude(==(""), Lines, CleanLines),
    maplist(parse_row, CleanLines, Matrix).

%parse each line into a list of numbers
parse_row(Line, Row) :-
    split_string(Line, " ", " ", Parts),
    exclude(==(""), Parts, CleanParts),
    maplist(number_string, Row, CleanParts).

%transpose flips rows into columns
transpose([], []).
transpose([[]|_], []).
transpose(Matrix, [Row|Rest]) :-
    heads(Matrix, Row),
    tails(Matrix, Tails),
    transpose(Tails, Rest).

%first element of every row
heads([], []).
heads([[H|_]|Rows], [H|Hs]) :-
    heads(Rows, Hs).

%everything after first element
tails([], []).
tails([[_|T]|Rows], [T|Ts]) :-
    tails(Rows, Ts).

%reverse a list
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

%print each row
print_matrix([]).
print_matrix([Row|Rest]) :-
    write(Row), nl,
    print_matrix(Rest).

%main
main :-
    get_matrix("matrix.txt", M),
    write('Original:'), nl,
    print_matrix(M),
    rotate(M, R),
    write('Rotated:'), nl,
    print_matrix(R).


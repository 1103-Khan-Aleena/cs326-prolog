% Aleena Khan
% AleenaBot chatbot

message(hi,'Hi! I am AleenaBot.').
message(hello,'Hi! I am AleenaBot.').
message(hey,'Hi! I am AleenaBot.').
message(how_are_you,'I am doing great!').
message(what_is_your_name,'My name is AleenaBot.').
message(i_like_programming,'Programming is fun!').
message(tell_me_a_joke,'Why did the chicken cross the road? To get to the other side!').

%start the chat
chat :-
    write('Start chatting with AleenaBot. Type bye. to exit.'), nl,
    talk.

%conversation loop
talk :-
    write('You: '),
    read(Input),
    respond(Input).

%base case stoppping the convo loop
respond(bye) :-
    write('AleenaBot: Goodbye! Talk to you later.'), nl.

% matching rule
respond(Input) :-
    message(Input, Response), !,
    write('AleenaBot: '), write(Response), nl,
    talk.

%default (slide 11)
respond(_) :-
    write('AleenaBot: erm I dont understand! Try: hello. how_are_you. tell_me_a_joke.'), nl,
    talk.
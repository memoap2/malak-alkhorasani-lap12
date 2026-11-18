% Facts: directed roads between cities
edge('Dammam', 'Qatif').
edge('Qatif', 'Madinah').
edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Tabuk', 'Taif').
edge('Taif', 'Dammam').
edge('Riyadh', 'Dammam').
edge('Makkah', 'Riyadh').

% Find a path between two cities
travel(From, To, Path) :-
    path(From, To, [From], ReversedPath),
    reverse(ReversedPath, Path).

% Base case: destination reached
path(City, City, Visited, Visited).

% Recursive case: visit an unvisited neighboring city
path(From, To, Visited, Path) :-
    edge(From, Next),
    \+ member(Next, Visited),
    path(Next, To, [Next|Visited], Path).
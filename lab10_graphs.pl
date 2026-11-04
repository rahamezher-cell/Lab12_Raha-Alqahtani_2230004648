% Lab 10 - Task 1: Graph Paths

% Directed edges between cities
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').
edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Taif', 'Dammam').
edge('Taif', 'Tabuk').
edge('Tabuk', 'Taif').
edge('Riyadh', 'Dammam').
edge('Dammam', 'Riyadh').
edge('Dammam', 'Qatif').
edge('Qatif', 'Dammam').
edge('Qatif', 'Madinah').

% Find a path between two cities
travel(Start, Destination, Path) :-
    path(Start, Destination, [Start], ReversedPath),
    reverse(ReversedPath, Path).

% Base case
path(Destination, Destination, Visited, Visited).

% Recursive case
path(Current, Destination, Visited, Path) :-
    edge(Current, Next),
    \+ member(Next, Visited),
    path(Next, Destination, [Next|Visited], Path).

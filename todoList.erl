%% @author alpbrace


-module(todoList).
-import(lists,[append/2,delete/2,append/1]). 
-export([value/0,add/0,deleteElement/0,choose/1,process/0,read/0,done/0]).


value()->
	R = string:strip(io:get_line("Antwort:"), right, $\n).



add()->
	A=string:strip(io:get_line("Schreiben Sie die Aufgabe --->> "), right, $\n),
	{ok, S} = file:open("list.txt", [write]),
	io:format(S, "~s~n", [A]).
	%{ok, S} = file:open("list.txt", read).
	


deleteElement()->
	file:delete("list.txt").
	
read()->
	{ok, S} = file:open("list.txt", read),
	Txt = file:read_file("list.txt"), 
   io:fwrite("~p~n",[Txt]).
done()->
	done.
choose(X)->
	case X of 
		"1" -> add();
		"2" -> deleteElement();
		"3" -> done();
		"4" -> read()
	end.

process()->
	catch 
	io:fwrite("Todo List\nWas möchten Sie Machen?\n1-Hinzufügen,2-Löschen,3-Als fertig markieren,4-Liste Anzeigen,5-Ausgang\n"),
	X=value(),
	Check=5,
	Changed=list_to_integer(X),
	File ="\"list.txt\"",
	if
			Check == Changed->
			io:fwrite("Aufwiedersehen!");
			
			%throw("Bis Bald!");
		true ->
	choose(X),
	process()
		end.

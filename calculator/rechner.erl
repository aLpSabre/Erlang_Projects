%% @author alpbrace



-module(rechner).

-export([addition/2,value/0,subtraktion/2,division/2,
		multiplikation/2,potenz/2,grundrechenarten/3,loop/3,process/0]).

value()->
	R = string:strip(io:get_line("Antwort:"), right, $\n).


addition(A,B)->
	A+B.
subtraktion(A,B)->
	A-B.
division(A,B)->
	try
	Ans = A/B,
	Ans
	catch
		error:badarith->
		io:fwrite(" Kann nicht durch Null teilen ")
		end.
multiplikation(A,B)->
		A*B.
potenz(A,B)->
	math:pow(A,B).
grundrechenarten(X,A,B)->
	try
		case X of 
		"1" -> Y=addition(A,B);
		"2" -> Y=subtraktion(A,B);
		"3" -> Y=division(A,B);
		"4" -> Y=multiplikation(A,B);
		"5" -> Y=potenz(A,B)	
	end,
	io:format("Antwort ist ~w~n", [Y])
	catch error:function_clause->
  	io:fwrite(" Geben Sie eine Nummer ein")
	end.

  loop(X,A,B) -> 
grundrechenarten(X,A,B),
    loop(X,A,B). 

process()->
	catch 
	io:fwrite("Tashenrechner\nWas möchten Sie Machen?\n1-Adddition,2-Subtraktion,3-Division,4-Multiplikation,5-Potenz,6-Ausgang\n"),
	X=value(),
	Check=6,
	Changed=list_to_integer(X),

	if
			Check == Changed->
			io:fwrite("Aufwiedersehen!"),
			throw("Bis Bald!");
		true ->
	io:fwrite("Geben Sie die erste Nummer ein."),
	A=value(),
	io:fwrite("Geben Sie die zweite Nummer ein."),
	B=value(),
	Y = list_to_integer(A),
	Z = list_to_integer(B),
	grundrechenarten(X,Y,Z)
		end,
	process().









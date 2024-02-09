class Main inherits IO {
   stack : List;
   converter : A2I;
   condition : Bool <- true;


   main() : Object {
      {
         stack <- new List;
         converter <- new A2I;
	 while (condition ) loop
	    {
	       input();
	    }
	 pool;
      }
   };

   input(character : Char) :  Object {
	if character = "e" then execute(stack) else
	if character = "d" then display() else
	if character = "x" then stop() else
	{stack.cons(string); self;}
        fi fi fi
   };


   display() : Object {
	print_list(stack)
   };

   stop() : Object {
	{condition <- false; self;}
   };

   execute(): Object {
	if stack.head() = "+" then stack.tail().tail().tail().cons(converter.i2a( converter.a2i(stack.tail().head()) + converter.a2i(stack.tail().tail().head()))) else
	if stack.head() = "s" then {stack <- stack.tail(); temp : String <- stack.head(); stack.head() <- stack.tail().head(); stack.tail().head() <- temp;} 
        fi fi
   };

   print_list(l : List) : Object {
      if l.isNil() then out_string("\n")
                   else {
			   out_string(l.head());
			   out_string(" ");
			   print_list(l.tail());
		        }
      fi
   };

};

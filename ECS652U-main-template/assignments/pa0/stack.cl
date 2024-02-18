class Main inherits IO {
   stack : List;
   converter : A2I;
   condition : Bool <- true;
   temp1 : String;
   temp2 : String;


   main() : Object {
      {
      stack <- new List;
      converter <- new A2I;
      while (condition ) loop
         {
			   out_string(">");
            input(in_string());
         }
         pool;
      }
   };

   input(character : String) :  Object {
      if character = "e" then execute() else
      if character = "d" then display() else
      if character = "x" then stop() else
      {stack <- stack.cons(character); self;}
      fi fi fi
   };


   display() : Object {
	   print_list(stack)
   };

   stop() : Object {
	   {condition <- false; self;}
   };

   execute(): Object {
      if stack.head() = "+" then stack <- stack.tail().tail().tail().cons(converter.i2a( converter.a2i(stack.tail().head()) + converter.a2i(stack.tail().tail().head()))) else
      if stack.head() = "s" then {
         stack <- stack.tail();
         temp1 <- stack.head();
         stack <- stack.tail();
         temp2 <- stack.head();
         stack <- stack.tail();
         stack <- stack.cons(temp1).cons(temp2);
         } else 
		{self;}
      fi fi
   };

   print_list(l : List) : Object {
      if l.isNil() then self
         else {
			   out_string(l.head());
			   out_string("\n");
			   print_list(l.tail());
		   }
      fi
   };


};

class List {
   -- Define operations on empty lists.

   isNil() : Bool { true };

   -- Since abort() has return type Object and head() has return type
   -- Int, we need to have an Int as the result of the method body,
   -- even though abort() never returns.

   head()  : String {  "0" };

   -- As for head(), the self is just to make sure the return type of
   -- tail() is correct.

   tail()  : List { self };

   -- When we cons and element onto the empty list we get a non-empty
   -- list. The (new Cons) expression creates a new list cell of class
   -- Cons, which is initialized by a dispatch to init().
   -- The result of init() is an element of class Cons, but it
   -- conforms to the return type List, because Cons is a subclass of
   -- List.

   cons(i : String) : List {
      (new Cons).init(i, self)
   };

};

class Cons inherits List {

   car : String;	-- The element in this list cell

   cdr : List;	-- The rest of the list

   isNil() : Bool { false };

   head()  : String { car };

   tail()  : List { cdr };

   init(i : String, rest : List) : List {
      {
	 car <- i;
	 cdr <- rest;
	 self;
      }
   };

};



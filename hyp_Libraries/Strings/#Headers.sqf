//handleNil : If "a" is nil, properly returns nil, otherwise returns "a".  Needed as nil variables are indistingushable from non-declared variables
#define handleNil(a) ( if true then {private "_v"; _v = a;  if (!isNil("_v")) then {_v} else {nil} } )

//param : "a" is an array, "b" is an index, "c" is a default value.  If "a select b" is either out of bounds, or nil, c is returned.  Otherwise "a select b" is returned
#define param(a,b,c) ( if (count(a) > (b) && (b) >= 0) then { private "_v"; _v = (a) select (b); if (!isNil("_v")) then {_v} else {(c)}  } else {(c)} )
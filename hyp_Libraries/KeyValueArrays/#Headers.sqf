disableSerialization;

//handleNil : If "a" is nil, properly returns nil, otherwise returns "a".  Needed as nil variables are indistingushable from non-declared variables
#define handleNil(a) ( if true then {private "_v"; _v = a;  if (!isNil("_v")) then {_v} else {nil} } )

//param : "a" is an array, "b" is an index, "c" is a default value.  If "a select b" is either out of bounds, or nil, c is returned.  Otherwise "a select b" is returned
#define param(a,b,c) ( if (count(a) > b && b >= 0) then { private "_v"; _v = a select b; if (!isNil("_v")) then {_v} else {c}  } else {c} )

//KVA_CLASSNAME : String identifying KVAs, just incase I implement different pseudo-classes with similar formatting
#define KVA_CLASSNAME "KeyValueArray"

//KVA_(macros) : Convenience macros for accessing the important members of _kva.  Only ever meant to be used within kva functions, so _kva as the variable is hardcoded in
#define KVA_KEYS ((_kva select 1) select 1)
#define KVA_VALUES ((_kva select 2) select 1)
#define KVA_TAGGED ((_kva select 3) select 1)

//isKVA : Returns true if "a" is a valid KeyValueArray, and false otherwise.
#define isKVA(a) ( switch true do {                                             \
    case !(typeName(a) == typeName([])) : {false};                              \
    case !(count(a) >= 1) : {false};                                            \
    case !(typeName((a) select 0) == typeName([])) : {false};                   \
    case !(count((a) select 0) >= 2) : {false};                                 \
    case !(typeName(((a) select 0) select 0) == typeName("")) : {false};        \
    case !((((a) select 0) select 0) == "class") : {false};                     \
    case !(typeName(((a) select 0) select 1) == typeName("")) : {false};        \
    case !((((a) select 0) select 1) == KVA_CLASSNAME) : {false};               \
    default {true};                                                             \
} )
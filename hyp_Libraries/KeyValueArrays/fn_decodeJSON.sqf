/*
Name:
    kva_fnc_decodeJSON

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    kva_fnc_decodeJSON (Recursive)
    kva_fnc_new
    kva_fnc_set

Variable Notes:
    _chars: Array of the characters being parsed
    _out: Holds Output
    _getNext: Internal function that parses to the next recognized character, and executes the appropriate other internal function for handling it
    _parseString: Internal function that parses a string, given the index of the first character (A double quote).  Escapes on backslashes
    _parseBoolean: Internal function that parses a boolean, given the index of either the starting 't' or 'f'
    _parseNumber: Internal function that parses a number, given the index of the first digit.  Accepts negatives, decimals, and scientific notation
    _parseArray: Internal function that parses an array, given the index of the opening square bracket.  Recursively handles each element
    _parseKVA: Internal function that parses a JSON object into a KVA, given the index of the opening curly bracket.  Recursively handles each element

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

//Important Array and KVA Tokens
#define CHAR_BACKSLASH 92
#define CHAR_COLON 58
#define CHAR_L_SQUARE_BRACKET 91
#define CHAR_R_SQUARE_BRACKET 93
#define CHAR_L_CURLY_BRACKET 123
#define CHAR_R_CURLY_BRACKET 125
#define CHAR_DOUBLE_QUOTE 34
#define CHAR_COMMA 44
#define CHAR_SPACE 32

//Important Boolean Tokens
#define CHAR_T 116
#define CHAR_R 114
#define CHAR_U 117
#define CHAR_E 101
#define CHAR_F 102
#define CHAR_A 97
#define CHAR_L 108
#define CHAR_S 115

//Important Numeric Tokens
#define CHAR_MINUS 45
#define CHAR_PERIOD 46
#define CHAR_0 48
#define CHAR_1 49
#define CHAR_2 50
#define CHAR_3 51
#define CHAR_4 52
#define CHAR_5 53
#define CHAR_6 54
#define CHAR_7 55
#define CHAR_8 56
#define CHAR_9 57
#define NUMERIC_CHARS [45,46,48,49,50,51,52,53,54,55,56,57,101]
//Also e, however that's already defined

private["_chars","_out"];
_chars = toArray(_this select 0);
_out   = [];

//Syntax:
//  [characters, startIndex] call _parseString;
//Return Value:
//  [string, endIndex]
_parseString = {
    private["_chars","_start","_out","_end","_escaped"];
    _chars   = _this select 0;
    _start   = _this select 1;
    _out     = [];
    _end     = _start;
    _escaped = false;

    scopeName "main"; //Simple scopeName for breaking loop 
    for "_i" from _start + 1 to count(_chars) - 1 do {
        switch true do {
            case (_escaped) : {_out set [count _out, _chars select _i]; _escaped = false;}; //Any character is valid if escaped
            case (_chars select _i == CHAR_BACKSLASH) : {_escaped = true;}; //Don't record escape char, but note it's existence
            case (_chars select _i == CHAR_DOUBLE_QUOTE) : {_end = _i; breakTo "main"}; //Unescaped Double Quote, AKA end of string
            default {_out set [count _out, _chars select _i];}; //Any other character
        };
    };
    [toString(_out), _end]
};

//Syntax:
//  [characters, startIndex] call _parseBoolean;
//Return Value:
//  [boolean, endIndex], or [nil, endIndex] if error is encountered
_parseBoolean = {
    private["_chars","_start","_curr","_out"];
    _chars = _this select 0;
    _start = _this select 1;
    _curr  = "";
    _out   = [nil, (count(_chars) - 1)];
    for "_i" from _start to count(_chars) - 1 do {
        _curr = _curr + toString([_chars select _i]);
        if (_curr == "true") exitWith {_out = [true, _i];};
        if (_curr == "false") exitWith {_out = [false, _i]};
    };
    _out
};

//Syntax:
//  [characters, startIndex] call _parseNumber;
//Return Value:
//  [scalar, endIndex], or [nil, endIndex] if error is encountered
_parseNumber = {
    private["_chars","_start","_curr","_end"];
    _chars = _this select 0;
    _start = _this select 1;
    _curr  = "";
    _end   = _start; //Last valid index recorded, as we're stopping this at the first invalid char

    for "_i" from _start to count(_chars) - 1 do {
        if !((_chars select _i) in NUMERIC_CHARS) exitWith {}; //If current char isn't numeric, we're done
        _curr = _curr + toString([_chars select _i]);
        _end = _i;
    };
    if (_curr == "") exitWith {nil};
    [parseNumber(_curr), _end]
};

//Syntax:
//  [characters, startIndex] call _parseArray;
//Return Value:
//  [array, endIndex], or [nil, endIndex] if error is encountered
_parseArray = {
    private["_chars","_start","_arr","_end"];
    _chars = _this select 0;
    _start = _this select 1;
    _arr   = [];
    _end   = _start;

    for "_i" from _start + 1 to count(_chars) - 1 do {
        if ((_chars select _i) == CHAR_R_SQUARE_BRACKET) exitWith {_end = _i;}; //We hit the end of the array
        if !((_chars select _i) == CHAR_COMMA) then { //Don't interpret commas as anything
            private["_next"];
            _next = [_chars, _i] call _getNext;
            _arr set [count(_arr), _next select 0];
            _i = _next select 1;
        };
    };
    [_arr, _end]
};

//Syntax:
//  [characters, startIndex] call _parseKVA;
//Return Value:
//  [KVA, endIndex], or [nil, endIndex] if error is encountered
_parseKVA = {
    private["_chars","_start","_kva","_end"];
    _chars = _this select 0;
    _start = _this select 1;
    _kva   = [] call kva_fnc_new;
    _end   = _start;

    for "_i" from _start + 1 to count(_chars) - 1 do {
        if ((_chars select _i) == CHAR_R_CURLY_BRACKET) exitWith {_end = _i;}; //We hit the end of the JSON object

        //Now, let's make the assumption that the next two elements are going to be the Key, a semicolon, then the value.
        //_getNext already ignores most characters, so we can just getNext twice in a row to get the key then the value
        if !((_chars select _i) == CHAR_COMMA) then { //Don't interpret commas as anything
            private["_key","_value"];
            _key  = [_chars, _i] call _getNext;

            _i = (_key select 1) + 1; //_getNext returns the index of the last character it parsed, so increment up once manually
            _value = [_chars, _i] call _getNext;
            _i = (_value select 1) + 1; //Same as above
            [_kva, (_key select 0), (_value select 0)] call kva_fnc_set;
        };
    };

    [_kva, _end]
};

//Syntax:
//  [characters, startIndex] call _getNext;
//Return Value:
//  [any, endIndex], or [nil, endIndex] if error is encountered
_getNext = {
    private["_chars","_start","_out"];
    _chars = _this select 0;
    _start = _this select 1;
    _out   = [nil, count(_chars) - 1];

    scopeName "main"; //Simple scopeName for breaking loop
    for "_i" from _start to count(_chars) - 1 do {
        switch true do {
            case ((_chars select _i) == CHAR_DOUBLE_QUOTE)     : { _out = [_chars, _i] call _parseString;  breakTo "main"; };
            case ((_chars select _i) == CHAR_L_SQUARE_BRACKET) : { _out = [_chars, _i] call _parseArray;   breakTo "main"; };
            case ((_chars select _i) == CHAR_L_CURLY_BRACKET)  : { _out = [_chars, _i] call _parseKVA;     breakTo "main"; };
            case ((_chars select _i) in NUMERIC_CHARS)         : { _out = [_chars, _i] call _parseNumber;  breakTo "main"; };
            case ((_chars select _i) in [CHAR_T, CHAR_F])      : { _out = [_chars, _i] call _parseBoolean; breakTo "main"; };
        };
    };
    _out
};

[_chars, 0] call _getNext
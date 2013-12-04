/*
Name:
    kva_fnc_encodeJSON

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    str_fnc_escape

Variable Notes:
    _curr: Current element being parsed
    _out: Holds output for current function
    _handleKVA: Internal function that encodes a KVA to a string
    _handleArray: Internal function that converts an array to a string

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

#define handleElement(a) ( switch true do {                                     \
    case (isKVA(a)) : {[(a)] call _handleKVA};                                  \
    case (typeName(a) == typeName([])) : {[(a)] call _handleArray};             \
    case (typeName(a) in [typeName(0), typeName(false)]) : {format["%1", (a)]}; \
    default { format['"%1"', [format['%1', (a)]] call str_fnc_escape] };        \
} )

private["_this","_curr","_out","_handleKVA","_handleElement"];
_curr = _this select 0;
_out = "";

//string = [kva] call _handleKVA;
_handleKVA = {
    private["_this","_kva","_out"];
    _kva = _this select 0;
    _out = "";
    {
        if (_out != "") then {_out = _out + ","}; //Insert a , before every element but the first one
        _out = format['%1"%2":%3', _out, _x,  handleElement(KVA_VALUES select _forEachIndex)];
    } forEach KVA_KEYS;
    format["{%1}", _out]
};

//string = [array] call _handleArray
_handleArray = {
    private["_this","_arr","_out"];
    _arr = _this select 0;
    _out = "";
    {
        if (_out != "") then {_out = _out + ","}; //Insert a , before every element but the first one
        _out = _out + handleElement(_x);
    } forEach _arr;
    format["[%1]", _out]
};

handleElement(_curr)
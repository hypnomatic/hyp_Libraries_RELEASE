/*
Name:
    str_fnc_unescape

Author:
    Hypnomatic

Last Updated:
    11/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    N/A

Variable Notes:
    _str: Input string to unescape
    _escapeChar: Character to use as the escape character
    _out: Holds output
    _isEscaped: Stored whether the previous character was an _escapeChar or not 

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_str","_escapeChar","_out","_isEscaped"];
_str        = toArray(_this select 0);
_escapeChar = toArray(param(_this, 1, "\")) select 0;
_out        = [];
_isEscaped  = false;
{
    switch true do {
        case (_isEscaped) : {_out set [count _out, _x]; _isEscaped = false;};
        case (_x == _escapeChar) : {_isEscaped = true;};
        default {_out set [count _out, _x];};
    };
} forEach _str;
toString(_out)
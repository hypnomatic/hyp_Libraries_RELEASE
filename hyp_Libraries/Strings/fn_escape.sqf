/*
Name:
    str_fnc_escape

Author:
    Hypnomatic

Last Updated:
    11/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    N/A

Variable Notes:
    _str: Input string to escape
    _escapeChar: Character to insert before every _escapedChars
    _escapedChars: Characters to escape within _str
    _out: Holds output

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_str","_escapeChar","_escapedChars","_out"];
_str          = toArray(_this select 0);
_escapeChar   = toArray(param(_this, 1, "\")) select 0;
_escapedChars = toArray(param(_this, 2, "\"""));
_out          = [];
{
    if (_x in _escapedChars) then {
        _out set [count _out, _escapeChar];
    };
    _out set [count _out, _x];
} forEach _str;
toString(_out)
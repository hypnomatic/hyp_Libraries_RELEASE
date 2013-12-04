/*
Name:
    arr_fnc_findAll

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    arr_fnc_compare

Variable Notes:
    _arr: Array being searched
    _val: Value being searched for
    _out: Array of indexes of matches

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_arr","_val","_out"];
_arr = _this select 0;
_val = _this select 1;
_out = [];
{
    if ([_x, _val] call arr_fnc_compare) then {_out set [count _out, _forEachIndex];};
} forEach _arr;
_out
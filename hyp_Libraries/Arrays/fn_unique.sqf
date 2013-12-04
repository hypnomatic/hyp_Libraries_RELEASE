/*
Name:
    arr_fnc_unique

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    arr_fnc_reassign

Variable Notes:
    _arr: Array to change
    _uniques: Stores all unique elements for reassigning

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_arr","_uniques"];
_arr  = _this select 0;
_uniques = [];
{
    if (_forEachIndex == (_arr find _x)) then { //If this is the first occurence of the value
        _uniques set [count(_uniques), handleNil(_x)];
    };
} forEach _arr;
[_arr, _uniques] call arr_fnc_reassign;
_arr
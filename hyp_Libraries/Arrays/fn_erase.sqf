/*
Name:
    arr_fnc_erase

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    N/A

Variable Notes:
    _arr: Array being manipulated
    _vals: Indexes to remove
    _fIndex: Current index in the effective "output" array, ie how many elements have been iterated through and kept

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_arr","_vals","_fIndex"];
_arr  = _this select 0;
_vals = if (typeName(_this select 1) != typeName([])) then {[_this select 1]} else {(_this select 1)};

_fIndex = 0; //Current index of output array
{
    if !(_forEachIndex in _vals) then { //If element is to be kept...
        if (_forEachIndex != _fIndex) then { //..And we've had to remove at least one index so far...
            _arr set [_fIndex, _x];
        };
        _fIndex = _fIndex + 1; //...Increment up the index for the final counter
    };
} forEach _arr;
_arr resize _fIndex;
_arr
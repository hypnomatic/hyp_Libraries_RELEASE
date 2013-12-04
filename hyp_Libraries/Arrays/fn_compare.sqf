/*
Name:
    arr_fnc_compare

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    arr_fnc_compare (Recursive, so function name is in code)

Variable Notes:
    _prev: Stores the previous value
    _out: Stores output state

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_prev","_out"];

_prev = _this select 0;
_out  = true;
for "_i" from 1 to count(_this) - 1 do {
    if (str _prev != str (_this select _i)) exitWith {_out = false;};
};
_out
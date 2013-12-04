/*
Name:
    arr_fnc_pop

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
    _out: Value to return

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_arr","_out"];
_arr = _this select 0;
_out = _arr select (count(_arr) - 1);
//_out = [_arr, count(_arr) - 1, nil] call BIS_fnc_param;
_arr resize (count(_arr) - 1);
_out
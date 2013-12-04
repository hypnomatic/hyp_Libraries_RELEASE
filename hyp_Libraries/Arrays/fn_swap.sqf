/*
Name:
    arr_fnc_swap

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    arr_fnc_reassign

Variable Notes:
    _arr0: First array being manipulated
    _arr0: Second array being manipulated
    _temp: Placeholder for swapping

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_arr0","_arr1","_temp"];
_arr0 = _this select 0;
_arr1 = _this select 1;
_temp = [];
[_temp, _arr0] call arr_fnc_reassign;
[_arr0, _arr1] call arr_fnc_reassign;
[_arr1, _temp] call arr_fnc_reassign;
nil
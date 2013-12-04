/*
Name:
    arr_fnc_reverse

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
    _i: Index of element, starting at the beginning, to be swapped with element at _j
    _j: Index of element, starting at the end, to be swapped with element at _i
    _temp: Holding value of _arr select _i while the swap takes place

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_arr"];
_arr = _this select 0;
for "_i" from 0 to floor((count _arr)/2) do {
    private["_j","_temp"];
    _j = count(_arr) - 1 - _i;
    _temp = _arr select _i;
    _arr set [_i, _arr select _j];
    _arr set [_j, _temp];
};
_arr
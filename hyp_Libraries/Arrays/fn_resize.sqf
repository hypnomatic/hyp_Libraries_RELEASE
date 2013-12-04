/*
Name:
    arr_fnc_resize

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    arr_fnc_reverse

Variable Notes:
    _arr: Array being manipulated
    _size: New size to set to _arr. Negative values indicate starting from end of array, ala KillzoneKid's idea

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/

#include "#Headers.sqf"

private["_this","_arr","_size"];
_arr  = _this select 0;
_size = _this select 1;
if (_size >= 0) exitWith {_arr resize _size;};

[_arr] call arr_fnc_reverse;
_arr resize abs(_size);
[_arr] call arr_fnc_reverse;
_arr
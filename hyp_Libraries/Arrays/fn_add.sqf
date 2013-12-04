/*
Name:
    arr_fnc_add

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    N/A

Variable Notes:
    _arr0: First array to add.
    _arr1: Second array to add.

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_arr0, _arr1"];
_arr0 = _this select 0;
_arr1 = _this select 1;
{
    _arr0 set [count _arr0, handleNil(_x)];
} forEach _arr1;
_arr0
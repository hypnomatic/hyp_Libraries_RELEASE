/*
Name:
    arr_fnc_push

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
    _val: Value being added

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_arr","_val"];
_arr = _this select 0;
_val = _this select 1;
_arr set [count _arr, handleNil(_val)];
_arr
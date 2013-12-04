/*
Name:
    arr_fnc_select

Author:
    Hypnomatic

Last Updated:
    10/29/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    N/A

Variable Notes:
    _arr: Array being searched
    _index: Index to retrieve

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_arr","_index"];
_arr   = _this select 0;
_index = _this select 1;
param(_arr, _index, param(_this, 2, nil))
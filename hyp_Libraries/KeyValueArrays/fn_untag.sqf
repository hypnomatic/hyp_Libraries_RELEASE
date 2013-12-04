/*
Name:
    kva_fnc_untag

Author:
    Hypnomatic

Last Updated:
    11/28/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    arr_fnc_erase

Variable Notes:
    _kva: KeyValueArray being manipulated
    _key: Key to be untagged

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_kva","_key"];
_kva = _this select 0;
_key = _this select 1;
[KVA_TAGGED, KVA_TAGGED find _key] call arr_fnc_erase;
_kva
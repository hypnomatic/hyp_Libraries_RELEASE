/*
Name:
    kva_fnc_deleteTagged

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
    _indexes: Indexes of tagged keys, to be removed from both KVA_KEYS and KVA_VALUES

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_kva","_indexes"];
_kva = _this select 0;
_indexes = [];
{
    _indexes set [count _indexes, KVA_KEYS find _x];
} forEach KVA_TAGGED;
[KVA_KEYS, _indexes] call arr_fnc_erase;
[KVA_VALUES, _indexes] call arr_fnc_erase;
KVA_TAGGED resize 0;
_kva
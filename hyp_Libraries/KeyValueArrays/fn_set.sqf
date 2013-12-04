/*
Name:
    kva_fnc_set

Author:
    Hypnomatic

Last Updated:
    11/28/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    N/A

Variable Notes:
    _kva: KeyValueArray being manipulated
    _key: Key within _kva being added or set
    _val: Value to be assosiated with _key
    _index: Stores found index for _key in _kva, or -1 if _key does not exist in _kva

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_kva","_key","_val","_index"];
_kva   = _this select 0;
_key   = _this select 1;
_val   = _this select 2;
_index = KVA_KEYS find _key;
if (_index != -1) then {
    KVA_KEYS set [_index, _key];
    KVA_VALUES set [_index, _val];
} else {
    KVA_KEYS set [count(KVA_KEYS), _key];
    KVA_VALUES set [count(KVA_VALUES), _val];
};
_kva
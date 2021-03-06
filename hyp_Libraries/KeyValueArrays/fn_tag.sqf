/*
Name:
    kva_fnc_tag

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
    _key: Key to be tagged for deletion

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_kva","_key"];
_kva = _this select 0;
_key = _this select 1;
if !(_key in KVA_TAGGED) then {
    KVA_TAGGED set [count (KVA_TAGGED), _key];
};
_kva
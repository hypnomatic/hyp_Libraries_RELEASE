/*
Name:
    kva_fnc_select

Author:
    Hypnomatic

Last Updated:
    11/28/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    N/A

Variable Notes:
    _kva: KeyValueArray being searched
    _key: Key within _kva being searched for
    (Unseen): second param for _this is a default parameter if _index is out of bounds.  Defaults to nil

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_kva","_key","_index"];
_kva     = _this select 0;
_key     = _this select 1;
_index   = KVA_KEYS find _key;
param(KVA_VALUES, _index, param(_this, 2, nil))
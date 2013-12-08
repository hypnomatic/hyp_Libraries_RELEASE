/*
Name:
    kva_fnc_count

Author:
    Hypnomatic

Last Updated:
    12/8/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    N/A

Variable Notes:
    _kva: KeyValueArray being counted

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_kva"];
_kva  = _this select 0;
count(KVA_KEYS)
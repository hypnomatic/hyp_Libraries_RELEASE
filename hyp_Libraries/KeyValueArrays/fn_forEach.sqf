/*
Name:
    kva_fnc_forEach

Author:
    Hypnomatic

Last Updated:
    12/8/2013

Documentation:
    See ARMA.DatHypno.net for all up to date documentation

Dependencies:
    N/A

Variable Notes:
    _kva: KeyValueArray being traversed
    _code: Code to execute on each iteration
    _x: Value for current Key-Value pair
    _forEachKey: Key for current Key-Value pair
    _forEachIndex: Index for current Key-Value pair

License:
    Copyright (c) 2013, Hypnomatic
    All rights reserved.
    This code is released under the very permissive BSD License.  The full contents of this license may be found at ARMA.DatHypno.net/Article/BSD/
*/

#include "#Headers.sqf"

private["_this","_kva","_code"];
_kva  = _this select 0;
_code = _this select 1;
{
    private["_forEachKey"];
    _forEachKey = KVA_KEYS select _forEachIndex;
    call _code;
} forEach KVA_VALUES;
nil
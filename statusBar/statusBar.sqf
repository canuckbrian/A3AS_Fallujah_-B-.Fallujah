/*
	@file Version: 0.2
	@file Name: statusBar.sqf
	@file  EpochMod StatusBar Port for Wasteland / Exile by CRE4MPIE
	@file Created: 21/4/2015
	@file Updated by CRE4MPIE for new Exile Attributes 
	@File Edited 15/3/2016
	@notes: Added custom Icons and Attributes, removed garbage
	All Credits Due to the original creator of this script.
*/
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

[] spawn
{
	_uid = getPlayerUID player;

	while {true} do
	{
		uisleep 5;
		
			_rscLayer = "RscStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["RscStatusBar","PLAIN",1,false];

			if(isNull ((uiNamespace getVariable "RscStatusBar")displayCtrl 55554)) then
			{
				diag_log "statusbar is null create";
				disableSerialization;
				_rscLayer = "RscStatusBar" call BIS_fnc_rscLayer;
				_rscLayer cutRsc ["RscStatusBar","PLAIN",1,false];
			};
			//initialize variables and set values
			_unit = _this select 0;
			_damage = round ((1 - (damage player)) * 100);
			//_damage = (round(_damage * 100));
			_serverFPS = round diag_fps;
			_pos = getPosATL player;
			_dir = round (getDir (vehicle player));
			_grid = mapGridPosition  player; _xx = (format[_grid]) select  [0,3];
			_yy = (format[_grid]) select  [3,3];
			//_time = (round(240-(serverTime)/60));  //edit the '240' value (60*4=240) to change the countdown timer if your server restarts are shorter or longer than 4 hour intervals
			_time = (round((serverTime)/60));  //Counts up from the time the server was started.
			_hours = (floor(_time/60));
			_minutes = (_time - (_hours * 60));

			switch(_minutes) do
			{
				case 9: {_minutes = "09"};
				case 8: {_minutes = "08"};
				case 7: {_minutes = "07"};
				case 6: {_minutes = "06"};
				case 5: {_minutes = "05"};
				case 4: {_minutes = "04"};
				case 3: {_minutes = "03"};
				case 2: {_minutes = "02"};
				case 1: {_minutes = "01"};
				case 0: {_minutes = "00"};
			};

			//Color Gradient
			_colourDefault 	= parseText "#FBFCFE"; //
			_colour90 		= parseText "#F5E6EC"; //
			_colour80 		= parseText "#F0D1DB"; //
			_colour70 		= parseText "#EBBBC9"; //
			_colour60 		= parseText "#E6A6B8"; //
			_colour50 		= parseText "#E191A7"; //
			_colour40 		= parseText "#DB7B95"; //
			_colour30 		= parseText "#D66684"; //
			_colour20 		= parseText "#D15072"; //
			_colour10 		= parseText "#CC3B61"; //
			_colour0 		= parseText "#C72650"; //
			_colourDead 	= parseText "#000000";

			//Colour coding
			//Damage
			_colourDamage = _colourDefault;
			if(_damage >= 100) then{_colourDamage = _colourDefault;};
			if((_damage >= 90) && (_damage < 100)) then {_colourDamage =  _colour90;};
			if((_damage >= 80) && (_damage < 90)) then {_colourDamage =  _colour80;};
			if((_damage >= 70) && (_damage < 80)) then {_colourDamage =  _colour70;};
			if((_damage >= 60) && (_damage < 70)) then {_colourDamage =  _colour60;};
			if((_damage >= 50) && (_damage < 60)) then {_colourDamage =  _colour50;};
			if((_damage >= 40) && (_damage < 50)) then {_colourDamage =  _colour40;};
			if((_damage >= 30) && (_damage < 40)) then {_colourDamage =  _colour30;};
			if((_damage >= 20) && (_damage < 30)) then {_colourDamage =  _colour20;};
			if((_damage >= 10) && (_damage < 20)) then {_colourDamage =  _colour10;};
			if((_damage >= 1) && (_damage < 10)) then {_colourDamage =  _colour0;};
			if(_damage < 1) then{_colourDamage =  _colourDead;};
			
			
			//display the information
			((uiNamespace getVariable "RscStatusBar")displayCtrl 55554) ctrlSetStructuredText
			parseText
			format
			["
				<t shadow='1' shadowColor='#000000' color='%5'><img size='1.6'  shadowColor='#000000' image='statusbar\icons\players.paa' color='%5'/> %2</t>
				<t shadow='1' shadowColor='#000000' color='%10'><img size='1.0'  shadowColor='#000000' image='statusbar\icons\health.paa' color='%5'/> %3%1</t>				
				<t shadow='1' shadowColor='#000000' color='%5'>FPS: %4</t>
				<t shadow='1' shadowColor='#000000' color='%5'><img size='1.0'  shadowColor='#000000' image='statusbar\icons\compass.paa' color='%5'/> %7</t>
				<t shadow='1' shadowColor='#000000' color='%5'><img size='1.6'  shadowColor='#000000' image='statusbar\icons\restart.paa' color='%5'/>%8:%9</t>",

						/* 1 */ "%",
						/* 2 */ count playableUnits,
						/* 3 */ _damage,						
						/* 4 */ _serverFPS,						
						/* 5 */ _colourDefault,
						/* 6 */ format["%1/%2",_xx,_yy],
						/* 7 */ _dir,
						/* 8 */ _hours,
						/* 9 */ _minutes,
						/* 10 */ _colourDamage
			];
	};
};

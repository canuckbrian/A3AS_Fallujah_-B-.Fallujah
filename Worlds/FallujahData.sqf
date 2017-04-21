if !(worldName == "fallujah") exitWith {};

power = ["power_1","power_2","power_3","power_4","power_5"]; // power plants
bases = ["base_1","base_2"]; // army bases
aeropuertos = ["airport_1"]; // airports
recursos = ["resource_1","resource_2","resource_3","resource_4","resource_5","resource_6","resource_7","resource_8","resource_9","resource_10","resource_11","resource_12"]; // resources
fabricas = ["factory_1","factory_2","factory_3","factory_4","factory_5"]; // factories
puestos = ["puesto_1","puesto_2","puesto_3","puesto_4","puesto_5"]; // outposts
puestosAA = ["puesto_1","puesto_2","puesto_3","puesto_4","puesto_5"]; // AA outposts
puertos = []; // harbours
controles = ["control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8","control_9","control_10","control_11","control_12","control_13"]; // roadblocks
colinas = []; // mountaintops
colinasAA = []; // mountaintops for special purposes (compositions, etc)
artyEmplacements = ["artillery_1", "artillery_2", "artillery_3", "artillery_4", "artillery_5"]; // artillery encampments
seaMarkers = []; // naval patrol zones

posAntenas = [[4129,3670,0],[5546.73,4815.5,0],[8132,2268,0],[1592,2429,0],[6280,507,0],[8175,5566,0],[4230,5735,0],[5703,6527,0.700012],[733,8446,1],[6177,9747,1]]; // antenna's

posbancos = [];

safeDistance_undercover = 250;
safeDistance_garage = 200;
safeDistance_recruit = 200;
safeDistance_garrison = 200;
safeDistance_fasttravel = 250;

static_defPosHQ = [3450.64,3006.85];

bld_smallBunker = "Land_BagBunker_Small_F";
//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "yogstation\map_files\generic\CentCom.dmm" //all yogstation maps are in the _maps/yogstation folder
//#include "map_files\ipb_purge\planets.dmm"
//#include "map_files\ipb_purge\rebel_base.dmm"
//#include "map_files\ipb_purge\rebel_underground.dmm"


#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Mining\Lavaland.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "map_files\Deltastation\DeltaStation2.dmm"
		#include "map_files\MetaStation\MetaStation.dmm"
		#include "map_files\PubbyStation\PubbyStation.dmm"
		#include "map_files\BoxStation\BoxStation.dmm"
		#include "map_files\Donutstation\Donutstation.dmm"
		#include "map_files\ipb_purge\purge.dmm"
		#include "yogstation\map_files\YogStation\Yogstation.dmm"
		#include "yogstation\map_files\YogsMeta\YogsMeta.dmm"
		#include "yogstation\map_files\YogsPubby\YogsPubby.dmm"
		#include "yogstation\map_files\YogsDelta\YogsDelta.dmm"
		#include "yogstation\map_files\YogsDonut\YogsDonut.dmm"
		#include "yogstation\map_files\MinskyStation\MinskyStation.dmm"
		#ifdef TRAVISBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif

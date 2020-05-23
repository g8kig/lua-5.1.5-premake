-- premake5.lua
workspace "Lua51"
   configurations { "Debug", "Release" }

project "Lua51"
   kind "SharedLib"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   linkoptions "/DEF:Lua51.def"

   files { "src/**.h", 
	   "src/lapi.c",    "src/lcode.c",   "src/ldebug.c",   "src/ldo.c", 
	   "src/ldump.c",   "src/lfunc.c",   "src/lgc.c",      "src/llex.c", 
	   "src/lmem.c",    "src/lobject.c", "src/lopcodes.c", "src/lparser.c", 
           "src/lstate.c",  "src/lstring.c", "src/ltable.c",   "src/ltm.c", 
           "src/lundump.c", "src/lvm.c",     "src/lzio.c",     "src/print.c" }

   filter { "action:vs*", "configurations:Release" }
	buildoptions "/GL"
 	linkoptions "/LTCG" 

   filter "action:vs*"
  	defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }

   filter "configurations:Debug"
      	defines { "DEBUG" }
      	symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
      	optimize "On"

project "Lua51Lib"
   kind "SharedLib"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "Lua51" }
   libdirs { "bin/%{cfg.buildcfg}" }
   linkoptions "/DEF:Lua51Lib.def"

   files { "src/**.h", 
	   "src/lauxlib.c",  "src/lbaselib.c", "src/ldblib.c",  "src/liolib.c", 
           "src/lmathlib.c", "src/lstrlib.c",  "src/loadlib.c", "src/loslib.c", 
           "src/ltablib.c",  "src/linit.c"}

   filter { "action:vs*", "configurations:Release" }
	buildoptions "/GL"
 	linkoptions "/LTCG" 

   filter "action:vs*"
  	defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }

   filter "configurations:Debug"
      	defines { "DEBUG" }
      	symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
      	optimize "On"

project "Lua"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "Lua51", "Lua51lib" }
   libdirs { "bin/%{cfg.buildcfg}" }

   files { "src/**.h", "src/lua.c" }

   filter { "action:vs*", "configurations:Release" }
	buildoptions "/GL"
 	linkoptions "/LTCG" 

   filter "action:vs*"
  	defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }

   filter "configurations:Debug"
      	defines { "DEBUG" }
      	symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
      	optimize "On"

project "Luac"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "Lua51", "Lua51lib" }
   libdirs { "bin/%{cfg.buildcfg}" }

   files { "src/**.h", 
	   "src/luac.c",    "src/ldo.c",     "src/lgc.c",     "src/lfunc.c", 
           "src/ltable.c",  "src/lvm.c",     "src/lstate.c",  "src/ldebug.c", 
           "src/lobject.c", "src/lapi.c",    "src/lmem.c",    "src/lopcodes.c", 
           "src/lzio.c",    "src/lstring.c", "src/ldump.c",   "src/llex.c", 
           "src/ltm.c",     "src/print.c",   "src/lundump.c", "src/lparser.c", 
           "src/lcode.c" }

   filter { "action:vs*", "configurations:Release" }
	buildoptions "/GL"
 	linkoptions "/LTCG" 

   filter "action:vs*"
  	defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }

   filter "configurations:Debug"
      	defines { "DEBUG" }
      	symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
      	optimize "On"

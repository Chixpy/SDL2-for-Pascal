unit SDL2;

{
  Simple DirectMedia Layer
  Copyright (C) 1997-2013 Sam Lantinga <slouken@libsdl.org>

  Pascal-Header-Conversion
  Copyright (C) 2012/13 Tim Blume aka End/EV1313

  SDL.pas is based on the files:
  "sdl.h",
  "sdl_blendmode.h",
  "sdl_events.h",
  "sdl_error.h",
  "sdl_gesture.h",
  "sdl_joystick.h",
  "sdl_keyboard.h",
  "sdl_keycode.h",
  "sdl_loadso.h"
  "sdl_pixels.h",
  "sdl_power.h",
  "sdl_main.h",
  "sdl_mouse.h",
  "sdl_mutex.h",
  "sdl_rect.h",
  "sdl_render.h",
  "sdl_rwops.h",
  "sdl_scancode.h",
  "sdl_shape.h",
  "sdl_stdinc.h",
  "sdl_surface.h",
  "sdl_thread.h",
  "sdl_timer.h",
  "sdl_touch.h",
  "sdl_version.h",
  "sdl_video.h",
  "sdltype_s.h"

  I will not translate:
  "sdl_opengl.h",
  "sdl_opengles.h"
  "sdl_opengles2.h"

  cause there's a much better OpenGL-Header avaible at delphigl.com:

  the dglopengl.pas

  Parts of the SDL.pas are from the SDL-1.2-Headerconversion from the JEDI-Team,
  written by Domenique Louis and others.

  I've changed the names of the dll for 32 & 64-Bit, so theres no conflict
  between 32 & 64 bit Libraries.

  This software is provided 'as-is', without any express or implied
  warranty.  In no case will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.

  Special Thanks to:

   - DelphiGL.com - Community
   - Domenique Louis and everyone else from the JEDI-Team
   - Sam Latinga and everyone else from the SDL-Team
}

{
  Changelog:
  ----------
  v.1.61-stable; 02.09.2013: now it should REALLY work with Mac...
  v.1.60-stable; 01.09.2013: now it should work with Delphi XE4 for Windows and
                            MacOS and of course Lazarus. thx to kotai :D
  v.1.55-Alpha; 24.08.2013: fixed bug with SDL_GetEventState thx to d.l.i.w.
  v.1.54-Alpha; 24.08.2013: added sdl_loadso.h
  v.1.53-Alpha; 24.08.2013: renamed *really* and fixed linux comp.
  v.1.52-Alpha; 24.08.2013: renamed sdl.pas to sdl2.pas
  v.1.51-Alpha; 24.08.2013: added sdl_platform.h
  v.1.50-Alpha; 24.08.2013: the header is now modular. thx for the hint from d.l.i.w.
  v.1.40-Alpha; 13.08.2013: Added MacOS compatibility (thx to stoney-fd)
  v.1.34-Alpha; 05.08.2013: Added missing functions from sdl_thread.h
  v.1.33-Alpha; 31.07.2013: Added missing units for Linux. thx to Cybermonkey
  v.1.32-Alpha; 31.07.2013: Fixed three bugs, thx to grieferatwork
  v.1.31-Alpha; 30.07.2013: Added "sdl_power.h"
  v.1.30-Alpha; 26.07.2013: Added "sdl_thread.h" and "sdl_mutex.h"
  v.1.25-Alpha; 29.07.2013: Added Makros for SDL_RWops
  v.1.24-Alpha; 28.07.2013: Fixed bug with RWops and size_t
  v.1.23-Alpha; 27.07.2013: Fixed two bugs, thx to GrieferAtWork
  v.1.22-Alpha; 24.07.2013: Added "sdl_shape.h" and TSDL_Window
                            (and ordered the translated header list ^^)
  v.1.21-Alpha; 23.07.2013: Added TSDL_Error
  v.1.20-Alpha; 19.07.2013: Added "sdl_timer.h"
  v.1.10-Alpha; 09.07.2013: Added "sdl_render.h"
  v.1.00-Alpha; 05.07.2013: Initial Alpha-Release.
}

{$DEFINE SDL}

{$I jedi.inc}

interface

  {$IFDEF WINDOWS}
    uses
      Windows;
  {$ENDIF}

  {$IFDEF LINUX}
    uses
      X,
      XLib;
  {$ENDIF}

const

  {$IFDEF WINDOWS}
    {$IFDEF WIN32}
      SDL_LibName = 'SDL2_x86.dll';
	  {$ENDIF}
	  {$IFDEF WIN64}
	    SDL_LibName = 'SDL2_x86_x64.dll';
   	{$ENDIF}
  {$ENDIF}

  {$IFDEF UNIX}
    {$IFDEF DARWIN}
      SDL_LibName = 'libSDL2.dylib';
    {$ELSE}
      {$IFDEF FPC}
        SDL_LibName = 'libSDL2.so';
      {$ELSE}
        SDL_LibName = 'libSDL2.so.0';
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF MACOS}
    SDL_LibName = 'SDL2';
    {$IFDEF FPC}
      {$linklib libSDL2}
    {$ENDIF}
  {$ENDIF}

{$I sdltype.inc}
{$I sdlversion.inc}
{$I sdlerror.inc}
{$I sdlplatform.inc}
{$I sdlpower.inc}
{$I sdlthread.inc}
{$I sdlmutex.inc}
{$I sdltimer.inc}
{$I sdlpixels.inc}
{$I sdlrect.inc}
{$I sdlrwops.inc}
{$I sdlblendmode.inc}
{$I sdlsurface.inc}
{$I sdlshape.inc}
{$I sdlvideo.inc}
{$I sdlrenderer.inc}
{$I sdlscancode.inc}
{$I sdlkeyboard.inc}
{$I sdlmouse.inc}
{$I sdljoystick.inc}
{$I sdltouch.inc}
{$I sdlgesture.inc}
{$I sdlevents.inc}
{$I sdl.inc}

implementation

//from "sdl_version.h"
procedure SDL_VERSION(x: PSDL_Version);
begin
  x.major := SDL_MAJOR_VERSION;
  x.minor := SDL_MINOR_VERSION;
  x.patch := SDL_PATCHLEVEL;
end;

function SDL_VERSIONNUM(X,Y,Z: UInt32): Cardinal;
begin
  Result := X*1000 + Y*100 + Z;
end;

function SDL_COMPILEDVERSION: Cardinal;
begin
  Result := SDL_VERSIONNUM(SDL_MAJOR_VERSION,
                           SDL_MINOR_VERSION,
                           SDL_PATCHLEVEL);
end;

function SDL_VERSION_ATLEAST(X,Y,Z: Cardinal): Boolean;
begin
  Result := SDL_COMPILEDVERSION >= SDL_VERSIONNUM(X,Y,Z);
end;

{$IFDEF WINDOWS}
//from "sdl_thread.h"

function SDL_CreateThread(fn: TSDL_ThreadFunction; name: PAnsiChar; data: Pointer): PSDL_Thread; overload;
begin
  Result := SDL_CreateThread(fn,name,data,nil,nil);
end;

{$ENDIF}

//from "sdl_rect.h"
function SDL_RectEmpty(X: TSDL_Rect): Boolean;
begin
  Result := (X.w <= 0) or (X.h <= 0);
end;

function SDL_RectEquals(A: TSDL_Rect; B: TSDL_Rect): Boolean;
begin
  Result := (A.x = B.x) and (A.y = B.y) and (A.w = B.w) and (A.h = B.h);
end;

//from "sdl_rwops.h"

function SDL_RWsize(ctx: PSDL_RWops): SInt64;
begin
  Result := ctx^.size(ctx);
end;

function SDL_RWseek(ctx: PSDL_RWops; offset: SInt64; whence: SInt32): SInt64;
begin
  Result := ctx^.seek(ctx,offset,whence);
end;

function SDL_RWtell(ctx: PSDL_RWops): SInt64;
begin
  Result := ctx^.seek(ctx, 0, RW_SEEK_CUR);
end;

function SDL_RWread(ctx: PSDL_RWops; ptr: Pointer; size: size_t; n: size_t): size_t;
begin
  Result := ctx^.read(ctx, ptr, size, n);
end;

function SDL_RWwrite(ctx: PSDL_RWops; ptr: Pointer; size: size_t; n: size_t): size_t;
begin
  Result := ctx^.write(ctx, ptr, size, n);
end;

function SDL_RWclose(ctx: PSDL_RWops): SInt32;
begin
  Result := ctx^.close(ctx);
end;

//from "sdl_pixels.h"

function SDL_PIXELFLAG(X: Cardinal): Boolean;
begin
  Result := (X shr 28) = $0F;
end;

function SDL_PIXELTYPE(X: Cardinal): Boolean;
begin
  Result := (X shr 24) = $0F;
end;

function SDL_PIXELORDER(X: Cardinal): Boolean;
begin
  Result := (X shr 20) = $0F;
end;

function SDL_PIXELLAYOUT(X: Cardinal): Boolean;
begin
  Result := (X shr 16) = $0F;
end;

function SDL_BITSPERPIXEL(X: Cardinal): Boolean;
begin
  Result := (X shr 8) = $FF;
end;

function SDL_IsPixelFormat_FOURCC(format: Variant): Boolean;
begin
  {* The flag is set to 1 because 0x1? is not in the printable ASCII range *}
  Result := format and SDL_PIXELFLAG(format) <> 1;
end;

//from "sdl_surface.h"
function SDL_LoadBMP(_file: PAnsiChar): PSDL_Surface;
begin
  Result := SDL_LoadBMP_RW(SDL_RWFromFile(_file, 'rb'), 1);
end;

//from "sdl_video.h"
function SDL_WindowPos_IsUndefined(X: Variant): Variant;
begin
  Result := (X and $FFFF0000) = SDL_WINDOWPOS_UNDEFINED_MASK;
end;

function SDL_WindowPos_IsCentered(X: Variant): Variant;
begin
  Result := (X and $FFFF0000) = SDL_WINDOWPOS_CENTERED_MASK;
end;

//from "sdl_events.h"

function SDL_GetEventState(type_: UInt32): UInt8;
begin
  Result := SDL_EventState(type_, SDL_QUERY);
end;

end.
/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _LUASPELL_H
#define _LUASPELL_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

#include "../spell.h"


class CLuaSpell
{
	CSpell *m_PLuaSpell;
public:

	static const int8 className[];
	static Lunar<CLuaSpell>::Register_t methods[];

	CLuaSpell(lua_State*);
	CLuaSpell(CSpell*);

	CSpell* GetSpell() const
	{
		return m_PLuaSpell;
	}

    int32 setMsg(lua_State*);
};

#endif
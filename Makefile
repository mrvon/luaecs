LUA_INC=-I /usr/local/include
LUA_LIB=-L /usr/local/lib -llua

CFLAGS=-O2 -Wall
SHARED=--shared -fPIC

all : ecs.so

ecs.so : luaecs.c ecs_group.c ecs_persistence.c ecs_template.c ecs_capi.c ecs_entityid.c ecs_cache.c
	gcc $(CFLAGS) $(SHARED) -DTEST_LUAECS -o $@ $^ $(LUA_INC) $(LUA_LIB)

clean :
	rm -f ecs.so


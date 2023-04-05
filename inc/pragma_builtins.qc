// DO. NOT. EDIT.
// builtin functions and their constants too

/*
=================
void print(float printlevel, string text)
prints text 
=================
*/
void(float printlevel, string str) print = #1; //void print(float,string)

/*
=================
entity spawn()
creates a new server entity
=================
*/
entity() spawn = #2; //entity spawn()

/*
=================
void remove(entity)
removes entity from game
=================
*/
void(entity ent) remove = #3; //void remove(entity)

/*
=================
float random()
returns a random number in range [-1.0,1.0]
=================
*/
float() random = #4; //float random()

/*
=================
float sin(float)
=================
*/
float(float var) sin = #5; //float sin(float)

/*
=================
float cos(float)
=================
*/
float(float var) cos = #6; //float cos(float)

/*
=================
float sqrt(float)
=================
*/
float(float var) sqrt = #7; //float sqrt(float)

/*
=================
float rint(float)
rounds given number to an integral value
=================
*/
float(float var) rint = #8; //float rint(float)

/*
=================
float floor(float)
returns the largest integer value less than or equal to argument
=================
*/
float(float var) floor = #9; //float floor(float)

/*
=================
float ceil(float)
computes the nearest integer greater than the argument passed
=================
*/
float(float var) ceil = #10; //float ceil(float)

/*
=================
float fabs(float)
returns the absolute value of a number
=================
*/
float(float var) fabs = #11;  //float fabs(float)

/*
=================
void anglevectors(vector)
calculates front, up and right vectors
they are keept in globals in v_forward, v_up, v_right
=================
*/
void(vector vec) anglevectors = #12; //void anglevectors(vector)

/*
=================
float vectoyaw(vector)
converts a directional vector into a yaw angle (only the _y component of an angles set) 
=================
*/
float(vector vec) vectoyaw = #13; //float vectoyaw(vector)

/*
=================
vector vectongles(vector)
calculates the pitch angle (aiming) and yaw angle (bearing) corresponding to a given 3D direction
returns vector 'pitch yaw 0' 
=================
*/
vector(vector vec) vectoangles = #14; //vector vectongles(vector)

/*
=================
vector vnormalize(vector)
returns normalized vector
=================
*/
vector(vector vec) vnormalize = #15; //vector vnormalize(vector)

/*
=================
float vlen(vector)
returns length of a vector
=================
*/
float(vector vec) vlen = #16; //float vlen(vector)

/*
=================
string ftos(float)
returns float as string
=================
*/
string(float vec) ftos = #17; //string ftos(float)

/*
=================
string vtos(vector)
returns vector as string
=================
*/
string(vector vec) vtos = #18; //string vtos(vector)


/*
=================
void error(string)
causes terminal server error
=================
*/
void(string str) error = #19; //void error(string)

/*
=================
void objerror(string)
causes server error, removes current 'self' entity and continues
=================
*/
void(string str) objerror = #20; //void objerror(string)

/*
=================
void dprint(string)
prints text only in developer mode
=================
*/
void(string str) dprint = #21; //void dprint(string)

/*
=================
void setmodel(entity,string)
sets entity model and updates its size
=================
*/
void(entity ent, string str) setmodel = #22; //void setmodel(entity,string)

/*
=================
float pointcontents(vector)
returns the contents of given point, see CONTENTS_ flags in inc/shared.qc
=================
*/
float(vector vec) pointcontents = #23; //float pointcontents(vector)

/*
=================
void trace(vector, vector, vector, vector, entity, float)
Does a collision trace between points and fills trace_* globals.

start/end - vectors of trace
bmins/bmaxs - the bbox of trace object
passent - the object to ignore collision with
contentmask - what to collide with
=================
*/
float(vector start, vector bmins, vector bmaxs, vector end, entity passent, float contentmask) trace = #24; //void trace(vector, vector, vector, vector, entity, float)

/*
=================
void traceline(vector, vector, entity, float)
Does a simple line collision trace between points and fills trace_* globals.

start/end - vectors of trace
passent - the object to ignore collision with
contentmask - what to collide with
=================
*/
float(vector start, vector end, entity passent, float contentmask) traceline = #25; //void tracelinne(vector, vector, entity, float)


/*
=================
string cvar(string)
=================
*/
string(string cvar) cvar = #26; //string cvar(string)

/*
=================
float cvar_asfloat(string)
=================
*/
float(string cvar) cvar_asfloat = #28; //float cvar_asfloat(string)

/*
=================
float cvar_asvector(string)
=================
*/
vector(string cvar) cvar_asvector = #29; //vector cvar_asvector(string)

/*
=================
void cvar_set(string, string)
returns true if change is possible
=================
*/
void(string cvar, string str) cvar_set = #30; //void cvar_set(string, string)

/*
=================
void cvar_float(string, flost)
=================
*/
void(string cvar, float f) cvar_float = #31; //void cvar_float(string, float)

/*
=================
void cvar_vec(string, vector)
=================
*/
void(string cvar, vector vec) cvar_vec = #32; //void cvar_vec(string, vector)

/*
=================
void setsize(entity, vector, vector)
this is done in setmodel too
=================
*/
void(entity ent, vector bmins, vector bmaxs) setsize = #33; //void setsize(entity, vector, vector)

/*
=================
float modelindex(string)
=================
*/
float(string fname) modelindex = #34; //float modelindex(string)

/*
=================
void setmodelindex(entity,float)
same as setmodel, but takes modelindex instead of model name as arg
=================
*/
void(entity ent, float index) setmodelindex = #35; //void setmodelindex(entity,float)
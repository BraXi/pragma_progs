// DO. NOT. EDIT.
// builtin functions

// precache
float(string fname) modelindex = #1; //float modelindex(string)
float(string fname) soundindex = #2; //float soundindex(string)
float(string fname) imageindex = #3; //float imageindex(string)

//entity(string class_name) callspawn = #4; //entity callspawn(string)
entity() spawn = #4; //entity spawn()
void(entity ent) remove = #5; //void remove(entity)

//prints and errors
void(float printlevel, string str) bprint = #6; //void print(float,string)
void(string str) dprint = #7; //void dprint(string)
void(entity ent, float printlevel, string str) cprint = #8; //void cprint(entity,float,string)
void(entity ent, string str) centerprint = #9; //void centerprint(entity,string)
void(string str) print = #10; //void error(string)
void(string str) error = #11; //void error(string)
void(string str) objerror = #11; //void objerror(string)

//math
float(float v) random = #12; //float random(float)
float(float var) sin = #13; //float sin(float)
float(float var) cos = #14; //float cos(float)
float(float var) sqrt = #15; //float sqrt(float)
float(float var) rint = #16; //float rint(float)
float(float var) floor = #17; //float floor(float)
float(float var) ceil = #18; //float ceil(float)
float(float var) fabs = #19;  //float fabs(float)

//vectors
void(vector vec) anglevectors = #20; //void anglevectors(vector)
float(vector vec) vectoyaw = #21; //float vectoyaw(vector)
vector(vector vec) vectoangles = #22; //vector vectongles(vector)
vector(vector vec) vnormalize = #23; //vector vnormalize(vector)
float(vector vec) vlen = #24; //float vlen(vector)

//strings
string(float vec) ftos = #25; //string ftos(float)
string(vector vec) vtos = #26; //string vtos(vector)

//collision
float(vector vec) pointcontents = #27; //float pointcontents(vector)
float(vector start, vector bmins, vector bmaxs, vector end, entity passent, float contentmask) trace = #28; //void trace(vector, vector, vector, vector, entity, float)
float(vector start, vector end, entity passent, float contentmask) traceline = #29; //void tracelinne(vector, vector, entity, float)

//cvars
float(string cvar) getcvarfloat = #30; //float getcvarfloat(string)
void(string cvar, string str) setcvar = #31; //void cvar_set(string, string)

// sound
void(entity ent, float channel, float sndIndex, float volume, float attenuation, float timeofs) playsound = #32; //void playsound(entity, float, float, float, float, float)
void(entity ent, float channel, float sndIndex, float volume, float attenuation, float timeofs) playlocalsound = #33; //void playlocalsound(entity, float, float, float, float, float)
//void(entity ent) stopsounds = #34; //void stopsound(entityt)

// animations
float(string animName) anim_find = #34; //float anim_find(string)
float(string animName, float firstframe, float lastframe) anim_build = #35; //float anim_build(string, float, float)
void(entity ent, float animIndex) anim_play = #36; //void anim_play(entity, string)
void(entity ent) anim_stop = #37; //void anim_stop(entity)
void(entity ent, float stop) anim_pause = #38; //void anim_pause(entity, float)
void(float animindex, float aevent, float aframe) anim_addevent = #39; //void anim_addevent(float, float, float)
void(entity ent, float frame) anim_setframe = #40; //void anim_setframe(entity, float)

// common
void(entity ent, string str) setmodel = #41; //void setmodel(entity,string)
void(entity ent, float index) setmodelindex = #42; //void setmodelindex(entity,float)
void(entity ent, vector bmins, vector bmaxs) setsize = #43; //void setsize(entity, vector, vector)
void(entity ent, vector pos) setorigin = #44; //void setsize(entity, vector)
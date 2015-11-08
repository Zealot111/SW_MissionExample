#define HASHKEYS(h) ((h) select 0)

#define HASHINIT(h) ((h)=[[],[]])

#define HASHHASKEY(h,k)	\
	([true,false] select ((h) select 0 find (k) == -1))

#define HASHSET(h,k,v) \
	(if (!HASHHASKEY(h,k)) then [{(h) select 0 pushback (k);(h) select 1 pushback (v);},{(h) select 1 set [(h) select 0 find (k),(v)];}];(h))

#define HASHGET(h,k) \
	(if !(HASHINKEYS(h,k)) then [{nil},{(h) select 1 select ((h) select 0 find (k))}])





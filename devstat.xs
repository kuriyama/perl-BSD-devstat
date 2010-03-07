#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#ifdef __cplusplus
}
#endif
#include <devstat.h>

struct YourType {
	int	num;
	struct statinfo	*info;
};
typedef struct YourType	YourType;


#define XS_STATE(type, x) \
    INT2PTR(type, SvROK(x) ? SvIV(SvRV(x)) : SvIV(x))

#define XS_STRUCT2OBJ(sv, class, obj) \
    if (obj == NULL) { \
        sv_setsv(sv, &PL_sv_undef); \
    } else { \
        sv_setref_pv(sv, class, (void *) obj); \
    }

YourType*
your_type_new(void)
{
	kvm_t	*kd = NULL;
	YourType* p = malloc(sizeof(YourType));
	p->num = devstat_getnumdevs(kd);
	p->info = malloc(sizeof(struct statinfo) * p->num);
	devstat_getdevs(kd, p->info);
}

void
your_type_free(YourType *self)
{
	if (self && self->info) {
		free(self->info);
	}
	if (self) {
		free(self);
	}
}

MODULE = BSD::devstat  PACKAGE = BSD::devstat

YourType*
BSD::devstat::new()
CODE:
    YourType* self = your_type_new();
    RETVAL = self;
OUTPUT:
    RETVAL

void
DESTROY(YourType* self)
CODE:
    your_type_free(self);

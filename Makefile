ifeq ($(KERNELRELEASE),)
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	rm -f hellokernel.h

else

KERNEL_HEADER = $(shell echo "${LINUXINCLUDE}" | grep -ohE '\-I[^ ]+' | sed -e 's/-I/-isystem /')

%.o: %.zig
	cd ${PWD} && zig build-obj \
		--library c \
		-isystem . \
		${KERNEL_HEADER} \
		--release-fast $< --cache-dir $(dir $@)/zig-cache

hellokernel.h: hellokernel.o

obj-m += zig.o
zig-y += hellokernel.o module.o
endif

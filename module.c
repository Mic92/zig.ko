// SPDX-License-Identifier: GPL-2.0
/*
 * Copyright (C) 2019 Jörg Thalheim <joerg@thalheim.io>. All Rights Reserved.
 */

#include <linux/module.h>

MODULE_LICENSE("GPL");

#include "hellokernel.h"

static int __init _init_hellokernel(void) {
  return init_hellokernel();
}
module_init(_init_hellokernel);

static void __exit _exit_hellokernel(void) {
  exit_hellokernel();
}
module_exit(_exit_hellokernel);


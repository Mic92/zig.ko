// SPDX-License-Identifier: GPL-2.0
//
// Copyright (C) 2019 Jörg Thalheim <joerg@thalheim.io>. All Rights Reserved.
//

const c = @cImport(@cInclude("printk.h"));

export fn init_hellokernel() c_int {
    c.printk(c"Hello kernel!\n");
    return 0;
}

export fn exit_hellokernel() void {
    c.printk(c"Goodbye kernel!\n");
}

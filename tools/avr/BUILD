package(default_visibility = ['//visibility:public'])

filegroup(
  name = 'ar',
  srcs = [
    'avr8-gnu-toolchain-linux_x86_64/bin/avr-ar',
  ],
)

filegroup(
  name = 'as',
  srcs = [
    'avr8-gnu-toolchain-linux_x86_64/bin/avr-as',
  ],
)

filegroup(
  name = 'gcc',
  srcs = [
    'avr8-gnu-toolchain-linux_x86_64/bin/avr-gcc',
  ],
)

filegroup(
  name = 'ld',
  srcs = [
    'avr8-gnu-toolchain-linux_x86_64/bin/avr-ld',
  ],
)

filegroup(
  name = 'nm',
  srcs = [
    'avr8-gnu-toolchain-linux_x86_64/bin/avr-gcc-nm',
  ],
)

filegroup(
  name = 'objcopy',
  srcs = [
    'avr8-gnu-toolchain-linux_x86_64/bin/avr-objcopy',
  ],
)

filegroup(
  name = 'objdump',
  srcs = [
    'avr8-gnu-toolchain-linux_x86_64/bin/avr-objdump',
  ],
)

filegroup(
  name = 'size',
  srcs = [
    'avr8-gnu-toolchain-linux_x86_64/bin/avr-size',
  ],
)

filegroup(
  name = 'strip',
  srcs = [
    'avr8-gnu-toolchain-linux_x86_64/bin/avr-strip',
  ],
)


filegroup(
  name = 'compiler_pieces',
  srcs = glob([
    'avr8-gnu-toolchain-linux_x86_64/avr/include/**',
    'avr8-gnu-toolchain-linux_x86_64/avr/lib/**',
    'avr8-gnu-toolchain-linux_x86_64/include/**',
    'avr8-gnu-toolchain-linux_x86_64/lib/gcc/avr/**',
    'avr8-gnu-toolchain-linux_x86_64/libexec/gcc/avr/**',
    'avr8-gnu-toolchain-linux_x86_64/x86_64-pc-linux-gnu/**',
  ]),
)

filegroup(
  name = 'compiler_components',
  srcs = [
    ':ar',
    ':as',
    ':gcc',
    ':ld',
    ':nm',
    ':objcopy',
    ':objdump',
    ':size',
    ':strip',
  ],
)

filegroup(
  name = 'avr_gcc_all_files',
  srcs = [
    ':compiler_pieces',
    ':compiler_components',
  ],
)

filegroup(
  name = 'avr_gcc_linker_files',
  srcs = [
    ':gcc',
    ':ld',
    ':ar',
    ':compiler_pieces',
  ],
)

filegroup(
  name = 'avr_gcc_compiler_files',
  srcs = [
    ':gcc',
    ':ld',
    ':as',
  ],
)

cc_toolchain_suite(
  name = 'toolchain',
  toolchains = {
    'avr|gcc': ':cc-compiler-avr-gcc',
  },
)

cc_toolchain(
  name = 'cc-compiler-avr-gcc',
  all_files = ':avr_gcc_all_files',
  compiler_files = ':avr_gcc_compiler_files',
  cpu = 'avr',
  dwp_files = ':empty',
  dynamic_runtime_libs = [':empty'],
  linker_files = ':avr_gcc_linker_files',
  objcopy_files = ':objcopy',
  static_runtime_libs = [':empty'],
  strip_files = ':strip',
  supports_param_files = 1,
)


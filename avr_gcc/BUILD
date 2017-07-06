package(default_visibility = ['//visibility:public'])

filegroup(
  name = 'ar',
  srcs = [
    'bin/avr-ar',
  ],
)

filegroup(
  name = 'as',
  srcs = [
    'bin/avr-as',
  ],
)

filegroup(
  name = 'gcc',
  srcs = [
    'bin/avr-gcc',
  ],
)

filegroup(
  name = 'ld',
  srcs = [
    'bin/avr-ld',
  ],
)

filegroup(
  name = 'nm',
  srcs = [
    'bin/avr-gcc-nm',
  ],
)

filegroup(
  name = 'objcopy',
  srcs = [
    'bin/avr-objcopy',
  ],
)

filegroup(
  name = 'objdump',
  srcs = [
    'bin/avr-objdump',
  ],
)

filegroup(
  name = 'size',
  srcs = [
    'bin/avr-size',
  ],
)

filegroup(
  name = 'strip',
  srcs = [
    'bin/avr-strip',
  ],
)


filegroup(
  name = 'compiler_pieces',
  srcs = glob([
    'avr/**',
    'lib/gcc/avr/**',
    'lib/ldscripts/**',
    'libexec/gcc/avr/**',
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


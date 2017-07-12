def _avrdude_impl(ctx):
    output = ctx.outputs.out
    input = ctx.file.src
    ctx.action(
        inputs=[
                input,
                ctx.executable._avrdude,
                ctx.executable._size
        ],
        outputs = [output],
        progress_message = "Creating code and data HEX file from %s" % input.short_path,
        command="%s -j .text -j .data -O ihex %s %s; %s --format=avr -C --mcu=%s %s" % ( \
                ctx.executable._objcopy.path, 
                input.path, 
                output.path, 
                ctx.executable._size.path, 
                ctx.var["MCU"], 
                input.path
         )
    )


avrdude = rule(
    implementation=_avrdude_impl,
    attrs={
        "flash_hex": attr.label(mandatory=True, allow_files=True, single_file=True),
        "eeprom_hex": attr.label(mandatory=False, allow_files=True, single_file=True),
        "_avrdude_conf": attr.label(
                allow_files=True,
                single_file=True,
                executable=True,
                cfg="host",
                default=Label("@avr_tools//avrdude:avrdude_config")
        ),
        "_avrdude": attr.label(
                allow_files=True,
                single_file=True,
                executable=True,
                cfg="host",
                default=Label("@avr_tools//avrdude:avrdude")
        ),
    },
    outputs={"out": "%{flash_hex}.log"},
)




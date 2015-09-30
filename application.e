note
	description : "testProject application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		external
			"C inline"
		alias
			"{
				asm ( 	
						"mov $len, %edx\n"
						"mov $msg, %ecx\n"
						"mov $1, %ebx\n"
						"mov $4, %eax\n"
						"int $0x80\n"
						"mov $0, %ebx\n"
						"mov $1, %eax\n"
						"int $0x80\n"
						"msg: .ascii \"Hello World!\\12\\0\"\n"
						".set len, .-msg"
				);

			}"
		end

end

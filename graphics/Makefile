logo_data.h: template/splash_header.c splash_vals.c template/splash_footer.c
	cat template/splash_header.c splash_vals.c template/splash_footer.c >logo_data.h

splash_vals.c: splash.uyvy
	hexdump -v -e '16/1 "0x%02X," "\n"' splash.uyvy >splash_vals.c

splash.uyvy: splash.png
	convert splash.png splash.uyvy

splash.png: splash.svg
	convert splash.svg -resize 720x480 splash.png

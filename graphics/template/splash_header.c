#define YUV_LOGO_BGCOLOR 0x00800080  // background color in YUYV format

static unsigned int yuv_logo_width = 720;
static unsigned int yuv_logo_height = 480;
static unsigned int yuv_logo_offset_x = 0;
static unsigned int yuv_logo_offset_y = 0;

static unsigned int yuv_logo_bytepp = 2;
/* Stride is a product of the width and bytes per pixel, assuming
 * the image itself is not padded.
 */
static unsigned int yuv_logo_stride = 2 * 720;

/* Conversion steps for converting png to array below:
 *    convert -extract 320x160+480+288 s01.png s01_e.uyvy
 *    hexdump -v -e '16/1 "0x%02X," "\n"' s01_e.uyvy > s01_e.c
 *
 *    Note: width/height/offsets above vary with source png image.
 */
static unsigned char yuv_logo[] = {

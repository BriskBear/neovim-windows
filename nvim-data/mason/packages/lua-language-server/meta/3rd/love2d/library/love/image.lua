---@meta

---
---Provides an interface to decode encoded image data.
---
---
---[Open in Browser](https://love2d.org/wiki/love.image)
---
---@class love.image
love.image = {}

---
---Determines whether a file can be loaded as CompressedImageData.
---
---
---[Open in Browser](https://love2d.org/wiki/love.image.isCompressed)
---
---@overload fun(fileData: love.FileData):boolean
---@param filename string # The filename of the potentially compressed image file.
---@return boolean compressed # Whether the file can be loaded as CompressedImageData or not.
function love.image.isCompressed(filename) end

---
---Create a new CompressedImageData object from a compressed image file. LÖVE supports several compressed texture formats, enumerated in the CompressedImageFormat page.
---
---
---[Open in Browser](https://love2d.org/wiki/love.image.newCompressedData)
---
---@overload fun(fileData: love.FileData):love.CompressedImageData
---@param filename string # The filename of the compressed image file.
---@return love.CompressedImageData compressedImageData # The new CompressedImageData object.
function love.image.newCompressedData(filename) end

---
---Creates a new ImageData object.
---
---
---[Open in Browser](https://love2d.org/wiki/love.image.newImageData)
---
---@overload fun(width: number, height: number, format?: love.PixelFormat, data?: string):love.ImageData
---@overload fun(width: number, height: number, data: string):love.ImageData
---@overload fun(filename: string):love.ImageData
---@overload fun(filedata: love.FileData):love.ImageData
---@param width number # The width of the ImageData.
---@param height number # The height of the ImageData.
---@return love.ImageData imageData # The new blank ImageData object. Each pixel's color values, (including the alpha values!) will be set to zero.
function love.image.newImageData(width, height) end

---
---Represents compressed image data designed to stay compressed in RAM.
---
---CompressedImageData encompasses standard compressed texture formats such as  DXT1, DXT5, and BC5 / 3Dc.
---
---You can't draw CompressedImageData directly to the screen. See Image for that.
---
---
---[Open in Browser](https://love2d.org/wiki/love.image)
---
---@class love.CompressedImageData: love.Data, love.Object
local CompressedImageData = {}

---
---Gets the width and height of the CompressedImageData.
---
---
---[Open in Browser](https://love2d.org/wiki/CompressedImageData:getDimensions)
---
---@overload fun(self: love.CompressedImageData, level: number):number, number
---@return number width # The width of the CompressedImageData.
---@return number height # The height of the CompressedImageData.
function CompressedImageData:getDimensions() end

---
---Gets the format of the CompressedImageData.
---
---
---[Open in Browser](https://love2d.org/wiki/CompressedImageData:getFormat)
---
---@return love.CompressedImageFormat format # The format of the CompressedImageData.
function CompressedImageData:getFormat() end

---
---Gets the height of the CompressedImageData.
---
---
---[Open in Browser](https://love2d.org/wiki/CompressedImageData:getHeight)
---
---@overload fun(self: love.CompressedImageData, level: number):number
---@return number height # The height of the CompressedImageData.
function CompressedImageData:getHeight() end

---
---Gets the number of mipmap levels in the CompressedImageData. The base mipmap level (original image) is included in the count.
---
---
---[Open in Browser](https://love2d.org/wiki/CompressedImageData:getMipmapCount)
---
---@return number mipmaps # The number of mipmap levels stored in the CompressedImageData.
function CompressedImageData:getMipmapCount() end

---
---Gets the width of the CompressedImageData.
---
---
---[Open in Browser](https://love2d.org/wiki/CompressedImageData:getWidth)
---
---@overload fun(self: love.CompressedImageData, level: number):number
---@return number width # The width of the CompressedImageData.
function CompressedImageData:getWidth() end

---
---Raw (decoded) image data.
---
---You can't draw ImageData directly to screen. See Image for that.
---
---
---[Open in Browser](https://love2d.org/wiki/love.image)
---
---@class love.ImageData: love.Data, love.Object
local ImageData = {}

---
---Encodes the ImageData and optionally writes it to the save directory.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageData:encode)
---
---@overload fun(self: love.ImageData, outFile: string)
---@overload fun(self: love.ImageData, outFile: string, format: love.ImageFormat)
---@param format love.ImageFormat # The format to encode the image as.
---@param filename? string # The filename to write the file to. If nil, no file will be written but the FileData will still be returned.
---@return love.FileData filedata # The encoded image as a new FileData object.
function ImageData:encode(format, filename) end

---
---Gets the width and height of the ImageData in pixels.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageData:getDimensions)
---
---@return number width # The width of the ImageData in pixels.
---@return number height # The height of the ImageData in pixels.
function ImageData:getDimensions() end

---
---Gets the height of the ImageData in pixels.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageData:getHeight)
---
---@return number height # The height of the ImageData in pixels.
function ImageData:getHeight() end

---
---Gets the color of a pixel at a specific position in the image.
---
---Valid x and y values start at 0 and go up to image width and height minus 1. Non-integer values are floored.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageData:getPixel)
---
---@param x number # The position of the pixel on the x-axis.
---@param y number # The position of the pixel on the y-axis.
---@return number r # The red component (0-1).
---@return number g # The green component (0-1).
---@return number b # The blue component (0-1).
---@return number a # The alpha component (0-1).
function ImageData:getPixel(x, y) end

---
---Gets the width of the ImageData in pixels.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageData:getWidth)
---
---@return number width # The width of the ImageData in pixels.
function ImageData:getWidth() end

---
---Transform an image by applying a function to every pixel.
---
---This function is a higher-order function. It takes another function as a parameter, and calls it once for each pixel in the ImageData.
---
---The passed function is called with six parameters for each pixel in turn. The parameters are numbers that represent the x and y coordinates of the pixel and its red, green, blue and alpha values. The function should return the new red, green, blue, and alpha values for that pixel.
---
---function pixelFunction(x, y, r, g, b, a)
---
---    -- template for defining your own pixel mapping function
---
---    -- perform computations giving the new values for r, g, b and a
---
---    -- ...
---
---    return r, g, b, a
---
---end
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageData:mapPixel)
---
---@param pixelFunction function # Function to apply to every pixel.
---@param x? number # The x-axis of the top-left corner of the area within the ImageData to apply the function to.
---@param y? number # The y-axis of the top-left corner of the area within the ImageData to apply the function to.
---@param width? number # The width of the area within the ImageData to apply the function to.
---@param height? number # The height of the area within the ImageData to apply the function to.
function ImageData:mapPixel(pixelFunction, x, y, width, height) end

---
---Paste into ImageData from another source ImageData.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageData:paste)
---
---@param source love.ImageData # Source ImageData from which to copy.
---@param dx number # Destination top-left position on x-axis.
---@param dy number # Destination top-left position on y-axis.
---@param sx number # Source top-left position on x-axis.
---@param sy number # Source top-left position on y-axis.
---@param sw number # Source width.
---@param sh number # Source height.
function ImageData:paste(source, dx, dy, sx, sy, sw, sh) end

---
---Sets the color of a pixel at a specific position in the image.
---
---Valid x and y values start at 0 and go up to image width and height minus 1.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageData:setPixel)
---
---@param x number # The position of the pixel on the x-axis.
---@param y number # The position of the pixel on the y-axis.
---@param r number # The red component (0-1).
---@param g number # The green component (0-1).
---@param b number # The blue component (0-1).
---@param a number # The alpha component (0-1).
function ImageData:setPixel(x, y, r, g, b, a) end

---
---Gets the pixel format of the ImageData.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageData:getFormat)
---
---@return love.PixelFormat format # The pixel format the ImageData was created with.
function ImageData:getFormat() end

---
---Compressed image data formats. Here and here are a couple overviews of many of the formats.
---
---Unlike traditional PNG or jpeg, these formats stay compressed in RAM and in the graphics card's VRAM. This is good for saving memory space as well as improving performance, since the graphics card will be able to keep more of the image's pixels in its fast-access cache when drawing it.
---
---
---[Open in Browser](https://love2d.org/wiki/CompressedImageFormat)
---
---@alias love.CompressedImageFormat
---
---The DXT1 format. RGB data at 4 bits per pixel (compared to 32 bits for ImageData and regular Images.) Suitable for fully opaque images on desktop systems.
---
---| "DXT1"
---
---The DXT3 format. RGBA data at 8 bits per pixel. Smooth variations in opacity do not mix well with this format.
---
---| "DXT3"
---
---The DXT5 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on desktop systems.
---
---| "DXT5"
---
---The BC4 format (also known as 3Dc+ or ATI1.) Stores just the red channel, at 4 bits per pixel.
---
---| "BC4"
---
---The signed variant of the BC4 format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.
---
---| "BC4s"
---
---The BC5 format (also known as 3Dc or ATI2.) Stores red and green channels at 8 bits per pixel.
---
---| "BC5"
---
---The signed variant of the BC5 format.
---
---| "BC5s"
---
---The BC6H format. Stores half-precision floating-point RGB data in the range of 65504 at 8 bits per pixel. Suitable for HDR images on desktop systems.
---
---| "BC6h"
---
---The signed variant of the BC6H format. Stores RGB data in the range of +65504.
---
---| "BC6hs"
---
---The BC7 format (also known as BPTC.) Stores RGB or RGBA data at 8 bits per pixel.
---
---| "BC7"
---
---The ETC1 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on older Android devices.
---
---| "ETC1"
---
---The RGB variant of the ETC2 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on newer mobile devices.
---
---| "ETC2rgb"
---
---The RGBA variant of the ETC2 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on newer mobile devices.
---
---| "ETC2rgba"
---
---The RGBA variant of the ETC2 format where pixels are either fully transparent or fully opaque. RGBA data at 4 bits per pixel.
---
---| "ETC2rgba1"
---
---The single-channel variant of the EAC format. Stores just the red channel, at 4 bits per pixel.
---
---| "EACr"
---
---The signed single-channel variant of the EAC format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.
---
---| "EACrs"
---
---The two-channel variant of the EAC format. Stores red and green channels at 8 bits per pixel.
---
---| "EACrg"
---
---The signed two-channel variant of the EAC format.
---
---| "EACrgs"
---
---The 2 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 2 bits per pixel. Textures compressed with PVRTC1 formats must be square and power-of-two sized.
---
---| "PVR1rgb2"
---
---The 4 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 4 bits per pixel.
---
---| "PVR1rgb4"
---
---The 2 bit per pixel RGBA variant of the PVRTC1 format.
---
---| "PVR1rgba2"
---
---The 4 bit per pixel RGBA variant of the PVRTC1 format.
---
---| "PVR1rgba4"
---
---The 4x4 pixels per block variant of the ASTC format. RGBA data at 8 bits per pixel.
---
---| "ASTC4x4"
---
---The 5x4 pixels per block variant of the ASTC format. RGBA data at 6.4 bits per pixel.
---
---| "ASTC5x4"
---
---The 5x5 pixels per block variant of the ASTC format. RGBA data at 5.12 bits per pixel.
---
---| "ASTC5x5"
---
---The 6x5 pixels per block variant of the ASTC format. RGBA data at 4.27 bits per pixel.
---
---| "ASTC6x5"
---
---The 6x6 pixels per block variant of the ASTC format. RGBA data at 3.56 bits per pixel.
---
---| "ASTC6x6"
---
---The 8x5 pixels per block variant of the ASTC format. RGBA data at 3.2 bits per pixel.
---
---| "ASTC8x5"
---
---The 8x6 pixels per block variant of the ASTC format. RGBA data at 2.67 bits per pixel.
---
---| "ASTC8x6"
---
---The 8x8 pixels per block variant of the ASTC format. RGBA data at 2 bits per pixel.
---
---| "ASTC8x8"
---
---The 10x5 pixels per block variant of the ASTC format. RGBA data at 2.56 bits per pixel.
---
---| "ASTC10x5"
---
---The 10x6 pixels per block variant of the ASTC format. RGBA data at 2.13 bits per pixel.
---
---| "ASTC10x6"
---
---The 10x8 pixels per block variant of the ASTC format. RGBA data at 1.6 bits per pixel.
---
---| "ASTC10x8"
---
---The 10x10 pixels per block variant of the ASTC format. RGBA data at 1.28 bits per pixel.
---
---| "ASTC10x10"
---
---The 12x10 pixels per block variant of the ASTC format. RGBA data at 1.07 bits per pixel.
---
---| "ASTC12x10"
---
---The 12x12 pixels per block variant of the ASTC format. RGBA data at 0.89 bits per pixel.
---
---| "ASTC12x12"

---
---Encoded image formats.
---
---
---[Open in Browser](https://love2d.org/wiki/ImageFormat)
---
---@alias love.ImageFormat
---
---Targa image format.
---
---| "tga"
---
---PNG image format.
---
---| "png"
---
---JPG image format.
---
---| "jpg"
---
---BMP image format.
---
---| "bmp"

---
---Pixel formats for Textures, ImageData, and CompressedImageData.
---
---
---[Open in Browser](https://love2d.org/wiki/PixelFormat)
---
---@alias love.PixelFormat
---
---Indicates unknown pixel format, used internally.
---
---| "unknown"
---
---Alias for rgba8, or srgba8 if gamma-correct rendering is enabled.
---
---| "normal"
---
---A format suitable for high dynamic range content - an alias for the rgba16f format, normally.
---
---| "hdr"
---
---Single-channel (red component) format (8 bpp).
---
---| "r8"
---
---Two channels (red and green components) with 8 bits per channel (16 bpp).
---
---| "rg8"
---
---8 bits per channel (32 bpp) RGBA. Color channel values range from 0-255 (0-1 in shaders).
---
---| "rgba8"
---
---gamma-correct version of rgba8.
---
---| "srgba8"
---
---Single-channel (red component) format (16 bpp).
---
---| "r16"
---
---Two channels (red and green components) with 16 bits per channel (32 bpp).
---
---| "rg16"
---
---16 bits per channel (64 bpp) RGBA. Color channel values range from 0-65535 (0-1 in shaders).
---
---| "rgba16"
---
---Floating point single-channel format (16 bpp). Color values can range from [-65504, +65504].
---
---| "r16f"
---
---Floating point two-channel format with 16 bits per channel (32 bpp). Color values can range from [-65504, +65504].
---
---| "rg16f"
---
---Floating point RGBA with 16 bits per channel (64 bpp). Color values can range from [-65504, +65504].
---
---| "rgba16f"
---
---Floating point single-channel format (32 bpp).
---
---| "r32f"
---
---Floating point two-channel format with 32 bits per channel (64 bpp).
---
---| "rg32f"
---
---Floating point RGBA with 32 bits per channel (128 bpp).
---
---| "rgba32f"
---
---Same as rg8, but accessed as (L, L, L, A)
---
---| "la8"
---
---4 bits per channel (16 bpp) RGBA.
---
---| "rgba4"
---
---RGB with 5 bits each, and a 1-bit alpha channel (16 bpp).
---
---| "rgb5a1"
---
---RGB with 5, 6, and 5 bits each, respectively (16 bpp). There is no alpha channel in this format.
---
---| "rgb565"
---
---RGB with 10 bits per channel, and a 2-bit alpha channel (32 bpp).
---
---| "rgb10a2"
---
---Floating point RGB with 11 bits in the red and green channels, and 10 bits in the blue channel (32 bpp). There is no alpha channel. Color values can range from [0, +65024].
---
---| "rg11b10f"
---
---No depth buffer and 8-bit stencil buffer.
---
---| "stencil8"
---
---16-bit depth buffer and no stencil buffer.
---
---| "depth16"
---
---24-bit depth buffer and no stencil buffer.
---
---| "depth24"
---
---32-bit float depth buffer and no stencil buffer.
---
---| "depth32f"
---
---24-bit depth buffer and 8-bit stencil buffer.
---
---| "depth24stencil8"
---
---32-bit float depth buffer and 8-bit stencil buffer.
---
---| "depth32fstencil8"
---
---The DXT1 format. RGB data at 4 bits per pixel (compared to 32 bits for ImageData and regular Images.) Suitable for fully opaque images on desktop systems.
---
---| "DXT1"
---
---The DXT3 format. RGBA data at 8 bits per pixel. Smooth variations in opacity do not mix well with this format.
---
---| "DXT3"
---
---The DXT5 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on desktop systems.
---
---| "DXT5"
---
---The BC4 format (also known as 3Dc+ or ATI1.) Stores just the red channel, at 4 bits per pixel.
---
---| "BC4"
---
---The signed variant of the BC4 format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.
---
---| "BC4s"
---
---The BC5 format (also known as 3Dc or ATI2.) Stores red and green channels at 8 bits per pixel.
---
---| "BC5"
---
---The signed variant of the BC5 format.
---
---| "BC5s"
---
---The BC6H format. Stores half-precision floating-point RGB data in the range of 65504 at 8 bits per pixel. Suitable for HDR images on desktop systems.
---
---| "BC6h"
---
---The signed variant of the BC6H format. Stores RGB data in the range of +65504.
---
---| "BC6hs"
---
---The BC7 format (also known as BPTC.) Stores RGB or RGBA data at 8 bits per pixel.
---
---| "BC7"
---
---The ETC1 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on older Android devices.
---
---| "ETC1"
---
---The RGB variant of the ETC2 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on newer mobile devices.
---
---| "ETC2rgb"
---
---The RGBA variant of the ETC2 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on newer mobile devices.
---
---| "ETC2rgba"
---
---The RGBA variant of the ETC2 format where pixels are either fully transparent or fully opaque. RGBA data at 4 bits per pixel.
---
---| "ETC2rgba1"
---
---The single-channel variant of the EAC format. Stores just the red channel, at 4 bits per pixel.
---
---| "EACr"
---
---The signed single-channel variant of the EAC format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.
---
---| "EACrs"
---
---The two-channel variant of the EAC format. Stores red and green channels at 8 bits per pixel.
---
---| "EACrg"
---
---The signed two-channel variant of the EAC format.
---
---| "EACrgs"
---
---The 2 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 2 bits per pixel. Textures compressed with PVRTC1 formats must be square and power-of-two sized.
---
---| "PVR1rgb2"
---
---The 4 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 4 bits per pixel.
---
---| "PVR1rgb4"
---
---The 2 bit per pixel RGBA variant of the PVRTC1 format.
---
---| "PVR1rgba2"
---
---The 4 bit per pixel RGBA variant of the PVRTC1 format.
---
---| "PVR1rgba4"
---
---The 4x4 pixels per block variant of the ASTC format. RGBA data at 8 bits per pixel.
---
---| "ASTC4x4"
---
---The 5x4 pixels per block variant of the ASTC format. RGBA data at 6.4 bits per pixel.
---
---| "ASTC5x4"
---
---The 5x5 pixels per block variant of the ASTC format. RGBA data at 5.12 bits per pixel.
---
---| "ASTC5x5"
---
---The 6x5 pixels per block variant of the ASTC format. RGBA data at 4.27 bits per pixel.
---
---| "ASTC6x5"
---
---The 6x6 pixels per block variant of the ASTC format. RGBA data at 3.56 bits per pixel.
---
---| "ASTC6x6"
---
---The 8x5 pixels per block variant of the ASTC format. RGBA data at 3.2 bits per pixel.
---
---| "ASTC8x5"
---
---The 8x6 pixels per block variant of the ASTC format. RGBA data at 2.67 bits per pixel.
---
---| "ASTC8x6"
---
---The 8x8 pixels per block variant of the ASTC format. RGBA data at 2 bits per pixel.
---
---| "ASTC8x8"
---
---The 10x5 pixels per block variant of the ASTC format. RGBA data at 2.56 bits per pixel.
---
---| "ASTC10x5"
---
---The 10x6 pixels per block variant of the ASTC format. RGBA data at 2.13 bits per pixel.
---
---| "ASTC10x6"
---
---The 10x8 pixels per block variant of the ASTC format. RGBA data at 1.6 bits per pixel.
---
---| "ASTC10x8"
---
---The 10x10 pixels per block variant of the ASTC format. RGBA data at 1.28 bits per pixel.
---
---| "ASTC10x10"
---
---The 12x10 pixels per block variant of the ASTC format. RGBA data at 1.07 bits per pixel.
---
---| "ASTC12x10"
---
---The 12x12 pixels per block variant of the ASTC format. RGBA data at 0.89 bits per pixel.
---
---| "ASTC12x12"

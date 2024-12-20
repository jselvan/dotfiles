import nibabel as nib
import numpy as np
import cv2

def get_slice(im, position, axis):
    return im[*[position if x==axis else slice(None) for x in range(im.ndim)]]

def nifti_to_image(path, cursor=None):
    im = nib.load(path).get_fdata()
    if im.dtype != np.uint8:
        im = im - im.min()
        im = im / im.max()
        im = np.round(im * 255).astype(np.uint8)

    if cursor is None:
        cursor = np.round(np.array(im.shape)/2).astype(int)

    maxdim = max(im.shape)
    image = np.zeros((maxdim, maxdim*3))
    print(cursor, im.mean())
    for axis, position in enumerate(cursor):
        frame = get_slice(im, position, axis)
        x = 0
        y = maxdim*axis
        w, h= frame.shape
        image[slice(x, x + w), slice(y, y + h)] = frame
    return np.rot90(image)

def main(nii_path, png_path):
    image = nifti_to_image(nii_path)
    _, buffer = cv2.imencode(".png",image)
    buffer.tofile(png_path) 

if __name__ == '__main__':
    import sys
    nii_path = sys.argv[1]
    png_path = sys.argv[2]
    main(nii_path, png_path)


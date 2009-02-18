CXX=cl
CXXFLAGS = /nologo /DWIN32 /I"..\..\cxcore\include" /I"..\..\cv\include" \
    /I"..\..\cvaux\include" /I"..\..\ml\include" /I"..\..\otherlibs\highgui"
LINKFLAGS = /link "/libpath:..\..\lib" cxcore.lib cv.lib cvaux.lib ml.lib highgui.lib

SAMPLES = blobtrack.exe bgfg_codebook.exe bgfg_segm.exe camshiftdemo.exe contours.exe convert_cascade.exe \
    convexhull.exe delaunay.exe demhist.exe dft.exe distrans.exe \
    drawing.exe edge.exe facedetect.exe ffilldemo.exe find_obj.exe fitellipse.exe \
    houghlines.exe kalman.exe kmeans.exe image.exe inpaint.exe laplace.exe \
    letter_recog.exe lkdemo.exe minarea.exe morphology.exe motempl.exe \
    pyramid_segmentation.exe squares.exe stereo_calib.exe mushroom.exe watershed.exe

all: $(SAMPLES)

.c.exe:
    @$(CXX) $(CXXFLAGS) $< $(LINKFLAGS)

.cpp.exe:
    @$(CXX) $(CXXFLAGS) $< $(LINKFLAGS)

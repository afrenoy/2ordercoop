#!/usr/bin/env python2

import os
import numpy
import sys
import getopt
import png
import glob

def treat_generation(gfile,namepng,xsize,ysize,colors=(0,255,255)):
    (rscale,gscale,bscale)=colors
    table=numpy.zeros((xsize,ysize))
    f = open(gfile,'r')
    for line in f:
        if len(line.split())==3:
            [x,y,z]=line.split()
            value=int(z)
            table[int(x),int(y)]=value
    f.close()
    pix=[tuple(reduce(lambda x,y:x+y, [(0,(j==2)*gscale,(j==1)*bscale) for j in i])) for i in table]

    pngfile=open(namepng,'wb')
    wr=png.Writer(xsize,ysize)
    wr.write(pngfile,pix)
    pngfile.close()

def printhelp():
    name=os.path.basename(sys.argv[0])
    print name +': a script to produce a movie from an aevol simulation with dumps activated.'
    print 'You need to have ffmpeg installed and in your path.'
    print 'Usage:'
    print '\t' + name + ' -i inputname [-s firstgen] [-e lastgen] [-p patchsize] [-c color] [-k] sim1 sim2 .. simN'
    print 'or'
    print '\t' + name + ' -h'
    print 'Example:'
    print '\t' + " ./movies.py -i fitness_metabolic -p 40 -c '255 255 255' -m 0 -M 1 -s 30 -e 100 ~/myaevolsimulation"
    print 'See source code for a ful description of parameters and default values'
    exit(0)


opts, args = getopt.getopt(sys.argv[1:], "s:e:p:c:d:n:kho", ["start","end","patchsize","color","pngdir","name","keep","help","overwrite"])

start=None
end=None
patchsize=10
colors=(0,255,255)
keepinter=False
overwrite=False
pngdir='.'
moviename='movie'

for o, a in opts:
    if o=='-s' or o =='--start': # (optional) First generation to treat
        start=int(a)
    elif o=='-e' or o=='--end': # (optional) Last generation to treat
        end=int(a)
    elif o=='-p' or o=='--patchsize': # (optional) Size of each location in pixels (default 20)
        patchsize=int(a)
    elif o=='-c' or o=='--color': # (optional) Color to give to maxvalue
        if (a=='red'):
            colors=(255,0,0)
        elif (a=='green'):
            colors=(0,255,0)
        elif (a=='blue'):
            colors=(0,0,255)
        elif len(a.split())==3:
            colors=map(lambda x: int(x), a.split())
        else:
            print 'Error: unrecognized argument given to -c option'
            exit(-1)
    elif o=='-d' or o=='--pngdir': # (optional) Directory where to output the pngs
        pngdir=a
    elif o=='-n' or o=='--name': # (optional) Name of the output movies
       moviename=a 
    elif o=='-k' or o=='--keep':
        keepinter=True
    elif o=='-o' or o=='--overwrite':
        overwrite=True
    elif o=='-h' or o=='--help':
        printhelp()
    else:
        print 'Error: unrecognized option ' + o
        exit(-1)

smallestgen=1000000
biggestgen=None
warned=False

for arg in args: # If several folders are given as arguments treat all of them separatly
    first=True
    todelete=[]
    for filename in os.listdir(arg):
        ngen=int(filename.split('_').pop().split('.')[0])
        if ngen>biggestgen:
            biggestgen=ngen
        if ngen<smallestgen:
            smallestgen=ngen
        if first: # Use this first file to infer size of the grid
            mx=-1
            my=-1
            first=False
            temp=open(arg+'/%d'%ngen)
            for line in temp:
                #if len(line)<=3 or line.startswith('#'):
                #    continue
                x=int(line.split()[0])
                y=int(line.split()[0])
                if x>mx:
                    mx=x
                if y>my:
                    my=y
            temp.close()
            print "Detected x size: %d, detected y size: %d"%(mx+1,my+1)
        if (start and ngen<start) or (end and ngen>end): # do not treat generations that are not in given interval if any
            continue
        namepng=pngdir+'/%d.png'%(ngen)
        if not os.path.exists(namepng) or overwrite:
            todelete.append(namepng)
            treat_generation(arg+'/%d'%ngen,namepng,mx+1,my+1,colors)
        elif not warned:
            print ''
            print "Warning: already existing png files found, we will use them instead of re-generating. If you want to re-generate them (to use different options), you first need to delete existing png files or to use option --overwrite"
            print ''
            warned=True
    if not start:
        start=smallestgen
    if not end:
        end=biggestgen
    cmd_line_mp4="ffmpeg -framerate 15 -start_number " + str(start) + " -i " + str(pngdir) + "/%d.png -vframes " + str(end-start) + " -vcodec libx264 -s "+str((mx+1)*patchsize)+"x"+str((my+1)*patchsize)+" -sws_flags neighbor -sws_dither none -pix_fmt yuv420p -tune grain -preset veryslow " + moviename + ".mp4"
    cmd_line_webm="ffmpeg -framerate 15 -start_number " + str(start) + " -i " + str(pngdir) + "/%d.png -vframes " + str(end-start) + " -vcodec libvpx -s "+str((mx+1)*patchsize)+"x"+str((my+1)*patchsize)+" -sws_flags neighbor -sws_dither none -pix_fmt yuv420p -crf 5 " + moviename + ".webm"
    print("executing ffpmeg:\n" + cmd_line_mp4)
    os.system(cmd_line_mp4)
    print("executing ffpmeg:\n" + cmd_line_webm)
    os.system(cmd_line_webm)
    if not keepinter:
        for f in todelete:
            os.remove(f)


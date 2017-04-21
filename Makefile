dir := ${CURDIR}
matlabcmd := /Applications/MATLAB_R2016b.app/bin/matlab -nodesktop -nodisplay

movies = movie1.mp4 movie1.webm
figures = data1.pdf data2.pdf data3.pdf data1control.pdf data1relatedness.pdf data1liquid.pdf data1phenotypic.pdf data1sterile.pdf invasion1a.pdf invasion1b.pdf invasion2a.pdf invasion2b.pdf invasion3a.pdf invasion3b.pdf

all: $(movies) $(figures)

clean:
	rm -f $(movies) $(figures) graphicparamsv1.mat
	rm -rf movie-dump movie-png

graphicparamsv1.mat:
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); graphicparams; exit"

data1.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); plotexp1('$(dir)/data/exp1'); exit"

data2.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); plotexp2('$(dir)/data/exp2'); exit"

data3.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); plotexp3('$(dir)/data/exp3'); exit"

data1control.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); plotexp1control('$(dir)/data/exp1','$(dir)/data/exp1_ctl','$(dir)/data/exp1_cth'); exit"

data1relatedness.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); plotexp1relatedness('$(dir)/data/exp1.mat'); exit"

data1liquid.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); plotexp1liquid('$(dir)/data/exp1_liquid'); exit"

data1phenotypic.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); plotexp1phenotypic('$(dir)/data/exp1','$(dir)/data/exp1_phenotypic'); exit"

data1sterile.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); plotexp1sterile('$(dir)/data/exp1_sterile'); exit"

data1async.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); plotexp1async('$(dir)/data/exp1_async'); exit"

invasion1a.pdf invasion1b.pdf invasion2a.pdf invasion2b.pdf invasion3a.pdf invasion3b.pdf: graphicparamsv1.mat
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); analyzeinvasions('~/2ordercoop/data/invasion'); exit"

movie1.webm: movie-dump
	mkdir -p movie-png
	./movies.py -k -d movie-png -n movie1 movie-dump

movie1.mp4: movie1.webm;

movie-dump: data/c0.7m10-50937
	$(matlabcmd) -r "path(path,'$(dir)/code_analysis'); exptotext('$(dir)/data/c0.7m10-50937',[100 100],'movie-dump'); exit"

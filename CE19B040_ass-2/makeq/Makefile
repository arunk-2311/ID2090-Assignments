
default :
	@echo "make Output:Help";
	@echo "make list : Recursively list all files in the current directory larger than a certain size ie., n kilobytes"
	@echo "make small : Compress all those files listed as above."
	@echo "make restoreUncompress all those files listed as above back to their original form";

list :
ifeq ($(MODSIZE),)
	@echo "Using default value as 10000k"
	@echo "Files in the current directory larger than 10000 kilobytes:"
	@find -type f -size +10000k
else
	@echo "All the files in the current directory larger than "$(MODSIZE)" kilobytes"
	@find -type f -size +$(MODSIZE)k
endif

small :
ifeq ($(MODTMPFILE),)
	@echo "Error: variable MODTMPFILE not defined, unable to store the list"
else ifeq ($(MODSIZE),)
	@echo "Using default value as 10000k"
	@echo "Gzipping all the files in the current directory larger than 10000 kilobytes"
	@find -type f -size +10000k > $(MODTMPFILE)
	@for f in `cat $(MODTMPFILE)`; do \
		gzip $$f ; \
	done
else
	@echo "Gzipping all the files in the current directory larger than "$(MODSIZE)" kilobytes"
	@find -type f -size +$(MODSIZE)k > $(MODTMPFILE)
	@for f in `cat $(MODTMPFILE)`; do \
		gzip $$f ; \
	done
endif

restore :
ifeq ($(MODTMPFILE),)
	@echo "Error: variable MODTMPFILE is not defined, unable to read the list"
else
	@if [ -e $(MODTMPFILE) ] && [ -r $(MODTMPFILE) ] && [ -s $(MODTMPFILE) ] ; then \
		echo "Extracting all the compressed files" ; \
		for f in `cat $(MODTMPFILE)`; do \
			if [ -e $$f".gz" ] ; then \
				gunzip $$f".gz" ; \
			else \
				echo "Error:"$$f".gz, file does not exist" ; \
			fi ; \
		done ; \
		rm $(MODTMPFILE) ; \
	else \
		echo "Error: the file "$(MODTMPFILE)" does not exist/unreadable, run 'make small' before 'make restore'" ; \
	fi
endif

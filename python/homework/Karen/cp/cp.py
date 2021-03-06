#!/usr/bin/python

import argparse
import shutil

#input arguments
def set_parameters():
	parser = argparse.ArgumentParser()
	parser.add_argument('file_name', help='Please set file(or directory) name for copying.')
	parser.add_argument('copy_name', help='Please set new file(or directory) name.')
	parser.add_argument('-r','--recursive', action='store_true', help='Please set -r flag.')
	return parser.parse_args()

#copy file by path
def method_cp(file_name, copy_name, recursive=False):
    try:
        if recursive:
            shutil.copytree(file_name, copy_name)
        else:
		    shutil.copy(file_name, copy_name)
        return True    

    except OSError:
    	print "cp: cannot stat '{}': No such file or directory".format(file_name)
    except IOError:
    	print "cp: omitting directory '{}'".format(file_name)
    return False

if __name__ == '__main__':
	args = set_parameters()
	file_name = args.file_name
	copy_name = args.copy_name
	recursive = args.recursive
	method_cp(file_name, copy_name, recursive)

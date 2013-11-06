#!/usr/bin/python3
import os
from subprocess import call

os.chdir('./bundle');
for dir in os.listdir():
	os.chdir('./' + dir)
	call(['git', 'pull', 'origin', 'master'])
	os.chdir('../');

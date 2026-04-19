#!/bin/bash

make clean
make package THEOS_PACKAGE_SCHEME=rootless

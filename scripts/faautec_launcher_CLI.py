#!/usr/bin/env python3
# -*- coding: utf-8 -*-

if __name__ == '__main__':

    import sys, os
    sys.path.append(os.path.join(os.path.dirname(os.path.dirname(__file__)), 'FAAUTeC'))
    #os.environ['LD_LIBRARY_PATH'] = "/home/yannick/Programs/tree-puzzle-5.3.rc16/src/"
    import CLIOps

    CLIOps.start_faautec()

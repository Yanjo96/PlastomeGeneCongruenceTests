#!/usr/bin/env python3
'''
Command-line execution
'''

#####################
# IMPORT OPERATIONS #
#####################

import sys
import os

sys.path.append(os.path.join(os.path.dirname(os.path.dirname(__file__)), 'FAAUTeC'))

import FAAUTeCMain
import argparse

###############
# AUTHOR INFO #
###############

__author__ = 'Y. Hartmaring'
__copyright__ = ''
__info__ = 'FAAUTeC'
__version__ = '0.2'

#############
# DEBUGGING #
#############

#import ipdb
#ipdb.set_trace()

############
# ARGPARSE #
############

class CLI():

    def __init__(self):
        self.client()

    def client(self):

        parser = argparse.ArgumentParser(description="  --  ".join([__author__, __copyright__, __info__, __version__]))
        parser._action_groups.pop()
        required = parser.add_argument_group('required arguments')
        optional = parser.add_argument_group('optional arguments')


        ### REQUIRED ###
        required.add_argument('-a',
                            '--alignment',
                            help='absolute path to infile; infile in PHYLIP or FASTA format; Example: /path_to_input/test.phy',
                            required=True)

        required.add_argument('-c',
                            '--constraint',
                            help='absolute path to constraint file; infile in NEWICK format; Example: /path_to_input/tree.tre',
                            required=True)

        ### OPTIONAL ###

        optional.add_argument('--model',
                            help='Model for RAxML',
                            default="GTRGAMMAI",
                            required=False)

        optional.add_argument('--ml_inference',
                             help="Choose which program should run the ML-Tree calculation 'RAxML' or 'IQTree'",
                             default='RAxML',
                             required=False)

        optional.add_argument('--path_iqtree',
                            help='absolute path to the iqtree executable',
                            default="iqtree",
                            required=False)

        optional.add_argument('--path_raxml',
                            help='absolute path to the raxml executable',
                            default="raxmlHPC",
                            required=False)

        optional.add_argument('--au_inference',
                             help="Choose program for AU-test calculation 'CONSEL' or 'IQTree' or 'IQTree2', multiple selection possible by ';' as delimiter, e.g. 'CONSEL;IQTree'",
                             default='CONSEL',
                             required=False)

        optional.add_argument('--path_consel',
                              help='path to consel executables',
                              required=False)

        optional.add_argument('--path_iqtree2',
                            help='absolute path to the iqtree2 executable',
                            default=False,
                            required=False)

        optional.add_argument('--latex_format',
                             help='',
                             default=False,
                             action='store_true',
                             required=False)

        optional.add_argument('--thread_number',
                             help="Number of maximal used threads",
                             default='1',
                             required=False)

        optional.add_argument('--version',
                            help='print version number and exit',
                            action='version',
                            version='%(prog)s ' + __version__)

        args = parser.parse_args()

        FAAUTeCMain.faautec(args.alignment,
                            args.constraint,
                            args.path_consel,
                            args.model,
                            args.ml_inference,
                            args.au_inference,
                            args.thread_number,
                            args.path_iqtree2,
                            args.path_iqtree,
                            args.path_raxml,
                            args.latex_format)

########
# MAIN #
########

def start_faautec():
    CLI()

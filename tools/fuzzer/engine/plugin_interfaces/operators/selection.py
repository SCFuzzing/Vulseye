#!/usr/bin/env python
# -*- coding: utf-8 -*-

''' Module for Genetic Algorithm selection operator class '''

from ..metaclasses import SelectionMeta

class Selection(metaclass=SelectionMeta):
    '''
    Class for providing an interface to easily extend the behavior of selection
    operation.
    '''

    def select(self, population):
        '''
        Called when we need to select parents from a population to later breeding.

        :param population: The current population.
        :type population: Population

        :return parents: Two selected individuals for crossover.
        :type parents: Tuple of tow GAIndividual objects.
        '''
        raise NotImplementedError

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from random import random, shuffle, choice
from itertools import accumulate
from bisect import bisect_right

from ...plugin_interfaces.operators.selection import Selection
from utils.utils import initialize_logger

from engine.fitness import fitness_function


class DataDependencyLinearRankingSelection(Selection):
    def __init__(self, env, pmin=0.1, pmax=0.9):
        self.env = env
        '''
        Selection operator using Linear Ranking selection method.

        Reference: Baker J E. Adaptive selection methods for genetic
        algorithms[C]//Proceedings of an International Conference on Genetic
        Algorithms and their applications. 1985: 101-111.
        '''
        # Selection probabilities for the worst and best individuals.
        self.logger = initialize_logger("Selection")
        self.pmin, self.pmax = pmin, pmax

    def select(self, population, fitness):
        '''
        Select a pair of parent individuals using linear ranking method.
        '''

        # Add rank to all individuals in population.
        all_fits = population.all_fits(fitness)
        indvs = population.individuals
        # print("all_fits: ", all_fits)
        # according to the fitness
        sorted_indvs = sorted(indvs, key=lambda indv: all_fits[indvs.index(indv)])
        # for no, ind in enumerate(sorted_indvs):

        #     print(f"sorted_indvs no.{no}: ", ind.normalized_score)

        # # Individual number.
        # NP = len(sorted_indvs)
        #
        # # Assign selection probabilities linearly.
        # # NOTE: Here the rank i belongs to {1, ..., N}
        # p = lambda i: (self.pmin + (self.pmax - self.pmin)*(i-1)/(NP-1))
        # probabilities = [self.pmin] + [p(i) for i in range(2, NP)] + [self.pmax]
        #
        # # Normalize probabilities.
        # psum = sum(probabilities)
        # wheel = list(accumulate([p/psum for p in probabilities]))

        # TODO: change the selection here

        psum = sum(all_fits)
        #print("psum: ", psum)
        #wheel = list(accumulate([indv.normalized_score/psum for indv in sorted_indvs]))
        wheel = list(accumulate([fitness_function(indv, self.env)/psum for indv in sorted_indvs]))
        #print("wheel: ", wheel)

        # Select parents.
        father_random = random()
        mother_random = random()
        father_idx = bisect_right(wheel, father_random)
        # print("father_random: ", father_random)
        # print("father_idx: ", father_idx)
        father = sorted_indvs[father_idx]
        mother_idx = bisect_right(wheel, mother_random)
        # print("mother_random: ", mother_random)
        # print("mother_idx: ", mother_idx)
        mother = sorted_indvs[mother_idx]

        '''father_reads, father_writes = DataDependencyLinearRankingSelection.extract_reads_and_writes(father, self.env)
        f_a = [i["arguments"][0] for i in father.chromosome]

        shuffle(indvs)
        for ind in indvs:
            i_a = [i["arguments"][0] for i in ind.chromosome]
            if f_a != i_a:
                i_reads, i_writes = DataDependencyLinearRankingSelection.extract_reads_and_writes(ind, self.env)
                if not i_reads.isdisjoint(father_writes) or not father_reads.isdisjoint(i_writes):
                    return father, ind'''

        #mother_idx = (father_idx + 1) % len(wheel)
        #mother = sorted_indvs[mother_idx]

        # self.logger.title("Father score: {}".format(father.seed_score))
        # self.logger.title("Mother score: {}".format(mother.seed_score))

        return father, mother

    @staticmethod
    def extract_reads_and_writes(individual, env):
        reads, writes = set(), set()

        for t in individual.chromosome:
            _function_hash = t["arguments"][0]
            if _function_hash in env.data_dependencies:
                reads.update(env.data_dependencies[_function_hash]["read"])
                writes.update(env.data_dependencies[_function_hash]["write"])

        return reads, writes

# -*- coding: utf-8 -*-
"""
Created on Wed Apr  6 21:23:54 2022

@author: Noah

This code is a python way to double check that I got the right answer
but in the haskell version for sum_three_five.hs
"""

def comp():

    x = []

    for i in range(1000):
        if (i%3==0 or i%5==0):
            x.append(i)

    return sum(x)


print(comp()) #prints 233168

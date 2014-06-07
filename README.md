prime-table
===========

Programming exercise for Funding Circle

Notes
Sieve of Eratosthenes is O(nlognlogn), pretty much the fastest prime number
finder there is.

Since all the primes and Sieve table is store in local memory, the scalability 
is limited to how much onboard memory there is. In addition, since we are only
able to output a single table, storing the entire multiplication table gets costly
and appending to the end everytime is costly as well.

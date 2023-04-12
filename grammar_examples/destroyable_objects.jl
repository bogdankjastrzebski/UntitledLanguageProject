
"""
Everything, that is possible to be run at compile-time, 
is being computed at compile-time. 

The key optimization is ability to change the memory,
that is required during run-time, i.e., removal of
fields, that are known at compile-time.

The fields can be used in runtime, as an escape.

For instance:
* type
* ref-count
* array length

It is possible, not to know a field value at any point in time.

We can definitelly previously know, and now don't.
We can also know now, but not previously.

"""







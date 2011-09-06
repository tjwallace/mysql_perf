!SLIDE bullets incremental

# What makes a query slow?

* Returning too much data
* Filtering un-indexed data (filesort)

!SLIDE bullets incremental

# What is an index?

* Allow fast lookups - better than O(n)
* MySQL uses [B-trees](http://en.wikipedia.org/wiki/B-tree) for most of its indexes
* ![B-tree](b-tree.png)
* O(log n) lookup

---
title: Order of Dunders & Imports (PEP8)
link: https://www.python.org/dev/peps/pep-0008/#module-level-dunder-names
date: 2020-03-09
---

<div class="section" id="module-level-dunder-names">
<h2>Module Level Dunder Names</h2>
<p>Module level "dunders" (i.e. names with two leading and two trailing
underscores) such as <tt class="docutils literal">__all__</tt>, <tt class="docutils literal">__author__</tt>, <tt class="docutils literal">__version__</tt>,
etc. should be placed after the module docstring but before any import
statements <em>except</em> <tt class="docutils literal">from __future__</tt> imports.  Python mandates that
future-imports must appear in the module before any other code except
docstrings:</p>
</div>

```py
"""This is the example module.

This module does stuff.
"""

from __future__ import barry_as_FLUFL

__all__ = ['a', 'b', 'c']
__version__ = '0.1'
__author__ = 'Cardinal Biggles'

import os
import sys
```

---
title: Underscores in Naming Convention (PEP8)
link: https://www.python.org/dev/peps/pep-0008/#descriptive-naming-styles
date: 2020-03-09
---

<h2>Usage of Underscores in Python Naming Convention</h2>
<ul>
<li><p class="first"><tt class="docutils literal">_single_leading_underscore</tt>: weak "internal use" indicator.
E.g. <tt class="docutils literal">from M import *</tt> does not import objects whose names start
with an underscore.</p>
</li>
<li><p class="first"><tt class="docutils literal">single_trailing_underscore_</tt>: used by convention to avoid
conflicts with Python keyword, e.g.</p>
<pre class="literal-block">
Tkinter.Toplevel(master, class_='ClassName')
</pre>
</li>
<li><p class="first"><tt class="docutils literal">__double_leading_underscore</tt>: when naming a class attribute,
invokes name mangling (inside class FooBar, <tt class="docutils literal">__boo</tt> becomes
<tt class="docutils literal">_FooBar__boo</tt>; can still be accessed by force using mangled name).</p>
</li>
<li><p class="first"><tt class="docutils literal">__double_leading_and_trailing_underscore__</tt>: "magic" objects or
attributes that live in user-controlled namespaces.
E.g. <tt class="docutils literal">__init__</tt>, <tt class="docutils literal">__import__</tt> or <tt class="docutils literal">__file__</tt>.  Never invent
such names; only use them as documented.</p>
</li>
</ul>

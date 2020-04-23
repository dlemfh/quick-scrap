---
title: Writing/Catching Exceptions in Python (PEP8)
link: https://www.python.org/dev/peps/pep-0008/#programming-recommendations
date: 2020-03-09
---

<h3>Writing Exceptions</h3>
<p class="first"><mark>Derive exceptions from <tt class="docutils literal">Exception</tt> </mark> rather than <tt class="docutils literal">BaseException</tt>.
Direct inheritance from <tt class="docutils literal">BaseException</tt> is reserved for exceptions
where catching them is almost always the wrong thing to do.</p>
<p>Design exception hierarchies based on the distinctions that code
<em>catching</em> the exceptions is likely to need, rather than the locations
where the exceptions are raised. <mark> Aim to answer the question
"What went wrong?" </mark> programmatically, rather than only stating that
"A problem occurred" (see <a class="reference external" href="https://www.python.org/dev/peps/pep-3151/">PEP 3151</a> for an example of this lesson being
learned for the builtin exception hierarchy).</p>
<p>Class naming conventions apply here, although you should <mark> add the
suffix "Error" to your exception classes if the exception is an
error. </mark>  Non-error exceptions that are used for non-local flow control
or other forms of signaling need no special suffix.</p>

<h3>Catching Exceptions</h3>
<p class="first">When catching exceptions, <mark> mention specific exceptions whenever
possible </mark> instead of using a bare <tt class="docutils literal">except:</tt> clause:</p>
<pre class="literal-block">
try:
    import platform_specific_module
except ImportError:
    platform_specific_module = None
</pre>
<p>A bare <tt class="docutils literal">except:</tt> clause will catch SystemExit and
KeyboardInterrupt exceptions, making it harder to interrupt a
program with Control-C, and can disguise other problems.  <mark> Use
<tt class="docutils literal">except Exception</tt> </mark> if you
want to catch all exceptions that signal program errors. (Bare except is equivalent to <tt class="docutils literal">except
BaseException</tt>.)</p>
<p>A good rule of thumb is to limit use of bare 'except' clauses to two
cases:</p>
<ol class="arabic simple">
<li>If the exception handler will be printing out or logging the
traceback; at least the user will be aware that an error has
occurred.</li>
<li>If the code needs to do some cleanup work, but then lets the
exception propagate upwards with <tt class="docutils literal">raise</tt>.  <tt class="docutils literal"><span class="pre">try...finally</span></tt>
can be a better way to handle this case.</li>
</ol>

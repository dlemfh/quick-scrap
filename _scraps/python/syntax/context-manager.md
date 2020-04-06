---
title: Context Managers in Python
link: https://docs.python-guide.org/writing/structure/#context-managers
date: 2020-02-18
---

<div class="section" id="context-managers">
<h2>Context Managers<a class="headerlink" href="#context-managers" title="Permalink to this headline">¶</a></h2>
<p>A context manager is a Python object that provides extra contextual information
to an action. This extra information takes the form of running a callable upon
initiating the context using the <code class="docutils literal notranslate"><span class="pre">with</span></code> statement, as well as running a callable
upon completing all the code inside the <code class="docutils literal notranslate"><span class="pre">with</span></code> block. The most well known
example of using a context manager is shown here, opening on a file:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="k">with</span> <span class="nb">open</span><span class="p">(</span><span class="s1">&#39;file.txt&#39;</span><span class="p">)</span> <span class="k">as</span> <span class="n">f</span><span class="p">:</span>
    <span class="n">contents</span> <span class="o">=</span> <span class="n">f</span><span class="o">.</span><span class="n">read</span><span class="p">()</span>
</pre></div>
</div>
<p>Anyone familiar with this pattern knows that invoking <code class="docutils literal notranslate"><span class="pre">open</span></code> in this fashion
ensures that <code class="docutils literal notranslate"><span class="pre">f</span></code>’s <code class="docutils literal notranslate"><span class="pre">close</span></code> method will be called at some point. This reduces
a developer’s cognitive load and makes the code easier to read.</p>
<p>There are two easy ways to implement this functionality yourself: using a class
or using a generator. Let’s implement the above functionality ourselves, starting
with the class approach:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="k">class</span> <span class="nc">CustomOpen</span><span class="p">(</span><span class="nb">object</span><span class="p">):</span>
    <span class="k">def</span> <span class="fm">__init__</span><span class="p">(</span><span class="bp">self</span><span class="p">,</span> <span class="n">filename</span><span class="p">):</span>
        <span class="bp">self</span><span class="o">.</span><span class="n">file</span> <span class="o">=</span> <span class="nb">open</span><span class="p">(</span><span class="n">filename</span><span class="p">)</span>

    <span class="k">def</span> <span class="fm">__enter__</span><span class="p">(</span><span class="bp">self</span><span class="p">):</span>
        <span class="k">return</span> <span class="bp">self</span><span class="o">.</span><span class="n">file</span>

    <span class="k">def</span> <span class="fm">__exit__</span><span class="p">(</span><span class="bp">self</span><span class="p">,</span> <span class="n">ctx_type</span><span class="p">,</span> <span class="n">ctx_value</span><span class="p">,</span> <span class="n">ctx_traceback</span><span class="p">):</span>
        <span class="bp">self</span><span class="o">.</span><span class="n">file</span><span class="o">.</span><span class="n">close</span><span class="p">()</span>

<span class="k">with</span> <span class="n">CustomOpen</span><span class="p">(</span><span class="s1">&#39;file&#39;</span><span class="p">)</span> <span class="k">as</span> <span class="n">f</span><span class="p">:</span>
    <span class="n">contents</span> <span class="o">=</span> <span class="n">f</span><span class="o">.</span><span class="n">read</span><span class="p">()</span>
</pre></div>
</div>
<p>This is just a regular Python object with two extra methods that are used
by the <code class="docutils literal notranslate"><span class="pre">with</span></code> statement. CustomOpen is first instantiated and then its
<code class="docutils literal notranslate"><span class="pre">__enter__</span></code> method is called and whatever <code class="docutils literal notranslate"><span class="pre">__enter__</span></code> returns is assigned to
<code class="docutils literal notranslate"><span class="pre">f</span></code> in the <code class="docutils literal notranslate"><span class="pre">as</span> <span class="pre">f</span></code> part of the statement. When the contents of the <code class="docutils literal notranslate"><span class="pre">with</span></code> block
is finished executing, the <code class="docutils literal notranslate"><span class="pre">__exit__</span></code> method is then called.</p>
<p>And now the generator approach using Python’s own
<a class="reference external" href="https://docs.python.org/3/library/contextlib.html">contextlib</a>:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="kn">from</span> <span class="nn">contextlib</span> <span class="kn">import</span> <span class="n">contextmanager</span>

<span class="nd">@contextmanager</span>
<span class="k">def</span> <span class="nf">custom_open</span><span class="p">(</span><span class="n">filename</span><span class="p">):</span>
    <span class="n">f</span> <span class="o">=</span> <span class="nb">open</span><span class="p">(</span><span class="n">filename</span><span class="p">)</span>
    <span class="k">try</span><span class="p">:</span>
        <span class="k">yield</span> <span class="n">f</span>
    <span class="k">finally</span><span class="p">:</span>
        <span class="n">f</span><span class="o">.</span><span class="n">close</span><span class="p">()</span>

<span class="k">with</span> <span class="n">custom_open</span><span class="p">(</span><span class="s1">&#39;file&#39;</span><span class="p">)</span> <span class="k">as</span> <span class="n">f</span><span class="p">:</span>
    <span class="n">contents</span> <span class="o">=</span> <span class="n">f</span><span class="o">.</span><span class="n">read</span><span class="p">()</span>
</pre></div>
</div>
<p>This works in exactly the same way as the class example above, albeit it’s
more terse. The <code class="docutils literal notranslate"><span class="pre">custom_open</span></code> function executes until it reaches the <code class="docutils literal notranslate"><span class="pre">yield</span></code>
statement. It then gives control back to the <code class="docutils literal notranslate"><span class="pre">with</span></code> statement, which assigns
whatever was <code class="docutils literal notranslate"><span class="pre">yield</span></code>’ed to <cite>f</cite> in the <code class="docutils literal notranslate"><span class="pre">as</span> <span class="pre">f</span></code> portion. The <code class="docutils literal notranslate"><span class="pre">finally</span></code> clause
ensures that <code class="docutils literal notranslate"><span class="pre">close()</span></code> is called whether or not there was an exception inside
the <code class="docutils literal notranslate"><span class="pre">with</span></code>.</p>
<p>Since the two approaches appear the same, we should follow the Zen of Python
to decide when to use which. The class approach might be better if there’s
a considerable amount of logic to encapsulate. The function approach
might be better for situations where we’re dealing with a simple action.</p>
</div>

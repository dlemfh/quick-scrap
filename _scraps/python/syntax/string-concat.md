---
title: String Concatenation in Python
link: https://docs.python-guide.org/writing/structure/#mutable-and-immutable-types
date: 2020-02-18
---

<div class="section" id="mutable-and-immutable-types">
<h2>String Concat</h2>
<p>One peculiarity of Python that can surprise beginners is that
strings are immutable. This means that when constructing a string from
its parts, appending each part to the string is inefficient because
the entirety of the string is copied on each append.
Instead, it is much more efficient to accumulate the parts in a list,
which is mutable, and then glue (<code class="docutils literal notranslate"><span class="pre">join</span></code>) the parts together when the
full string is needed. List comprehensions are usually the fastest and
most idiomatic way to do this.</p>
<p><strong>Bad</strong></p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="c1"># create a concatenated string from 0 to 19 (e.g. &quot;012..1819&quot;)</span>
<span class="n">nums</span> <span class="o">=</span> <span class="s2">&quot;&quot;</span>
<span class="k">for</span> <span class="n">n</span> <span class="ow">in</span> <span class="nb">range</span><span class="p">(</span><span class="mi">20</span><span class="p">):</span>
    <span class="n">nums</span> <span class="o">+=</span> <span class="nb">str</span><span class="p">(</span><span class="n">n</span><span class="p">)</span>   <span class="c1"># slow and inefficient</span>
<span class="k">print</span> <span class="n">nums</span>
</pre></div>
</div>
<p><strong>Better</strong></p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="c1"># create a concatenated string from 0 to 19 (e.g. &quot;012..1819&quot;)</span>
<span class="n">nums</span> <span class="o">=</span> <span class="p">[]</span>
<span class="k">for</span> <span class="n">n</span> <span class="ow">in</span> <span class="nb">range</span><span class="p">(</span><span class="mi">20</span><span class="p">):</span>
    <span class="n">nums</span><span class="o">.</span><span class="n">append</span><span class="p">(</span><span class="nb">str</span><span class="p">(</span><span class="n">n</span><span class="p">))</span>
<span class="k">print</span> <span class="s2">&quot;&quot;</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">nums</span><span class="p">)</span>  <span class="c1"># much more efficient</span>
</pre></div>
</div>
<p><strong>Best</strong></p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="c1"># create a concatenated string from 0 to 19 (e.g. &quot;012..1819&quot;)</span>
<span class="n">nums</span> <span class="o">=</span> <span class="p">[</span><span class="nb">str</span><span class="p">(</span><span class="n">n</span><span class="p">)</span> <span class="k">for</span> <span class="n">n</span> <span class="ow">in</span> <span class="nb">range</span><span class="p">(</span><span class="mi">20</span><span class="p">)]</span>
<span class="k">print</span> <span class="s2">&quot;&quot;</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">nums</span><span class="p">)</span>
</pre></div>
</div>
<p>One final thing to mention about strings is that using <code class="docutils literal notranslate"><span class="pre">join()</span></code> is not always
best. In the instances where you are creating a new string from a pre-determined
number of strings, using the addition operator is actually faster, but in cases
like above or in cases where you are adding to an existing string, using
<code class="docutils literal notranslate"><span class="pre">join()</span></code> should be your preferred method.</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="n">foo</span> <span class="o">=</span> <span class="s1">&#39;foo&#39;</span>
<span class="n">bar</span> <span class="o">=</span> <span class="s1">&#39;bar&#39;</span>

<span class="n">foobar</span> <span class="o">=</span> <span class="n">foo</span> <span class="o">+</span> <span class="n">bar</span>  <span class="c1"># This is good</span>
<span class="n">foo</span> <span class="o">+=</span> <span class="s1">&#39;ooo&#39;</span>  <span class="c1"># This is bad, instead you should do:</span>
<span class="n">foo</span> <span class="o">=</span> <span class="s1">&#39;&#39;</span><span class="o">.</span><span class="n">join</span><span class="p">([</span><span class="n">foo</span><span class="p">,</span> <span class="s1">&#39;ooo&#39;</span><span class="p">])</span>
</pre></div>
</div>
<div class="admonition note">
<h3 class="first admonition-title">Note</h3>
<p class="last">You can also use the <a class="reference external" href="https://docs.python.org/3/library/string.html#string-formatting" title="(in Python v3.8)"><span class="xref std std-ref">%</span></a> formatting operator
to concatenate a pre-determined number of strings besides <a class="reference external" href="https://docs.python.org/3/library/stdtypes.html#str.join" title="(in Python v3.8)"><code class="xref py py-meth docutils literal notranslate"><span class="pre">str.join()</span></code></a>
and <code class="docutils literal notranslate"><span class="pre">+</span></code>. However, <span class="target" id="index-0"></span><a class="pep reference external" href="https://www.python.org/dev/peps/pep-3101"><strong>PEP 3101</strong></a> discourages the usage of the <code class="docutils literal notranslate"><span class="pre">%</span></code> operator
in favor of the <a class="reference external" href="https://docs.python.org/3/library/stdtypes.html#str.format" title="(in Python v3.8)"><code class="xref py py-meth docutils literal notranslate"><span class="pre">str.format()</span></code></a> method.</p>
</div>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="n">foo</span> <span class="o">=</span> <span class="s1">&#39;foo&#39;</span>
<span class="n">bar</span> <span class="o">=</span> <span class="s1">&#39;bar&#39;</span>

<span class="n">foobar</span> <span class="o">=</span> <span class="s1">&#39;</span><span class="si">%s%s</span><span class="s1">&#39;</span> <span class="o">%</span> <span class="p">(</span><span class="n">foo</span><span class="p">,</span> <span class="n">bar</span><span class="p">)</span> <span class="c1"># It is OK</span>
<span class="n">foobar</span> <span class="o">=</span> <span class="s1">&#39;{0}{1}&#39;</span><span class="o">.</span><span class="n">format</span><span class="p">(</span><span class="n">foo</span><span class="p">,</span> <span class="n">bar</span><span class="p">)</span> <span class="c1"># It is better</span>
<span class="n">foobar</span> <span class="o">=</span> <span class="s1">&#39;{foo}{bar}&#39;</span><span class="o">.</span><span class="n">format</span><span class="p">(</span><span class="n">foo</span><span class="o">=</span><span class="n">foo</span><span class="p">,</span> <span class="n">bar</span><span class="o">=</span><span class="n">bar</span><span class="p">)</span> <span class="c1"># It is best</span>
</pre></div>
</div>
</div>

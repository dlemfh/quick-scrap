---
title: Python Modules for Testing
link: https://docs.python-guide.org/writing/tests/
date: 2020-02-18
---

<div class="section" id="the-basics">
<h2>The Basics<a class="headerlink" href="#the-basics" title="Permalink to this headline">¶</a></h2>
<div class="section" id="unittest">
<h3>unittest<a class="headerlink" href="#unittest" title="Permalink to this headline">¶</a></h3>
<p><a class="reference external" href="https://docs.python.org/3/library/unittest.html#module-unittest" title="(in Python v3.8)"><code class="xref py py-mod docutils literal notranslate"><span class="pre">unittest</span></code></a> is the batteries-included test module in the Python standard
library. Its API will be familiar to anyone who has used any of the
JUnit/nUnit/CppUnit series of tools.</p>
<p>Creating test cases is accomplished by subclassing <a class="reference external" href="https://docs.python.org/3/library/unittest.html#unittest.TestCase" title="(in Python v3.8)"><code class="xref py py-class docutils literal notranslate"><span class="pre">unittest.TestCase</span></code></a>.</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="kn">import</span> <span class="nn">unittest</span>

<span class="k">def</span> <span class="nf">fun</span><span class="p">(</span><span class="n">x</span><span class="p">):</span>
    <span class="k">return</span> <span class="n">x</span> <span class="o">+</span> <span class="mi">1</span>

<span class="k">class</span> <span class="nc">MyTest</span><span class="p">(</span><span class="n">unittest</span><span class="o">.</span><span class="n">TestCase</span><span class="p">):</span>
    <span class="k">def</span> <span class="nf">test</span><span class="p">(</span><span class="bp">self</span><span class="p">):</span>
        <span class="bp">self</span><span class="o">.</span><span class="n">assertEqual</span><span class="p">(</span><span class="n">fun</span><span class="p">(</span><span class="mi">3</span><span class="p">),</span> <span class="mi">4</span><span class="p">)</span>
</pre></div>
</div>
<p>As of Python 2.7 unittest also includes its own test discovery mechanisms.</p>
<blockquote>
<div><a class="reference external" href="http://docs.python.org/library/unittest.html">unittest in the standard library documentation</a></div></blockquote>
</div>
<div class="section" id="doctest">
<h3>Doctest<a class="headerlink" href="#doctest" title="Permalink to this headline">¶</a></h3>
<p>The <a class="reference external" href="https://docs.python.org/3/library/doctest.html#module-doctest" title="(in Python v3.8)"><code class="xref py py-mod docutils literal notranslate"><span class="pre">doctest</span></code></a> module searches for pieces of text that look like interactive
Python sessions in docstrings, and then executes those sessions to verify that
they work exactly as shown.</p>
<p>Doctests have a different use case than proper unit tests: they are usually
less detailed and don’t catch special cases or obscure regression bugs. They
are useful as an expressive documentation of the main use cases of a module and
its components. However, doctests should run automatically each time the full
test suite runs.</p>
<p>A simple doctest in a function:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="k">def</span> <span class="nf">square</span><span class="p">(</span><span class="n">x</span><span class="p">):</span>
    <span class="sd">&quot;&quot;&quot;Return the square of x.</span>

<span class="sd">    &gt;&gt;&gt; square(2)</span>
<span class="sd">    4</span>
<span class="sd">    &gt;&gt;&gt; square(-2)</span>
<span class="sd">    4</span>
<span class="sd">    &quot;&quot;&quot;</span>

    <span class="k">return</span> <span class="n">x</span> <span class="o">*</span> <span class="n">x</span>

<span class="k">if</span> <span class="vm">__name__</span> <span class="o">==</span> <span class="s1">&#39;__main__&#39;</span><span class="p">:</span>
    <span class="kn">import</span> <span class="nn">doctest</span>
    <span class="n">doctest</span><span class="o">.</span><span class="n">testmod</span><span class="p">()</span>
</pre></div>
</div>
<p>When running this module from the command line as in <code class="docutils literal notranslate"><span class="pre">python</span> <span class="pre">module.py</span></code>, the
doctests will run and complain if anything is not behaving as described in the
docstrings.</p>
</div>
</div>
<div class="section" id="tools">
<h2>Tools<a class="headerlink" href="#tools" title="Permalink to this headline">¶</a></h2>
<div class="section" id="py-test">
<h3>py.test<a class="headerlink" href="#py-test" title="Permalink to this headline">¶</a></h3>
<p>py.test is a no-boilerplate alternative to Python’s standard unittest module.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre><span></span><span class="gp">$</span> pip install pytest
</pre></div>
</div>
<p>Despite being a fully-featured and extensible test tool, it boasts a simple
syntax. Creating a test suite is as easy as writing a module with a couple of
functions:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="c1"># content of test_sample.py</span>
<span class="k">def</span> <span class="nf">func</span><span class="p">(</span><span class="n">x</span><span class="p">):</span>
    <span class="k">return</span> <span class="n">x</span> <span class="o">+</span> <span class="mi">1</span>

<span class="k">def</span> <span class="nf">test_answer</span><span class="p">():</span>
    <span class="k">assert</span> <span class="n">func</span><span class="p">(</span><span class="mi">3</span><span class="p">)</span> <span class="o">==</span> <span class="mi">5</span>
</pre></div>
</div>
<p>and then running the <cite>py.test</cite> command:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre><span></span><span class="gp">$</span> py.test
<span class="go">=========================== test session starts ============================</span>
<span class="go">platform darwin -- Python 2.7.1 -- pytest-2.2.1</span>
<span class="go">collecting ... collected 1 items</span>

<span class="go">test_sample.py F</span>

<span class="go">================================= FAILURES =================================</span>
<span class="go">_______________________________ test_answer ________________________________</span>

<span class="go">    def test_answer():</span>
<span class="gp">&gt;</span>       assert func<span class="o">(</span><span class="m">3</span><span class="o">)</span> <span class="o">==</span> <span class="m">5</span>
<span class="go">E       assert 4 == 5</span>
<span class="go">E        +  where 4 = func(3)</span>

<span class="go">test_sample.py:5: AssertionError</span>
<span class="go">========================= 1 failed in 0.02 seconds =========================</span>
</pre></div>
</div>
<p>is far less work than would be required for the equivalent functionality with
the unittest module!</p>
<blockquote>
<div><a class="reference external" href="https://docs.pytest.org/en/latest/">py.test</a></div></blockquote>
</div>
<div class="section" id="hypothesis">
<h3>Hypothesis<a class="headerlink" href="#hypothesis" title="Permalink to this headline">¶</a></h3>
<p>Hypothesis is a library which lets you write tests that are parameterized by
a source of examples.  It then generates simple and comprehensible examples
that make your tests fail, letting you find more bugs with less work.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre><span></span><span class="gp">$</span> pip install hypothesis
</pre></div>
</div>
<p>For example, testing lists of floats will try many examples, but report the
minimal example of each bug (distinguished exception type and location):</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="nd">@given</span><span class="p">(</span><span class="n">lists</span><span class="p">(</span><span class="n">floats</span><span class="p">(</span><span class="n">allow_nan</span><span class="o">=</span><span class="bp">False</span><span class="p">,</span> <span class="n">allow_infinity</span><span class="o">=</span><span class="bp">False</span><span class="p">),</span> <span class="n">min_size</span><span class="o">=</span><span class="mi">1</span><span class="p">))</span>
<span class="k">def</span> <span class="nf">test_mean</span><span class="p">(</span><span class="n">xs</span><span class="p">):</span>
    <span class="n">mean</span> <span class="o">=</span> <span class="nb">sum</span><span class="p">(</span><span class="n">xs</span><span class="p">)</span> <span class="o">/</span> <span class="nb">len</span><span class="p">(</span><span class="n">xs</span><span class="p">)</span>
    <span class="k">assert</span> <span class="nb">min</span><span class="p">(</span><span class="n">xs</span><span class="p">)</span> <span class="o">&lt;=</span> <span class="n">mean</span><span class="p">(</span><span class="n">xs</span><span class="p">)</span> <span class="o">&lt;=</span> <span class="nb">max</span><span class="p">(</span><span class="n">xs</span><span class="p">)</span>
</pre></div>
</div>
<div class="highlight-none notranslate"><div class="highlight"><pre><span></span>Falsifying example: test_mean(
    xs=[1.7976321109618856e+308, 6.102390043022755e+303]
)
</pre></div>
</div>
<p>Hypothesis is practical as well as very powerful and will often find bugs
that escaped all other forms of testing.  It integrates well with py.test,
and has a strong focus on usability in both simple and advanced scenarios.</p>
<blockquote>
<div><a class="reference external" href="https://hypothesis.readthedocs.io/en/latest/">hypothesis</a></div></blockquote>
</div>
<div class="section" id="tox">
<h3>tox<a class="headerlink" href="#tox" title="Permalink to this headline">¶</a></h3>
<p>tox is a tool for automating test environment management and testing against
multiple interpreter configurations.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre><span></span><span class="gp">$</span> pip install tox
</pre></div>
</div>
<p>tox allows you to configure complicated multi-parameter test matrices via a
simple INI-style configuration file.</p>
<blockquote>
<div><a class="reference external" href="https://tox.readthedocs.io/en/latest/">tox</a></div></blockquote>
</div>
<div class="section" id="unittest2">
<h3>Unittest2<a class="headerlink" href="#unittest2" title="Permalink to this headline">¶</a></h3>
<p>unittest2 is a backport of Python 2.7’s unittest module which has an improved
API and better assertions over the one available in previous versions of Python.</p>
<p>If you’re using Python 2.6 or below, you can install it with pip:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre><span></span><span class="gp">$</span> pip install unittest2
</pre></div>
</div>
<p>You may want to import the module under the name unittest to make porting code
to newer versions of the module easier in the future</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="kn">import</span> <span class="nn">unittest2</span> <span class="kn">as</span> <span class="nn">unittest</span>

<span class="k">class</span> <span class="nc">MyTest</span><span class="p">(</span><span class="n">unittest</span><span class="o">.</span><span class="n">TestCase</span><span class="p">):</span>
    <span class="o">...</span>
</pre></div>
</div>
<p>This way if you ever switch to a newer Python version and no longer need the
unittest2 module, you can simply change the import in your test module without
the need to change any other code.</p>
<blockquote>
<div><a class="reference external" href="http://pypi.org/project/unittest2">unittest2</a></div></blockquote>
</div>
<div class="section" id="mock">
<h3>mock<a class="headerlink" href="#mock" title="Permalink to this headline">¶</a></h3>
<p><a class="reference external" href="https://docs.python.org/3/library/unittest.mock.html#module-unittest.mock" title="(in Python v3.8)"><code class="xref py py-mod docutils literal notranslate"><span class="pre">unittest.mock</span></code></a> is a library for testing in Python. As of Python 3.3, it is
available in the
<a class="reference external" href="https://docs.python.org/dev/library/unittest.mock">standard library</a>.</p>
<p>For older versions of Python:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre><span></span><span class="gp">$</span> pip install mock
</pre></div>
</div>
<p>It allows you to replace parts of your system under test with mock objects and
make assertions about how they have been used.</p>
<p>For example, you can monkey-patch a method:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="kn">from</span> <span class="nn">mock</span> <span class="kn">import</span> <span class="n">MagicMock</span>
<span class="n">thing</span> <span class="o">=</span> <span class="n">ProductionClass</span><span class="p">()</span>
<span class="n">thing</span><span class="o">.</span><span class="n">method</span> <span class="o">=</span> <span class="n">MagicMock</span><span class="p">(</span><span class="n">return_value</span><span class="o">=</span><span class="mi">3</span><span class="p">)</span>
<span class="n">thing</span><span class="o">.</span><span class="n">method</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span> <span class="mi">4</span><span class="p">,</span> <span class="mi">5</span><span class="p">,</span> <span class="n">key</span><span class="o">=</span><span class="s1">&#39;value&#39;</span><span class="p">)</span>

<span class="n">thing</span><span class="o">.</span><span class="n">method</span><span class="o">.</span><span class="n">assert_called_with</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span> <span class="mi">4</span><span class="p">,</span> <span class="mi">5</span><span class="p">,</span> <span class="n">key</span><span class="o">=</span><span class="s1">&#39;value&#39;</span><span class="p">)</span>
</pre></div>
</div>
<p>To mock classes or objects in a module under test, use the <code class="docutils literal notranslate"><span class="pre">patch</span></code> decorator.
In the example below, an external search system is replaced with a mock that
always returns the same result (but only for the duration of the test).</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="k">def</span> <span class="nf">mock_search</span><span class="p">(</span><span class="bp">self</span><span class="p">):</span>
    <span class="k">class</span> <span class="nc">MockSearchQuerySet</span><span class="p">(</span><span class="n">SearchQuerySet</span><span class="p">):</span>
        <span class="k">def</span> <span class="fm">__iter__</span><span class="p">(</span><span class="bp">self</span><span class="p">):</span>
            <span class="k">return</span> <span class="nb">iter</span><span class="p">([</span><span class="s2">&quot;foo&quot;</span><span class="p">,</span> <span class="s2">&quot;bar&quot;</span><span class="p">,</span> <span class="s2">&quot;baz&quot;</span><span class="p">])</span>
    <span class="k">return</span> <span class="n">MockSearchQuerySet</span><span class="p">()</span>

<span class="c1"># SearchForm here refers to the imported class reference in myapp,</span>
<span class="c1"># not where the SearchForm class itself is imported from</span>
<span class="nd">@mock.patch</span><span class="p">(</span><span class="s1">&#39;myapp.SearchForm.search&#39;</span><span class="p">,</span> <span class="n">mock_search</span><span class="p">)</span>
<span class="k">def</span> <span class="nf">test_new_watchlist_activities</span><span class="p">(</span><span class="bp">self</span><span class="p">):</span>
    <span class="c1"># get_search_results runs a search and iterates over the result</span>
    <span class="bp">self</span><span class="o">.</span><span class="n">assertEqual</span><span class="p">(</span><span class="nb">len</span><span class="p">(</span><span class="n">myapp</span><span class="o">.</span><span class="n">get_search_results</span><span class="p">(</span><span class="n">q</span><span class="o">=</span><span class="s2">&quot;fish&quot;</span><span class="p">)),</span> <span class="mi">3</span><span class="p">)</span>
</pre></div>
</div>
<p>Mock has many other ways you can configure it and control its behavior.</p>
<blockquote>
<div><a class="reference external" href="http://www.voidspace.org.uk/python/mock/">mock</a></div></blockquote>
</div>
</div>

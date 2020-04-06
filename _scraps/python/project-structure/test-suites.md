---
title: Project Structure for Test Suites
link: https://docs.python-guide.org/writing/structure/#test-suite
date: 2020-02-18
---

<div class="section" id="test-suite">
<h3>Test Suite<a class="headerlink" href="#test-suite" title="Permalink to this headline">¶</a></h3>
<table class="colwidths-given docutils">
<colgroup>
<col width="33%" />
<col width="67%" />
</colgroup>
<tbody valign="top">
<tr class="row-odd"><td>Location</td>
<td><code class="docutils literal notranslate"><span class="pre">./test_sample.py</span></code> or <code class="docutils literal notranslate"><span class="pre">./tests</span></code></td>
</tr>
<tr class="row-even"><td>Purpose</td>
<td>Package integration and unit tests.</td>
</tr>
</tbody>
</table>
<p>Starting out, a small test suite will often exist in a single file:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="o">./</span><span class="n">test_sample</span><span class="o">.</span><span class="n">py</span>
</pre></div>
</div>
<p>Once a test suite grows, you can move your tests to a directory, like
so:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">tests</span><span class="o">/</span><span class="n">test_basic</span><span class="o">.</span><span class="n">py</span>
<span class="n">tests</span><span class="o">/</span><span class="n">test_advanced</span><span class="o">.</span><span class="n">py</span>
</pre></div>
</div>
<p>Obviously, these test modules must import your packaged module to test
it. You can do this a few ways:</p>
<ul class="simple">
<li>Expect the package to be installed in site-packages.</li>
<li>Use a simple (but <em>explicit</em>) path modification to resolve the
package properly.</li>
</ul>
<p>I highly recommend the latter. Requiring a developer to run
<code class="docutils literal notranslate"><span class="pre">setup.py</span> <span class="pre">develop</span></code> to test an actively changing
codebase also requires them to have an isolated environment setup for
each instance of the codebase.</p>
<p>To give the individual tests import context, create a <code class="docutils literal notranslate"><span class="pre">tests/context.py</span></code>
file:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="kn">import</span> <span class="nn">os</span>
<span class="kn">import</span> <span class="nn">sys</span>
<span class="n">sys</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">insert</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">abspath</span><span class="p">(</span><span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">dirname</span><span class="p">(</span><span class="vm">__file__</span><span class="p">),</span> <span class="s1">&#39;..&#39;</span><span class="p">)))</span>

<span class="kn">import</span> <span class="nn">sample</span>
</pre></div>
</div>
<p>Then, within the individual test modules, import the module like so:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="kn">from</span> <span class="nn">.context</span> <span class="k">import</span> <span class="n">sample</span>
</pre></div>
</div>
<p>This will always work as expected, regardless of installation method.</p>
<p>Some people will assert that you should distribute your tests within
your module itself – I disagree. It often increases complexity for your
users; many test suites often require additional dependencies and
runtime contexts.</p>
</div>

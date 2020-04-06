---
title: Project Structure for Django Apps
link: https://docs.python-guide.org/writing/structure/#regarding-django-applications
date: 2020-02-18
---

<div class="section" id="regarding-django-applications">
<h3>Regarding Django Applications<a class="headerlink" href="#regarding-django-applications" title="Permalink to this headline">¶</a></h3>
<p>I’ve noticed a new trend in Django applications since the release of
Django 1.4. Many developers are structuring their repositories poorly
due to the new bundled application templates.</p>
<p>How? Well, they go to their bare and fresh repository and run the
following, as they always have:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>$ django-admin.py startproject samplesite
</pre></div>
</div>
<p>The resulting repository structure looks like this:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">README</span><span class="o">.</span><span class="n">rst</span>
<span class="n">samplesite</span><span class="o">/</span><span class="n">manage</span><span class="o">.</span><span class="n">py</span>
<span class="n">samplesite</span><span class="o">/</span><span class="n">samplesite</span><span class="o">/</span><span class="n">settings</span><span class="o">.</span><span class="n">py</span>
<span class="n">samplesite</span><span class="o">/</span><span class="n">samplesite</span><span class="o">/</span><span class="n">wsgi</span><span class="o">.</span><span class="n">py</span>
<span class="n">samplesite</span><span class="o">/</span><span class="n">samplesite</span><span class="o">/</span><span class="n">sampleapp</span><span class="o">/</span><span class="n">models</span><span class="o">.</span><span class="n">py</span>
</pre></div>
</div>
<p>Don’t do this.</p>
<p>Repetitive paths are confusing for both your tools and your developers.
Unnecessary nesting doesn’t help anybody (unless they’re nostalgic for
monolithic SVN repos).</p>
<p>Let’s do it properly:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>$ django-admin.py startproject samplesite .
</pre></div>
</div>
<p>Note the “<code class="docutils literal notranslate"><span class="pre">.</span></code>”.</p>
<p>The resulting structure:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">README</span><span class="o">.</span><span class="n">rst</span>
<span class="n">manage</span><span class="o">.</span><span class="n">py</span>
<span class="n">samplesite</span><span class="o">/</span><span class="n">settings</span><span class="o">.</span><span class="n">py</span>
<span class="n">samplesite</span><span class="o">/</span><span class="n">wsgi</span><span class="o">.</span><span class="n">py</span>
<span class="n">samplesite</span><span class="o">/</span><span class="n">sampleapp</span><span class="o">/</span><span class="n">models</span><span class="o">.</span><span class="n">py</span>
</pre></div>
</div>
</div>

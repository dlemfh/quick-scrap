#!/bin/bash

mkdir tmp

echo > index.md

# Make navigation tree
cd _scraps &&
	tree * --noreport -n > ../tmp/T1 &&
	cd ..
cat tmp/T1 | \
	sed '/\.md/! s/\S\+$/📂 \0/g' > tmp/T2
cat tmp/T2 | \
	sed '/\.md/ s/\S\+$/📄 [\0]/g' > tmp/T3
cat tmp/T3 | \
	awk '{if (/\.md/) {printf("%s[%d]\n", $0, ++i)} else {print $0}}' > tmp/T4
cat tmp/T4 | \
	awk '{print $0, "<br />"}' > tmp/T5
cat tmp/T5 | \
	sed 's/\.md//g' > tmp/T6
cat tmp/T6 | \
	sed 's/──/─\&nbsp;/g' > tmp/T7
cat tmp/T7 | \
	sed 's/^   /\&nbsp;\&nbsp;\&nbsp;/g' >> index.md

echo >> index.md

# Make reference links
find _scraps -name '*.md' | \
	sort | \
	sed 's|^_scraps/||g' | \
	sed 's|\.md$||g' | \
	awk '{printf("[%d]: %s\n", ++i, $0)}' >> index.md

echo >> index.md

rm -rf tmp

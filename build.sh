rm build/book.pdf

echo "Building"
echo > build/book.md

cat ./chapters/00_header.md >> build/book.md
echo "**BUILD DATE: " > chapters/00a_builddate.md
date >> chapters/00a_builddate.md
echo "**" >> chapters/00a_builddate.md
cat ./chapters/00a_builddate.md >> build/book.md
echo '\\newpage ** _Blank page_ **' >> build/book.md
#cat ./chapters/00b_dedication.md >> build/book.md
#echo '\\newpage ** _Blank page_ **' >> build/book.md


cat ./chapters/00_ChapterZero_WIP.md >> build/book.md
echo '\\newpage ** _Blank page_ **' >> build/book.md


cat ./chapters/00c_onOnePage.md >> build/book.md
echo '\\newpage ** _Blank page_ **' >> build/book.md


cat ./chapters/01_part1.md >> build/book.md
echo '\\newpage ** _Blank page_ **' >> build/book.md

cat ./chapters/02_part2_flows.md >> build/book.md
echo '\\newpage ** _Blank page_ **' >> build/book.md

cat ./chapters/03_part3.md >> build/book.md
echo '\\newpage ** _Blank page_ **' >> build/book.md

cat ./chapters/99_all.md >> build/book.md
echo '\\newpage ** _Blank page_ **' >> build/book.md

echo "Preproc"
python3 scripts/preproc.py -f build/book.md > build/book2.md
echo "- Done"

echo "Build 1/2"
#pandoc -V fontsize:14 --table-of-contents build/book.md -o build/book.pdf
pandoc --verbose \
    --table-of-contents \
    -Vnumbersections build/book2.md \
    -o build/book.pdf
echo "Done 1/2"

WORDCOUNT=(`ps2ascii build/book.pdf | grep -v '//' | wc -w`)

echo "WORDCOUNT = " $WORDCOUNT

#echo '\n\n\\newpage\n# End\nWORDS (excluding comments): '$WORDCOUNT >> build/book2.md
#echo '\nThe End :)' >> build/book2.md

#pandoc --verbose \
#    --table-of-contents \
##    --toc-depth=1 \
#    -Vnumbersections build/book2.md \
#    -o build/book.pdf
#echo "Done 2/2"
echo "Skipped 2/2 - but done"

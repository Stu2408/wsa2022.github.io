#!/bin/bash
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Uglify and compress JS & CSS
# Kieran Murphy 2016.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#set -x
# Setup dirs.
bin="/usr/local/bin/"
jsdir="../assets/js"
cssdir="../assets/css"
#
# Combine, Compress and create source map for JS.
echo "Uglifying JS..."
${bin}/uglifyjs ${jsdir}/plugins.js -o ${jsdir}/plugins-min.js
${bin}/uglifyjs ${jsdir}/functions.js -o ${jsdir}/functions-min.js
echo "How is ${jsdir} looking..."
ls -ltr ${jsdir}/plugins*.js ${jsdir}/functions*.js 
#
# Compress the main Styles CSS
echo "YUI Compressing CSS..."
${bin}/yuicompressor ../style.css -o ../style-min.css 
echo "How are 'styles' looking..."
ls -ltr ../styl*.css
#
# Combine and compress other CSS
${bin}/yuicompressor ${cssdir}/bootstrap.css -o ${cssdir}/bootstrap-min.css 
cat ${cssdir}/dark.css ${cssdir}/font-icons.css ${cssdir}/animate.css ${cssdir}/magnific-popup.css ${cssdir}/responsive.css ${cssdir}/colors.css > ${cssdir}/style-extra.css
${bin}/yuicompressor ${cssdir}/style-extra.css -o ${cssdir}/style-extra-min.css
echo "How is ${cssdir} looking..."
ls -ltr ${cssdir}/style*.css
#
echo "...Done."
#
# fin.
#